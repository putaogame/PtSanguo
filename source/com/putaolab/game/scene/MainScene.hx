package com.putaolab.game.scene;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：主场景
 */

import com.putaolab.game.module.mainCity.view.BaseBuild;
import com.putaolab.game.module.mainCity.view.Head;
import com.putaolab.game.module.mainCity.binders.ValueBox;
import com.putaolab.game.module.mainCity.event.GetCityInfoEvent;
import com.engine.core.Common;
import com.putaolab.game.module.mainCity.data.MainCityC;
import com.engine.core.display.Scene;
import com.putaolab.game.module.mainCity.binders.BinderMainCity;
import com.putaolab.game.module.mainCity.controls.MainCityController;
import com.engine.core.mvc.control.MvcEventDispatcher;
import com.engine.core.mvc.bind.BindUtils;
import com.putaolab.game.module.mainCity.data.MainCityData;
import flixel.ui.FlxButton;
import flixel.FlxSprite;
import pgr.dconsole.DC;

class MainScene extends Scene {

    private var _bindUtil:BindUtils;
    private var _cityData:MainCityData;

    override public function create():Void{
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

    private var _coinBox:ValueBox;
    private var _diamondBox:ValueBox;
    private var _strengthBox:ValueBox;
    private var _head:Head;
    private function initialiseUI():Void{


    }
    private var _battleBuild:BaseBuild;
    private function initialiseBuilds():Void{


    }
    private function initialiseBackground():Void{


    }


    private function setMoney(money:Int):Void{
        DC.log("MainCity setMoney() money: "+money);

    }

    private function onClick():Void{
        DC.log("MainCity onClick()");
//        Common.ui.openWindow(DisplayConfig.WINDOW_BAG,"");
        Common.ui.switchScene(DisplayConfig.SCENE_MAIN_CITY,null);
    }


}
