package com.putaolab.game.module.mainCity.data;
import com.engine.core.mvc.bind.Data;
class MainCityData extends Data{
    private var _money:Int;

    public function new() {
        super();
    }
    public function getMoney():Int{
        return _money;
    }
    public function setMoney(argMoney:Int):Void{
        valueChanged("money","_money",argMoney);
    }
    override public function getProperty(attrName:String):Dynamic{
        return this.attrName;
    }
    override public function setProperty(attrName:String,value:Dynamic):Void{
        this.attrName = value;
    }
}
