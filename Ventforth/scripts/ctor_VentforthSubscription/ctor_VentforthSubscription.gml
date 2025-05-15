function VentforthSubscription() constructor {
    subject = undefined;
    
    static receive = function(_args, _sender) {
        throw VentforthException.not_implemented(self, nameof(receive));
    }
    
    static unsubscribe = function() {
        if (!is_undefined(subject))
            subject.remove_subscription(self);
    }
}
