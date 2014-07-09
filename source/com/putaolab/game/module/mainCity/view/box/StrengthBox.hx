package com.putaolab.game.module.mainCity.view.box;

import flixel.text.FlxText;
import manager.TextureManager;
import com.putaolab.game.view.ValueBox;
/**
 * User: gaoyun
 * Date: 14-7-9
 * Time: 上午11:09
 * description：
 */

class StrengthBox extends ValueBox{
    public function new() {
        super();
        params = ["StrengthBox"];
    }

    override public function initialise():Void{
        super.initialise();
        _icon = TextureManager.getInstance().getSpriteWithTexture(_iconName,"texture0");
        _icon.x = _coinbg.width - _icon.width;
        add(_icon);

        _text = new FlxText(0,0,_icon.x,"",14);
        _text.alignment = "center";
        _text.text = _ValueString;
        add(_text);
    }

    override public function refresh():Void{
        _text.text = _ValueString;
    }

}
