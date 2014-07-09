package com.engine.core.display;

import manager.TextureManager;
import component.PTFlxUISubState;
class Panel extends PTFlxUISubState implements IPanel{
    private var _data:Dynamic;
    private var name:String;

    public function new() {
        super();
    }
    override public function create():Void{
        super.create();
        TextureManager.getInstance().initTextureByScene(name);
    }
    public function getData():Dynamic{
        return _data;
    }
    public function setData(?a_data:Dynamic):Void{
        this._data = a_data;
    }
    override public function close():Void{
        super.close();
        TextureManager.getInstance().destroySpecifyedTexture(name);
    }
}
