package com.engine.core.mvc.observer;
import pgr.dconsole.DC;
class EventDispatcher implements IEventDispatcher{
    private var _types:Dynamic;

    public function new() {
        _types = {};
    }
    public function addEventListener(eventType:String,fun:Dynamic):Void{
        getTypeInstance(eventType).push(fun);
    }
    public function removeEventListener(eventType:String,fun:Dynamic):Void{
        getTypeInstance(eventType).remove(fun);
    }
    public function dispatchEvent(event:Event):Void{
        var fun:Dynamic;
        if(getTypeInstance(event.typeName).length < 1){
            DC.logError("EventDispatcher not register the event: "+event.typeName);
        }
        for(fun in getTypeInstance(event.typeName)){
            fun(event);
        }
    }

    private function getTypeInstance(typeName:String):Array<Dynamic>{
        if(_types.typeName == null){
            _types.typeName = new Array();
        }
        return _types.typeName;
    }
}
