function VentforthCallbackSubscription(_callback, _condition = undefined) : VentforthSubscription() constructor {
    callback = _callback;
    condition = _condition;
    
    static receive = function(_args, _sender) {
        if (!is_undefined(condition) && !condition(_args, _sender))
            return;
        
        callback(_args, _sender);
    }
}
