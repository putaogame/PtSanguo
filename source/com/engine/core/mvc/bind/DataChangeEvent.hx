package com.engine.core.mvc.bind;
import com.engine.core.mvc.observer.Event;
class DataChangeEvent extends Event{
    public var newValue:Dynamic;
    public var oldValue:Dynamic;
    public var valueName:String;

    public static var CHANGE:String = "change";
    public function new(argValueName:String,argOldValue:Dynamic,argNewVaule:Dynamic) {
        super(CHANGE);
        this.valueName = argValueName;
        this.oldValue = argOldValue;
        this.newValue = argNewVaule;
    }
}
