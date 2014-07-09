package com.putaolab.game.module.mainCity.view.build;

import manager.TextureManager;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午9:35
 * description：英雄试炼
 */

class SpecialBattleBuild extends BaseBuild{

    public function new() {
        super();
        params = ["SpecialBattleBuild"];
    }

    override public function initialise():Void{

        super.initialise();
        playAnimation();
    }

    public function playAnimation():Void{
        var sp:FlxSprite = TextureManager.getInstance().getSpriteWithAnimation("arena","build4Animation000",3,true,"texture1");
        add(sp);
        sp.animation.play("arena");
    }
}
