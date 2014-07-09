package com.putaolab.game.module.mainCity.view.build;

import manager.TextureManager;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午9:35
 * description：生死门
 */

class DiffcultyBattleBuild extends BaseBuild{
    public function new() {
        super();
        params = ["DiffcultyBattleBuild"];
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
