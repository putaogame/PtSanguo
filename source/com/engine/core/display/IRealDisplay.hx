package com.engine.core.display;
/*
*       数据可以实时刷新的组件
 *       */
interface IRealDisplay {
    public var disable(default, set):Array<Dynamic>;
    public function set_disable(b:Bool):Bool;

    public function refresh(value:Dynamic):Void;
}
