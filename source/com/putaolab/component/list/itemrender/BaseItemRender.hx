package com.putaolab.component.list.itemrender;

import flixel.addons.ui.interfaces.ICursorPointable;
import component.PTFlxUIGroup;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午2:57
 * description：
 */

class BaseItemRender extends PTFlxUIGroup  implements ICursorPointable{
    public var parent:BaseList;
    public var column:Int;
    public var row:Int;
    public function new(X:Float = 0,Y:Float = 0,?data:Dynamic,?Params:Array<Dynamic>,?Callback:Void->Void) {
        super(X,Y, data,Params,Callback);
    }

}
