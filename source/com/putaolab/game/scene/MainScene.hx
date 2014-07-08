package com.putaolab.game.scene;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：主场景
 */

import flixel.addons.ui.FlxUIGroup;
import component.PTFlxUICursor;
import flixel.addons.ui.FlxUICursor;
import com.putaolab.game.module.mainCity.view.CoinBox;
import com.putaolab.game.view.ValueBox;
import com.putaolab.game.module.mainCity.view.BaseBuild;
import com.putaolab.game.module.mainCity.view.Head;
import com.engine.core.Common;
import com.engine.core.display.Scene;
import com.engine.core.mvc.bind.BindUtils;
import com.putaolab.game.module.mainCity.data.MainCityData;
import flixel.FlxSprite;
import pgr.dconsole.DC;

class MainScene extends Scene {

    private var _bindUtil:BindUtils;
    private var _cityData:MainCityData;
    private var _coinBox:ValueBox;
    private var _diamondBox:ValueBox;
    private var _strengthBox:ValueBox;
    private var _head:Head;
    private var _battleBuild:BaseBuild;

    override public function create():Void{
        _makeCursor = true;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);
        initialiseBackground();
        initialiseBuilds();
        initialiseUI();


        var len:Int = cast(cursor,PTFlxUICursor).get_widgets().length;
        cursor.location = len-1;
    }


    private function initialiseUI():Void{
//        var btn:FlxButton = new FlxButton(50,50,"",onClick);
//        btn.text = "BAG";
//        add(btn);
        _coinBox = new CoinBox();
        _coinBox.setIcon("");
        _coinBox.setValue(0);
        _coinBox.initialise();
        _coinBox.x = 80;
        _coinBox.y = 20;
        _uiLayer.add(_coinBox);

        cursor.addWidget(_coinBox);
    }

    private function initialiseBuilds():Void{


    }
    private function initialiseBackground():Void{
        var loadingBG:FlxSprite = new FlxSprite();
        loadingBG.loadGraphic("assets/images/city.png");
        _backgroundLayer.add(loadingBG);
    }


    private function setMoney(money:Int):Void{
        DC.log("MainCity setMoney() money: "+money);
    }

//    private function onClick():Void{
//        DC.log("MainCity onClick()");
//        Common.ui.switchScene(DisplayConfig.SCENE_MAIN_CITY,null);
//    }

    override public function getEvent(id:String, sender:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "coinBox":

                    }
            }
        }
    }


}
