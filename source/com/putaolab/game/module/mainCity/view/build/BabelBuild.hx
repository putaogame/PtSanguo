package com.putaolab.game.module.mainCity.view.build;

import manager.TextureManager;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午9:39
 * description：通天塔
 */

class BabelBuild extends BaseBuild{
    public function new() {
        super();
        params = ["BabelBuild"];
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
