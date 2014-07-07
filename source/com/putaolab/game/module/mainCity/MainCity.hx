package com.putaolab.game.module.mainCity;
import com.putaolab.game.module.mainCity.data.MainCityC;
import com.engine.core.mvc.control.MvcEventDispatcher;
import com.putaolab.game.module.mainCity.binders.BinderMainCity;
import com.putaolab.game.module.mainCity.controls.MainCityController;
import com.putaolab.game.module.mainCity.data.MainCityData;
import com.engine.core.display.IScene;
import com.engine.core.mvc.bind.BindUtils;
import com.engine.core.display.Scene;
import com.game.module.core.CoreState;
import com.game.events.mainCity.GetCityInfoEvent;
import com.game.common.DisplayConfig;
import com.game.common.Common;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import pgr.dconsole.DC;
import flixel.FlxG;
import com.game.display.Scene;
class MainCity extends Scene implements IScene{
    private var _bindUtil:BindUtils;
    private var _cityData:MainCityData;

    public function new() {
        super();
        DC.log("MainCity new()");
    }
    /**
	 * Function that is called up when to state is created to set it up.
	 */
    override public function create():Void
    {
        super.create();
//        FlxG.debugger.track("Test MainCity data: "+getData);
        DC.log("Test MainCity data: "+getData);
        var loadingBG:FlxSprite = new FlxSprite();
        loadingBG.loadGraphic("assets/images/city.jpg");
        add(loadingBG);

        var btn:FlxButton = new FlxButton(50,50,"",onClick);
        btn.text = "BAG";
        add(btn);

        MainCityController.getInstance();
        _cityData = BinderMainCity.getInstance().mainCityData;
        _bindUtil = BindUtils.bindSetter(setMoney,_cityData,"money");

        MvcEventDispatcher.dispatchEvent(MainCityC.DISPATCHER_NAME,new GetCityInfoEvent(GetCityInfoEvent.EVENT_ID,"userid"));
    }
    private function setMoney(money:Int):Void{
        DC.log("MainCity setMoney() money: "+money);

    }

    private function onClick():Void{
        DC.log("MainCity onClick()");
//        Common.ui.openWindow(DisplayConfig.WINDOW_BAG,"");
        Common.ui.switchScene(DisplayConfig.SCENE_MAIN_CITY,null);
    }
    /**
	 * Function that is called when this state is destroyed - you might want to
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
    override public function destroy():Void
    {
        super.destroy();

        _bindUtil.clear();
    }

/**
	 * Function that is called once every frame.
	 */
    override public function update():Void
    {
        super.update();
    }
}
