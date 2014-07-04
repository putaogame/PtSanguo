package com.putaolab;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：
 */

import com.putaolab.panel.IPanel;
import component.PTFlxUISubState;
class BasePanel extends PTFlxUISubState implements IPanel{

    public function new() {
    }
    override public function create():Void{
        super.create();
        this.data = getData();
        this.initialise();
    }

  /*  override public function update():Void{
        super.update();
    }*/
    private function getData():Dynamic{
        return null;
    }
    private function initialise():Void{

    }

}
