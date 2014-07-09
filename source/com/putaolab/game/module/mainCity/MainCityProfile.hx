package com.putaolab.game.module.mainCity;
/**
 * User: gaoyun
 * Date: 14-7-9
 * Time: 下午7:47
 * description：
 */

class MainCityProfile {
    private static var _instance:MainCityProfile;
    public function new() {
    }

    public static function getInstance():MainCityProfile{
        if(_instance == null){
            _instance = new MainCityProfile();
        }
        return _instance;
    }




    public function testData():Void{

    }
}
