package com.service.test;
import com.vo.AccountInfo;
import com.service.action.city.CityAction;
import com.service.persistence.po.AccountPO;
import com.service.persistence.network.NetData;
import com.service.utils.remote.HttpFactory;
import com.service.utils.remote.events.ResultEvent;
import pgr.dconsole.DC;
class ServiceTest {
    public function new() {
        init();
    }
    private function init():Void{
        DC.init(1);
        DC.log("ServiceTest V1.1");
        addTestData();

//        testHttp();
        testCity();
    }

    private function testCity():Void{
        new CityAction().findAccountInfo("userid",onCityResult);
    }

    private function testHttp():Void{
        HttpFactory.getInstance().send("method",onResult);
    }
    private function onCityResult(info:AccountInfo):Void{
        DC.log("ServiceTest onCityResult() info.coin: "+info.coin);
    }
    private function onResult(e:ResultEvent):Void{
        DC.log("ServiceTest onResult() : "+e.mydata);

    }

    private function addTestData():Void{
        var accountpo:AccountPO = NetData.getInstance().accountPO;
        accountpo.coin = 890;
        accountpo.currexp = 10;
        accountpo.diamond = 50;
        accountpo.head = "head.jpg";
        accountpo.level = 5;
        accountpo.maxstrength = 80;
        accountpo.strength = 52;
        accountpo.needexp = 69;
        accountpo.name = "虚空面罩";
    }
}
