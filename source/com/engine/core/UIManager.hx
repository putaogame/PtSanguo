package com.engine.core;
import manager.TextureManager;
import com.putaolab.game.scene.MainScene;
import com.putaolab.game.DisplayConfig;
import com.engine.core.display.Window;
import com.putaolab.game.module.bag.Bag;
import flixel.FlxState;
import flixel.FlxG;
import com.engine.core.display.Scene;
import com.engine.core.display.Panel;
import com.engine.core.interfaces.IUIManager;
import pgr.dconsole.DC;
class UIManager implements IUIManager{
    private static var _instance:UIManager;

    private var _currScene:Scene;
    private var _currWindow:Window;
    private var _currPanel:Panel;

    private function new() {

    }
    public function switchScene(sceneName:String,a_data:Dynamic):Void{
        _currScene = getSceneByName(sceneName);
//        TextureManager.initTextureByScene(sceneName);

        judgeCurrScene();
        if(_currScene == null) return;

        _currScene.setData(a_data);
        FlxG.switchState(_currScene);
    }
    public function openWindow(windowName:String,a_data:Dynamic):Void{
        _currWindow = getWindowByName(windowName);

        judgeCurrWindow();
        if(_currWindow == null) return;

        _currWindow.setData(a_data);
        _currScene.openSubState(_currWindow);
    }
    public function openPanel(panelName:String,a_data:Dynamic):Void{

        _currPanel = getPanelByName(panelName);

        _currPanel.setData(a_data);
        _currWindow.openSubState(_currPanel);
    }
    public function closeWindow():Void{
        judgeCurrWindow();
        if(_currWindow == null) return;

        DC.log("UIManager ready to closeWindow()");
        _currWindow.close();
        _currWindow = null;
    }
    public function closePanel():Void{
        judgeCurrPanel();
        if(_currPanel == null) return;

        _currPanel.close();
        _currPanel = null;
    }


    private function judgeCurrScene():Void{
        if(_currScene == null){
            DC.logError("CURRSCENE IS NULL!");
        }
    }
    private function judgeCurrWindow():Void{
        if(_currWindow == null){
            DC.logError("CURRWINDOW IS NULL!");
        }
    }
    private function judgeCurrPanel():Void{
        if(_currPanel == null){
            DC.logError("CURRPANE IS NULL!");
        }
    }
    public static function getInstance():UIManager{
        if(_instance == null){
            _instance = new UIManager();
        }
        return _instance;
    }

    private function getSceneByName(sceneName:String):Scene{
        if(sceneName == DisplayConfig.SCENE_MAIN_CITY){
            return new MainScene();
        }
        return null;
    }
    private function getWindowByName(windowName:String):Window{
        if(windowName == DisplayConfig.WINDOW_BAG){
            return new Bag();
        }
        return null;
    }
    private function getPanelByName(panelName:String):Panel{

        return null;
    }
}