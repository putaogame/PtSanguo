package com.engine.core.mvc.bind;

import com.engine.core.mvc.observer.IEventDispatcher;
class BindUtils {
    private var _sHost:IEventDispatcher;
    private var _index:Int;
    private var _sProp:String;
    private var _tHost:Dynamic;
    private var _setter:Dynamic;
    private var _tProp:String;
    private static var __index:Int = 0;
    private static var __hosts:Dynamic = {};

    private function new(index:Int, sHost:IEventDispatcher, sProp:String, setter:Dynamic = null, tHost:Dynamic = null, tProp:String = "") {
        _index = index;
        _sHost = sHost;
        _sProp = sProp;
        _setter = setter;
        _tHost = tHost;
        _tProp = tProp;

        bind();
    }
    public function bind():Void{
        _sHost.addEventListener(DataChangeEvent.CHANGE, dataChangeHandler);
    }
    private function dataChangeHandler(event:DataChangeEvent):Void{
        if (event.valueName == _sProp && event.newValue != event.oldValue)
        {
            if (_setter != null)
            {
                _setter(event.newValue);
            }
            if (_tHost != null)
            {
                _tHost._tProp = event.newValue;
            }
        }
    }
    public function clear():Void{
        unbind;
        _sHost = null;
        _tHost = null;
        _setter = null;
        __hosts._index = null;
    }
    public function unbind():Void{
        _sHost.removeEventListener(DataChangeEvent.CHANGE,dataChangeHandler);
    }
    public static function allUnbind():Void{
        while(__index>0){
            if(__hosts.__index != null){
                __hosts.__index.clear();
                __hosts.__index = null;
            }
            __index--;
        }
        __index = 0;
        __hosts = {};
    }
    public static function bindSetter(setter:Dynamic, sHost:IEventDispatcher, sProp:String):BindUtils{
        var index:Int = __index+1;
        __index = index;
        var bindUtils:BindUtils = new BindUtils(__index, sHost, sProp, setter);
        __hosts.__index = bindUtils;
        return bindUtils;
    }
}













