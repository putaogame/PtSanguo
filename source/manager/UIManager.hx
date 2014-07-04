package manager;

import com.putaolab.BagPanel;
import com.putaolab.BasePanel;
import flixel.addons.ui.FlxUISubState;
import flixel.addons.ui.FlxUIState;
import flixel.FlxG;
/**
 * User: gaoyun
 * Date: 14-6-30
 * Time: 下午3:38
 * description：UI管理器
 */

class UIManager {
    private static var _uiManager:UIManager;
    private var _currentState:FlxUIState;
    private var _currentSubState:FlxUISubState;
    private var _subStates:Array<FlxUISubState>;



    private function new() {
        _subStates = new Array<FlxUISubState>();
    }
    public static function getInstance():UIManager{
        if(_uiManager==null){
            _uiManager = new UIManager();
        }
        return _uiManager;
    }


    public function switchState(state:FlxUIState):Void{
        if(_currentState != null){
            _currentState.destroy();
            _currentState = null;
        }
        _currentState = state;
        FlxG.switchState(_currentState);
    }

    public function openSubState(subState:FlxUISubState,?state:FlxUIState):Void{
        if(_currentState == null){
            _currentState = state;
        }
        _subStates.push(subState);
        _currentSubState = subState;
        _currentState.openSubState(_currentSubState);
    }
    public function openSubState(name:String,?state:FlxUIState):Void{
        if(_currentState == null){
            _currentState = state;
        }
        var panel:BasePanel = getPanel(name);
        if(panel == null)
            return;

        _subStates.push(panel);
        _currentSubState = panel;
        _currentState.openSubState(_currentSubState);
    }
    private function getPanel(name:String):BasePanel{
        if(name == "bag"){
            return new BagPanel();
        }
        return null;

    }


    public function closeSubState(all:Bool = false):Void{
        if(_subStates.length > 0){
            if(all){
                while(_subStates.length > 0){
                    var closedSubState:FlxUISubState = _subStates.pop();
                    closedSubState.close();
                }
            }else{
                var closedSubState:FlxUISubState = _subStates.pop();
                closedSubState.close();
            }
        }

    }
    public function update():Void{
        #if android
        if (FlxG.android.anyJustPressed(["BACK"])){
            closeSubState();
        }
        #end
    }


}
