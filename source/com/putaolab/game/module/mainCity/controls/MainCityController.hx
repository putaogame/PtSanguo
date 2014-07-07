package com.putaolab.game.module.mainCity.controls;
import com.putaolab.game.module.mainCity.event.GetCityInfoEvent;
import com.putaolab.game.module.mainCity.data.MainCityC;
import com.engine.core.mvc.control.MvcEventDispatcher;
import com.engine.core.mvc.control.FrontController;
import com.putaolab.game.module.mainCity.command.GetCityInfoCommand;
class MainCityController extends FrontController{
    private static var _instance:MainCityController;

    private var _getCityInfoCommand:GetCityInfoCommand = new GetCityInfoCommand();
    private function new() {
        super();
        this.eventDispatcher = MvcEventDispatcher.getInstance(MainCityC.DISPATCHER_NAME);

        addCommand(GetCityInfoEvent.EVENT_ID,_getCityInfoCommand);
    }

    public function clear():Void{
        removeCommand(GetCityInfoEvent.EVENT_ID,_getCityInfoCommand);

        _instance = null;
    }
    public static function getInstance():MainCityController{
        if(_instance == null){
            _instance = new MainCityController();
        }
        return _instance;
    }
}
