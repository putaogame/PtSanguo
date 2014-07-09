package com.putaolab.component.list.itemrender;

import com.putaolab.model.vo.GoodsItemData;
import com.putaolab.component.list.itemrender.BaseItemRender;
import flixel.util.FlxColor;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:37
 * description：
 */

class GoodsItemRender extends BaseItemRender{
    private var _data:GoodsItemData;

    public function new(X:Float = 0,Y:Float = 0,?data:Dynamic,?Params:Array<Dynamic>,?Callback:Void->Void) {
        super(X,Y, data,Params,Callback);
    }

    public function initialise():Void{
        var s:FlxSprite = new FlxSprite();
        s.makeGraphic(20,20,FlxColor.RED);
        add(s);
    }

    public function setData(itemData:GoodsItemData):Void{
        _data = itemData;
//        initialise();
        var s:FlxSprite = new FlxSprite();
        if(itemData == null){
            s.makeGraphic(20,20,FlxColor.BLUE);
        }else{
            s.makeGraphic(20,20,FlxColor.RED);
        }
        add(s);
    }

}
