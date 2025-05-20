function VentforthCallbackSubscription(_callback, _condition = undefined) : VentforthSubscription() constructor {
    handle = _callback;
    
    if (is_callable(_condition))
        should_handle = _condition;
}
