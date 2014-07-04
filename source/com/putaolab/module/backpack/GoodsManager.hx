package com.putaolab.module.backpack;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:39
 * description：
 */

import com.putaolab.module.backpack.GoodsModel;
class GoodsManager {
    private static var _instance:GoodsManager;

    public function new() {
    }

    public static function getInstance():GoodsManager{
        if(_instance == null){
            _instance = new GoodsManager();
        }
        return _instance;
    }

    public function getHaveGoods():Array<GoodsItemVO>{
        return GoodsModel.getInstance().getHaveGoods();
    }

    public function getGoodsVo(id:Int):GoodsVO{
        var len:Int = GoodsModel.getInstance().getGoods().length;
        for(i in 0...len){
            if(GoodsModel.getInstance().getGoods()[i].id == id){
                return GoodsModel.getInstance().getGoods()[i];
            }
        }
        return null;
    }
}
