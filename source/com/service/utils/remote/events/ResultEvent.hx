package com.service.utils.remote.events;
import flash.events.Event;
class ResultEvent extends Event{
    public static var EVENT_ID:String = "ResultEvent";

    public var mydata:Dynamic;
    public function new(argmydata:Dynamic) {
        super(EVENT_ID);
        this.mydata = argmydata;
    }
}
