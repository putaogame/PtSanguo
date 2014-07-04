package component;

import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.interfaces.ICursorPointable;
import flixel.addons.ui.FlxUIGroup;
import flixel.addons.ui.FlxUISprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flash.system.System;
import flixel.tweens.FlxTween;

class PTFlxBaseListItem extends PTFlxUIGroup implements ICursorPointable{

    private var _data:Dynamic;
    private static var index:Int = 1;
    public var datas(get,set):Dynamic;
    public var footballer:FlxSprite;

    public function new():Void {
        super();
    }


    public function set_datas(bak.data:Dynamic):Dynamic{
        _data = bak.data;
        return _data;
    }
    public function get_datas():Dynamic{
        return _data;
    }

}
