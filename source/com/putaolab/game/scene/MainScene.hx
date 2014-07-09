package com.putaolab.game.scene;

import com.putaolab.game.module.mainCity.view.build.LotteryBuild;
import com.putaolab.game.module.mainCity.view.build.BabelBuild;
import com.putaolab.game.module.mainCity.view.build.ArenaBuild;
import com.putaolab.game.module.mainCity.view.build.SpecialBattleBuild;
import com.putaolab.game.module.mainCity.view.build.DiffcultyBattleBuild;
import com.putaolab.game.view.IconButton;
import com.putaolab.game.module.mainCity.view.iconButton.SignedIconButton;
import com.putaolab.game.module.mainCity.view.box.DiamondBox;
import com.putaolab.game.module.mainCity.view.box.StrengthBox;
import com.putaolab.game.module.mainCity.view.box.CoinBox;
import com.putaolab.game.module.mainCity.view.build.BattleBuild;
import com.putaolab.game.module.mainCity.MainCityManager;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import flixel.addons.ui.FlxUIGroup;
import component.PTFlxUICursor;
import flixel.addons.ui.FlxUICursor;

import com.putaolab.game.view.ValueBox;
import com.putaolab.game.module.mainCity.view.BaseBuild;
import com.putaolab.game.module.mainCity.view.Head;
import com.engine.core.Common;
import com.engine.core.display.Scene;
import com.engine.core.mvc.bind.BindUtils;
import com.putaolab.game.module.mainCity.data.MainCityData;
import flixel.FlxSprite;
import pgr.dconsole.DC;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:55
 * description：主场景
 */

class MainScene extends Scene {
    private var _mainCityManager:MainCityManager;

    private var _bindUtil:BindUtils;
    private var _cityData:MainCityData;
    private var _coinBox:ValueBox;
    private var _diamondBox:ValueBox;
    private var _strengthBox:ValueBox;
    private var _head:Head;
    private var _signed:IconButton;
    private var _battleBuild:BaseBuild;
    private var _lotteryBuild:BaseBuild;
    private var _diffcultyBattleBuild:BaseBuild;//生死门（高难度调战）
    private var _specialBattleBuild:BaseBuild;//英雄试炼
    private var _arenaBuild:BaseBuild;//竞技场
    private var _babelBuild:BaseBuild;//通天塔

    private var _generals:IconButton;
    private var _backpack:IconButton;
    private var _everyDay:IconButton;
    private var _task:IconButton;
    private var _email:IconButton;

    public function new():Void{
        super();
        _mainCityManager = MainCityManager.getInstance();
    }

    override public function create():Void{
        _makeCursor = true;
        name = DisplayConfig.SCENE_MAIN_CITY;
        _makeCursor = true;
        super.create();
        cursor.setDefaultKeys(FlxUICursor.KEYS_DEFAULT_ARROWS | FlxUICursor.KEYS_DEFAULT_TAB);

        initialiseBackground();
        initialiseBuilds();
        initialiseUI();

        var len:Int = cast(cursor,PTFlxUICursor).get_widgets().length;
        cursor.location = 1;
    }

    private function setMainCityData():Void{
//        MainCityManager.getInstance()

    }

    private function setCoin(coin:Int):Void{
        DC.log("MainCity setMoney() money: "+coin);
        _coinBox.setValue(coin);
        _coinBox.refresh();
    }

    private function setDiamon(diamonNum:Int):Void{
        DC.log("MainCity setMoney() money: "+diamonNum);
        _diamondBox.setValue(diamonNum);
        _diamondBox.refresh();
    }

    private function setStrength(strength:Int,maxStrength:Int):Void{
        DC.log("MainCity setMoney() money: "+strength);
        var strengthStr:String = strength+"/"+maxStrength;
        _strengthBox.setValueString(strengthStr);
        _strengthBox.refresh();
    }

    private function initialiseUI():Void{
//        _head = new Head("","");

        _signed = new SignedIconButton();
        _signed.setIcon("signedIcon");
        _signed.initialise();
        _uiLayer.add(_signed);

        _coinBox = new CoinBox();
        _coinBox.setIcon("coinIcon");
        _coinBox.setValue(1000);
        _coinBox.initialise();
        _coinBox.x = 150;
        _coinBox.y = 20;
        _uiLayer.add(_coinBox);

        _diamondBox = new DiamondBox();
        _diamondBox.setIcon("gemIcon");
        _diamondBox.setValue(2000);
        _diamondBox.initialise();
        _diamondBox.x = 300;
        _diamondBox.y = 20;
        _uiLayer.add(_diamondBox);

        _strengthBox = new StrengthBox();
        _strengthBox.setIcon("strengthIcon");
        _strengthBox.setValueString("120/36");
        _strengthBox.initialise();
        _strengthBox.x = 450;
        _strengthBox.y = 20;
        _uiLayer.add(_strengthBox);

//        cursor.addWidget(_head.button);
        cursor.addWidget(_signed.button);
        cursor.addWidget(_coinBox.button);
        cursor.addWidget(_diamondBox.button);
        cursor.addWidget(_strengthBox.button);

        functionalList();
    }


