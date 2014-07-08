package com.putaolab.game.module.mainCity.binders;
import flixel.text.FlxText;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
/*
*     比如金币钻石     体力等框的基类
   *     * */
class IconButton extends FlxUIGroup {
    private var _icon:FlxSprite;
    private var _text:String;
    private var _textField:FlxText;

    public function new() {

    }
    private function initialise():Void{

    }

    private function setIcon(iconName:String):Void{
        _iconName = iconName;
    }


}
