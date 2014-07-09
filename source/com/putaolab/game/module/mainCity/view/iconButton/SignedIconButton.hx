package com.putaolab.game.module.mainCity.view.iconButton;

import com.putaolab.game.view.IconButton;

/**
 * User: gaoyun
 * Date: 14-7-9
 * Time: 上午11:58
 * description：
 */

class SignedIconButton extends IconButton{
    public function new() {
        super();
        params = ["SignedIconButton"];
    }

    override public function initialise():Void{
        super.initialise();
        this.x = 50;
        this.y = 80;
    }
}
