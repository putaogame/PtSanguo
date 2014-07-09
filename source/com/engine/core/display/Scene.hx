package com.engine.core.display;

import manager.TextureManager;
import flixel.FlxBasic;
import flixel.group.FlxTypedGroup;
import component.PTFlxUIState;
import flixel.addons.ui.FlxUIState;

class Scene extends PTFlxUIState implements IScene{
    private var _data:Dynamic;

    private var _uiLayer:FlxTypedGroup<FlxBasic>;
    private var _mainLayer:FlxTypedGroup<FlxBasic>;
    private var _backgroundLayer:FlxTypedGroup<FlxBasic>;
    public var name:String;
    public function new() {
        super();
    }
    override public function create():Void{
        super.create();
        if(UIManager.getInstance().getCurrentScene() == null){
            UIManager.getInstance().setCurrentScene(this);
        }
        TextureManager.getInstance().initTextureByScene(name);

        _uiLayer = new FlxTypedGroup<FlxBasic>();
        _mainLayer = new FlxTypedGroup<FlxBasic>();
        _backgroundLayer = new FlxTypedGroup<FlxBasic>();
        add(_backgroundLayer);
        add(_mainLayer);
        add(_uiLayer);
        super.create();
    }
    public function getData():Dynamic{
        return _data;
    }
    public function setData(?data:Dynamic):Void{
        this._data = data;
    }

}