    private function functionalList():Void{
        _generals = new IconButton();
        _generals.setIcon("Generals");
        _generals.initialise();
        _generals.y = 50;
        _uiLayer.add(_generals);

        _backpack = new IconButton();
        _backpack.setIcon("bagpack");
        _backpack.initialise();
        _backpack.y = 160;
        _uiLayer.add(_backpack);

        _everyDay = new IconButton();
        _everyDay.setIcon("everyDayActivity");
        _everyDay.initialise();
        _everyDay.y = 270;
        _uiLayer.add(_everyDay);

        _task = new IconButton();
        _task.setIcon("task");
        _task.initialise();
        _task.y = 380;
        _uiLayer.add(_task);

        _email = new IconButton();
        _email.setIcon("Email");
        _email.initialise();
        _email.y = 490;
        _uiLayer.add(_email);
        _generals.x =_backpack.x =_everyDay.x =_task.x =_email.x =1100;

        cursor.addWidget(_generals.button);
        cursor.addWidget(_backpack.button);
        cursor.addWidget(_everyDay.button);
        cursor.addWidget(_task.button);
        cursor.addWidget(_email.button);
    }

    private function initialiseBuilds():Void{
        var buildingItemSpecs:Array<BuildingItemSpec> = _mainCityManager.getBuildingItemSpecs();
        for(i in 0...buildingItemSpecs.length){
            switch(buildingItemSpecs[i].name){
                case "build1":
                    _lotteryBuild = new LotteryBuild();
                    _lotteryBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _lotteryBuild.initialise();
                    _mainLayer.add(_lotteryBuild);
                    cursor.addWidget(_lotteryBuild.button);
                case "build2":
                    _battleBuild = new BattleBuild();
                    _battleBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _battleBuild.initialise();
                    _mainLayer.add(_battleBuild);
                    cursor.addWidget(_battleBuild.button);
                case "build3":
                    _diffcultyBattleBuild = new DiffcultyBattleBuild();
                    _diffcultyBattleBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _diffcultyBattleBuild.initialise();
                    _mainLayer.add(_diffcultyBattleBuild);
                    cursor.addWidget(_diffcultyBattleBuild.button);
                case "build4":
                    _specialBattleBuild = new SpecialBattleBuild();
                    _specialBattleBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _specialBattleBuild.initialise();
                    _mainLayer.add(_specialBattleBuild);
                    cursor.addWidget(_specialBattleBuild.button);
                case "build5":
                    _arenaBuild = new ArenaBuild();
                    _arenaBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _arenaBuild.initialise();
                    _mainLayer.add(_arenaBuild);
                    cursor.addWidget(_arenaBuild.button);
                case "build6":
                    _babelBuild = new BabelBuild();
                    _babelBuild.setBuildingSpec(buildingItemSpecs[i]);
                    _babelBuild.initialise();
                    _mainLayer.add(_babelBuild);
                    cursor.addWidget(_babelBuild.button);
            }
        }
    }

    private function initialiseBackground():Void{
        var loadingBG:FlxSprite = new FlxSprite();
        loadingBG.loadGraphic("assets/images/city.png");
        _backgroundLayer.add(loadingBG);
    }

    override public function getEvent(id:String, sender:Dynamic, data:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "coinbgBtn":
                            trace("click coinbgBtn!!!!");
                        case "diamondBox":
                            trace("click diamondBox!!!!");

                    }
                case "click_PTFlxUIGroup":
                    switch(cast(params[0], String)) {
                        case "CoinBox":
                            trace("click CoinBox!!!!");
                        case "DiamondBox":
                            trace("click DiamondBox!!!!");
                        case "StrengthBox":
                            trace("click StrengthBox!!!!");
                        case "SpecialBattleBuild":
                            trace("click SpecialBattleBuild!!!!");
                        case "LotteryBuild":
                            trace("click LotteryBuild!!!!");
                        case "DiffcultyBattleBuild":
                            trace("click DiffcultyBattleBuild!!!!");
                        case "BabelBuild":
                            trace("click BabelBuild!!!!");
                        case "ArenaBuild":
                            trace("click ArenaBuild!!!!");
                        case "BattleBuild":
                            trace("click BattleBuild!!!!");
                    }
            }
        }

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
