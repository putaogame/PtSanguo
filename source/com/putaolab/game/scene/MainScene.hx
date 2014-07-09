package com.putaolab.game.scene;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：主场景
 */

import component.PTFlxUIButton;
import flixel.addons.ui.FlxUICursor;
import com.putaolab.component.list.GoodsList;
import com.putaolab.component.list.itemrender.GoodsItemRender;
import com.vo.GoodsInfo;
import manager.TextureManager;
import com.putaolab.game.view.ValueBox;
import com.putaolab.game.module.mainCity.view.BaseBuild;
import com.putaolab.game.module.mainCity.view.Head;
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
        name = DisplayConfig.SCENE_MAIN_CITY;
        _makeCursor = true;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

//        var s:FlxSprite = new FlxSprite();
//        TextureManager.getInstance().uploadTextureToSprite(s,"build1","texture1");
//        add(s);

        DC.log("Test MainCity data: "+getData);
//        var loadingBG:FlxSprite = new FlxSprite();
//        loadingBG.loadGraphic("assets/images/city.jpg");
//        add(loadingBG);

        var btn:PTFlxUIButton = new PTFlxUIButton(50,50,"bag",onClick);
        add(btn);
        btn.x = 300;
        cursor.addWidget(btn);
        cursor.location = 0;

        var btn:FlxButton = new FlxButton(200,50,"",onClick2);
        btn.text = "test";
        add(btn);

//        MainCityController.getInstance();
//        _cityData = BinderMainCity.getInstance().mainCityData;
//        _bindUtil = BindUtils.bindSetter(setMoney,_cityData,"money");

//        MvcEventDispatcher.dispatchEvent(MainCityC.DISPATCHER_NAME,new GetCityInfoEvent(GetCityInfoEvent.EVENT_ID,"userid"));
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
        //Common.ui.switchScene(DisplayConfig.SCENE_MAIN_CITY,null);
        Common.ui.openWindow(DisplayConfig.WINDOW_BAG);
    }
    private function onClick2():Void{
        DC.log("MainCity onClick()");
//        var loadingBG:FlxSprite = new FlxSprite();
//        TextureManager.getInstance().uploadTextureToSprite(loadingBG,"build2","texture2");
//        add(loadingBG);


//        var goodlist:GoodsList = new GoodsList(5,5,30,30);
//        goodlist.setCursor(cursor);
//
//        add(goodlist);
//        var arr:Array<GoodsInfo>  = [];
//        for(i in 0...36){
//            arr.push(new GoodsInfo());
//        }
//        goodlist.setData(arr);
//        goodlist.x = 500;
//        goodlist.y = 500;


//        var _users:Array<Int> = [0,1,2,3,4,5,6,7,8,9];
//        var j:Int = 0;
//        for(i in 0..._users.length){
//            if(j >= _users.length){
//                break;
//            }
//            if(_users[j] == 1 || _users[j] == 2 || _users[j] == 5 || _users[j] == 6 || _users[j] == 7 || _users[j] == 9 ){
//                _users.splice(j,1);
//                j--;
//            }
//            j++;
//        }
    }







}
