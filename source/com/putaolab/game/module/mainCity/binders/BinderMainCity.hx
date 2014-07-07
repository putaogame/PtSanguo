package com.putaolab.game.module.mainCity.binders;
import com.putaolab.game.module.mainCity.data.MainCityData;
class BinderMainCity {
    public var mainCityData:MainCityData;

    private static var _instance:BinderMainCity;
    private function new() {
        mainCityData = new MainCityData();
    }

    public static function getInstance():BinderMainCity{
        if(_instance == null){
            _instance = new BinderMainCity();
        }
        return _instance;
    }
}
