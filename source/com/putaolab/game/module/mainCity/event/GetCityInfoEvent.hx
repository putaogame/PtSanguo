package com.putaolab.game.module.mainCity.event;
import com.engine.core.mvc.control.MvcEvent;
class GetCityInfoEvent extends MvcEvent{
    public static var EVENT_ID:String = "GetCityInfoEvent";

    public function new(typeName:String,argmydata:Dynamic) {
        super(typeName,argmydata);
    }
}
