package com.engine.core.mvc.observer;
interface IEventDispatcher {
    public function addEventListener(eventType:String,fun:Dynamic):Void;
    public function removeEventListener(eventType:String,fun:Dynamic):Void;
    public function dispatchEvent(event:Event):Void;
}
