package com.putaolab.game.module.bag;
import com.engine.core.Common;
import com.engine.core.display.Window;
import com.engine.core.display.IWindow;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import pgr.dconsole.DC;
class Bag extends Window implements IWindow{
    public function new() {
        super();
    }
/**
	 * Function that is called up when to state is created to set it up.
	 */
    override public function create():Void
    {
        super.create();
//        FlxG.debugger.track("Test MainCity data: "+getData);
        DC.log("Test Bag data: "+getData);
        var loadingBG:FlxSprite = new FlxSprite();
        loadingBG.loadGraphic("assets/images/bag.jpg");
        add(loadingBG);

        var btn:FlxButton = new FlxButton(50,50,"",onClick);
        btn.text = "CLOSE";
        add(btn);
    }
    private function onClick():Void{
        DC.log("Bag onClick()");
        Common.ui.closeWindow();
    }
    private function colseMyself():Void{
        Common.ui.closeWindow();
    }

/**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();
    }

/**
	 * Function that is called once every frame.
	 */
    override public function update():Void
    {
        super.update();
    }
}
