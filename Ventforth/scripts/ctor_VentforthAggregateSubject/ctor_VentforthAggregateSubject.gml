function VentforthAggregateSubject(_sender = undefined) : VentforthSubject(_sender) constructor {
    pending_events = [];
    
    static raise = function(_args = undefined, _sender = undefined) {
        _sender ??= default_sender;
        array_push(pending_events, { args: _args, sender: _sender });
    }
    
    static send_pending = function() {
        for (var i = 0, _count = array_length(subscriptions); i < _count; i++) {
            subscriptions[i].receive_many(pending_events);
        }
        array_resize(pending_events, 0);
    }
}
