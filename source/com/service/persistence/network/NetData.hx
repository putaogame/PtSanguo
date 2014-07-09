package com.service.persistence.network;
import com.service.persistence.po.AccountPO;
class NetData {
    public var accountPO:AccountPO;

    private static var _instance:NetData;
    private function new() {
        accountPO = new AccountPO();
    }

    public static function getInstance():NetData{
        if(_instance == null){
            _instance = new NetData();
        }
        return _instance;
    }
}
