package com.putaolab.game.module.mainCity.view;

import manager.TextureManager;
import flixel.FlxSprite;
import com.putaolab.game.view.ValueBox;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午3:59
 * description：
 */

class CoinBox extends ValueBox{
    private var _coinbg:FlxSprite;

    public function new() {
        super();
    }

    override public function initialise():Void{
        _coinbg = TextureManager.getInstance().getSpriteWithTexture("button","texture0");
        add(_coinbg);
    }
}
