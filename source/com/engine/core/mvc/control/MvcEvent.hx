package com.engine.core.mvc.control;
import com.engine.core.mvc.observer.Event;
class MvcEvent extends Event{
    public var mydata:Dynamic;

    public function new(typeName:String,argmydata:Dynamic) {
        super(typeName);
        this.mydata = argmydata;
    }
}












