package com.engine.core.mvc.observer;
interface ISubject {
    public function attach(typeName:String,command:ICommand):Void;
    public function detach(typeName:String,command:ICommand):Void;
    public function notify(event:Event):Void;
}
