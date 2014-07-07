package com.putaolab.componentlist.itemrender;

import flixel.util.FlxColor;
import manager.AssetsManager;
import flixel.FlxSprite;
import com.putaolab.list.BaseItem;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:37
 * description：
 */

class GoodsItemRender extends BaseItem{
    private var _sp:FlxSprite;
    private var _goodsVO:GoodsVO;
    private var _goodsItemVO:GoodsItemVO;

    public function new(X:Float = 0,Y:Float = 0,?data:Dynamic,?Params:Array<Dynamic>,?Callback:Void->Void) {
        super(X,Y, data,Params,Callback);
        _goodsVO = cast(data,GoodsVO);
    }


    public function initialise():Void{
//        _sp = new FlxSprite(0,0);
//        _sp.loadGraphic("assets/images/icon_1.png");
        _sp = AssetsManager.getInstance().getSprite(0,0,_goodsVO.resourceName,"commenAssets");
        add(_sp);
        button.resize(_sp.width,_sp.height);
    }

    public function setData(itemVo:GoodsItemVO):Void{
        _goodsItemVO = itemVo;
    }

}
