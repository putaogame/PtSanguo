package com.engine.core.interfaces;
interface IUIManager {
    public function switchScene(sceneName:String,?a_data:Dynamic):Void;
    public function openWindow(windowName:String,?a_data:Dynamic):Void;
    public function openPanel(panelName:String,?a_data:Dynamic):Void;
    public function closeWindow():Void;
    public function closePanel():Void;
}
