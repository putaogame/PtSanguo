package com.service.biz.city;

import com.service.utils.parse.CityParse;
import com.service.persistence.po.AccountPO;
import com.vo.AccountInfo;
import com.service.dao.city.CityDao;
import com.vo.AccountInfo;
class CityBiz {
    public function new() {
    }
    public function findAccountInfo(userid:String,onResult:AccountInfo->Void):Void{
        var po:AccountPO = new CityDao().getAccountPO(userid);
        var accountInfo:AccountInfo = CityParse.accountpoToAccountinfo(po);
        onResult(accountInfo);
    }
}
