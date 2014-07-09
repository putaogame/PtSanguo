package com.service.dao.city;
import com.service.persistence.network.NetData;
import com.service.persistence.po.AccountPO;

class CityDao {
    public function new() {
    }

    public function getAccountPO(userid:String):AccountPO{
        return NetData.getInstance().accountPO;
    }
}
