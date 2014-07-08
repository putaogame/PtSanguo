package com.putaolab.game.module.mainCity.binders;
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
    }
    private function initialise():Void{

    }
    private function setValue(value:Int):Void{

    }
    private function setIcon(iconName:String):Void{
        _iconName = iconName;
    }


}
