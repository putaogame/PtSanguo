package com.engine.core.display;

import com.putaolab.model.itemSpec.GoodsItemSpec;
import component.PTFlxUISubState;
import flixel.addons.ui.FlxUISubState;

class Window extends PTFlxUISubState implements IWindow{
    private var _data:Dynamic;
    public function new() {
        super();
    }
    override public function create():Void{
        super.create();
    }
    public function getData():Dynamic{
        return _data;
        Array<GoodsItemSpec>
    }
    public function setData(a_data:Dynamic):Void{
        this._data = a_data;
    }
}
