package com.putaolab.game.view;
import flixel.text.FlxText;
import manager.TextureManager;
import component.PTFlxUIGroup;
import flixel.FlxSprite;
/*
*     比如金币钻石     体力等框的基类
   *     * */
class ValueBox extends PTFlxUIGroup {
    private var _icon:FlxSprite;
    private var _text:FlxText;
    private var _ValueString:String;
    private var _value:Int;
    private var _iconName:String;

    private var _coinbg:FlxSprite;

    public function new() {
        super();
    }

    public function initialise():Void{
        _coinbg = TextureManager.getInstance().getSpriteWithTexture("button","texture0");
        add(_coinbg);
    }

    public function setValue(value:Int):Void{
        _value = value;
    }

    public function setValueString(valueString:String):Void{
        _ValueString = valueString;
    }

    public function setIcon(iconName:String):Void{
        _iconName = iconName;
    }

    public function refresh():Void{

    }


}
