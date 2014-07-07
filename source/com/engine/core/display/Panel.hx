package com.engine.core.display;

import component.PTFlxUISubState;
class Panel extends PTFlxUISubState implements IPanel{
    private var _data:Dynamic;
    public function new() {
        super();
    }
    override public function create():Void{
        super.create();
    }
    public function getData():Dynamic{
        return _data;
    }
    public function setData(a_data:Dynamic):Void{
        this._data = a_data;
    }
}
