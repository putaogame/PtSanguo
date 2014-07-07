package com.engine.core.mvc.observer;
import pgr.dconsole.DC;

class Subject implements ISubject{
    private var _types:Dynamic;

    public function new() {
        _types = {};
    }
    public function attach(typeName:String,command:ICommand):Void{
        getTypeInstance(typeName).push(command);
    }
    public function detach(typeName:String,command:ICommand):Void{
        getTypeInstance(typeName).remove(command);
    }
    public function notify(event:Event):Void{
        var command:ICommand;
        if(getTypeInstance(event.typeName).length < 1){
            DC.logError("not register the event: "+event.typeName);
        }
        for(command in getTypeInstance(event.typeName)){
            command.execute(event);
        }
    }

    private function getTypeInstance(typeName:String):Array<ICommand>{
        if(_types.typeName == null){
            _types.typeName = new Array();
        }
        return _types.typeName;
    }
}
