package com.putaolab.game.module.mainCity;

import manager.ConfigFileManager;
import com.putaolab.model.itemSpec.BuildingItemSpec;
/**
 * User: gaoyun
 * Date: 14-7-8
 * Time: 下午8:33
 * description：
 */

class MainCityManager {
    private static var _instance:MainCityManager;
    private function new() {
    }

    public static function getInstance():MainCityManager{
        if(_instance == null){
            _instance = new MainCityManager();
        }
        return _instance;
    }

    public function getBuildingItemSpecs():Array<BuildingItemSpec>{
        return ConfigFileManager.getInstance().buildingItemSpecs;
    }

    public function getPlayerInfomation():Void{

    }

    public function test(a:Dynamic):Void{
        a();
    }


}
