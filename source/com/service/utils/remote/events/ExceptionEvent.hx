package com.service.utils.remote.events;
import flash.events.Event;
class ExceptionEvent extends Event{
    public static var EVENT_ID:String = "ExceptionEvent";

    public var code:Int;
    public var message:String;

    public function new(argcode:Int,argmessage:String) {
        super(EVENT_ID);
        this.code = argcode;
        this.message = argmessage;
    }
}
