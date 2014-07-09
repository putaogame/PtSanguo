package com.service.action.city;
import com.service.biz.city.CityBiz;
import String;
import com.vo.AccountInfo;
class CityAction {
    public function new() {
    }

    /**获得账号信息*/
    public function findAccountInfo(userid:String,onResult:AccountInfo->Void):Void{
        return new CityBiz().findAccountInfo(userid,onResult);
    }
}
