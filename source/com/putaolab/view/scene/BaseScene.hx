package com.putaolab;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：
 */

import component.PTFlxUIState;
class BaseScene extends PTFlxUIState implements IScene {
    public function new() {

    }
    override public function create():Void{
        super.create();
        this.bak.data = getData();
        this.initialise();
    }
    private function getData():Dynamic{
        return null;
    }
    private function initialise():Void{

    }


}
