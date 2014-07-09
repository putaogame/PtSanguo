package com.service.utils.remote.events;
import flash.events.Event;
class FaultEvent extends Event{
    public static var EVENT_ID:String = "FaultEvent";

    public var mydata:Dynamic;
    public function new(argmydata:Dynamic) {
        super(EVENT_ID);
        this.mydata = argmydata;
    }
}
