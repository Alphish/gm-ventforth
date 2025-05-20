function VentforthSubscription() constructor {
    subject = undefined;
    is_onetime = false;
    
    static handled_once = function() {
        is_onetime = true;
        return self;
    }
    
    static receive = function(_args, _sender) {
        if (!should_handle(_args, _sender))
            return;
        
        handle(_args, _sender);
        if (is_onetime)
            unsubscribe();
    }
    
    static should_handle = function(_args, _sender) {
        return true;
    }
    
    static handle = function(_args, _sender) {
        throw VentforthException.not_implemented(self, nameof(handle));
    }
    
    static unsubscribe = function() {
        if (!is_undefined(subject))
            subject.remove_subscription(self);
    }
}
