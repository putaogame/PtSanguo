package com.putaolab.game.view;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
/*
*     比如金币钻石     体力等框的基类
   *     * */
class ValueBox extends FlxUIGroup {
    private var _icon:FlxSprite;
    private var _ValueString:String;
    private var _value:Int;
    private var _iconName:String;

    public function new() {
        super();
    }
    public function initialise():Void{

    }
    public function setValue(value:Int):Void{
        _value = value;
    }
    public function setIcon(iconName:String):Void{
        _iconName = iconName;
    }


}
