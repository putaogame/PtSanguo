package com.putaolab.game.module.mainCity.view.build;

import flixel.FlxSprite;
import manager.TextureManager;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午9:32
 * description：抽奖建筑
 */

class LotteryBuild extends BaseBuild{
    public function new() {
        super();
        params = ["LotteryBuild"];
    }

    override public function initialise():Void{

        super.initialise();
        playAnimation();
    }

    public function playAnimation():Void{
        var sp:FlxSprite = TextureManager.getInstance().getSpriteWithAnimation("arena","",10,true,"texture0");
        sp.animation.play("arena");
    }
}
