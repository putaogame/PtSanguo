package com.engine.core.mvc.bind;

import com.engine.core.mvc.observer.EventDispatcher;
class Data extends EventDispatcher{
    private var attrName:Dynamic;

    public function new() {
        super();
    }
    public function valueChanged(valueName:String,attrName:String,value:Dynamic):Void{
        var oldVaule:Dynamic = getProperty(attrName);
        setProperty(attrName,value);
        if(value != oldVaule){
            this.dispatchEvent(new DataChangeEvent(valueName,oldVaule,value));
        }
    }
    public function getProperty(attrName:String):Dynamic{
        return this.attrName;
    }
    public function setProperty(attrName:String,value:Dynamic):Void{
        this.attrName = value;
    }
}
