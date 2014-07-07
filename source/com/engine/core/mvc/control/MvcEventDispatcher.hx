package com.engine.core.mvc.control;
import com.engine.core.mvc.observer.Subject;
import com.engine.core.mvc.observer.ISubject;
import com.engine.core.mvc.observer.Event;
import pgr.dconsole.DC;
class MvcEventDispatcher {
    private static var _eventDispatchers:Dynamic = {};

    private function new() {
    }
    public static function dispatchEvent(dispatcherName:String,event:Event):Void{
        if(_eventDispatchers.dispatcherName != null){
            _eventDispatchers.dispatcherName.notify(event);
        }else{
            DC.logError("MvcEventDispatcher not assign the dispatcherName: "+dispatcherName);
        }
    }

    public static function getInstance(dispatcherName:String):ISubject{
        if(_eventDispatchers.dispatcherName == null){
            _eventDispatchers.dispatcherName = new Subject();
        }
        return _eventDispatchers.dispatcherName;
    }
}













