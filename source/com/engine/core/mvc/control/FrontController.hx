package com.engine.core.mvc.control;
import com.engine.core.mvc.observer.ICommand;
import com.engine.core.mvc.observer.ISubject;
import pgr.dconsole.DC;
class FrontController {
    public var eventDispatcher:ISubject;

    public function new() {
    }

    public function removeCommand(eventName:String,command:ICommand):Void{
        if(eventDispatcher != null){
            eventDispatcher.detach(eventName,command);
        }else{
            DC.logError("please assign the eventDispatcher");
        }
    }
    public function addCommand(eventName:String,command:ICommand):Void{
        if(eventDispatcher != null){
            eventDispatcher.attach(eventName,command);
        }else{
            DC.logError("please assign the eventDispatcher");
        }
    }
}













