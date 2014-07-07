package com.putaolab.game.module.mainCity.command;
import com.putaolab.game.module.mainCity.binders.BinderMainCity;
import com.engine.core.mvc.control.MvcEvent;
import com.engine.core.mvc.observer.Event;
import com.engine.core.mvc.observer.ICommand;
import pgr.dconsole.DC;
class GetCityInfoCommand implements ICommand{
    private var _money:Int;
    public function new() {
    }
    public function execute(event:Event):Void{
        var mydata:Dynamic = cast(event,MvcEvent).mydata;
        DC.log("GetCityInfoCommand execute() the data is: "+mydata);
        result();
    }
    private function result():Void{
        _money++;
        BinderMainCity.getInstance().mainCityData.setMoney(_money);
    }
}
