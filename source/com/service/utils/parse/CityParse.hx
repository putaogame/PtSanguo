package com.service.utils.parse;
import com.service.persistence.po.AccountPO;
import com.vo.AccountInfo;
class CityParse {
    public function new() {
    }

    public static function accountpoToAccountinfo(po:AccountPO):AccountInfo{
        if(po == null) return null;
        var info:AccountInfo = new AccountInfo();
        info.strength = po.strength;
        info.coin = po.coin;
        info.currexp = po.currexp;
        info.diamond = po.diamond;
        info.head = po.head;
        info.level = po.level;
        info.maxstrength = po.maxstrength;
        info.name = po.name;
        info.needexp = po.needexp;
        return info;
    }
}
