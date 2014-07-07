package com.engine.core.display;

import component.PTFlxUIState;
import flixel.addons.ui.FlxUIState;

class Scene extends PTFlxUIState implements IScene{
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
    public function setData(data:Dynamic):Void{
        this._data = data;
    }
}
