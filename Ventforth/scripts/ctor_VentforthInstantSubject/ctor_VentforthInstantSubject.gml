function VentforthInstantSubject(_sender = undefined) : VentforthSubject(_sender) constructor {
    static raise = function(_args = undefined, _sender = undefined) {
        _sender ??= default_sender;
        for (var i = 0, _count = array_length(subscriptions); i < _count; i++) {
            subscriptions[i].receive(_args, _sender);
        }
    }
    
    static send_pending = function() {
        // do nothing, all events are sent instantly anyway
    }
}
