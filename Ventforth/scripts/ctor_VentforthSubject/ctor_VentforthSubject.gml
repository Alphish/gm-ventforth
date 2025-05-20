function VentforthSubject(_sender = undefined) constructor {
    default_sender = _sender;
    subscriptions = [];
    
    static subscribe = function(_callback, _condition = undefined) {
        var _subscription = new VentforthCallbackSubscription(_callback, _condition);
        add_subscription(_subscription);
        return _subscription;
    }
    
    static add_subscription = function(_subscription) {
        _subscription.subject = self;
        _subscription.subject_idx = array_length(subscriptions);
        subscriptions[_subscription.subject_idx] = _subscription;
    }
    
    static remove_subscription = function(_subscription) {
        var _idx = array_get_index(subscriptions, _subscription);
        if (_idx >= 0)
            array_delete(subscriptions, _idx, 1);
    }
    
    static raise = function(_args = undefined, _sender = undefined) {
        throw VentforthException.not_implemented(this, nameof(raise));
    }
    
    static send_pending = function() {
        throw VentforthException.not_implemented(this, nameof(send_pending));
    }
}
