package com.service.persistence.local;
class LocalData {


    private static var _instance:LocalData;
    public function new() {

    }

    public static function getInstance():LocalData{
        if(_instance == null){
            _instance = new LocalData();
        }
        return _instance;
    }
}
