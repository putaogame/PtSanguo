package com.putaolab.module.backpack;

import bak.tools.Util;
import tools.Util;
import haxe.xml.Fast;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:40
 * description：
 */

class GoodsModel {
    private static var _instance:GoodsModel;
    private var _goods:Array<GoodsVO>;
    private var _hasgoods:Array<GoodsItemVO>;

    private function new() {
        _hasgoods = new Array<GoodsItemVO>();
        initliseGoods();
        recoverGoodsData();
    }

    public static function getInstance():GoodsModel{
        if(_instance==null){
            _instance = new GoodsModel();
        }
        return _instance;
    }

    public function initliseGoods():Void{
        if(_goods == null){
            _goods = new Array<GoodsVO>();
        }
        var fast:Fast = Util.getXMLFast("assets/bak.data/backpack.xml");
        for(goods in fast.nodes.goods){
            var goodsvo:GoodsVO = new GoodsVO();
            goodsvo.id = Std.parseInt(goods.att.id);
            goodsvo.name = goods.att.name;
            goodsvo.type = goods.att.type;
            goodsvo.description = goods.att.description;
            goodsvo.price = goods.att.price;
            goodsvo.resourceName = goods.att.resourceName;
            goodsvo.textPackerName = goods.att.textPackerName;
            _goods.push(goodsvo);
        }
    }

    public function getHaveGoods():Array<GoodsItemVO>{
        return _hasgoods;
    }
    public function getGoods():Array<GoodsVO>{
        return _goods;
    }

    public function getGoodsVo(id:Int):GoodsVO{
        var len:Int = _goods.length;
        for(i in 0...len){
            if(_goods[i].id == id){
                return _goods[i];
            }
        }
        return null;
    }

    public function recoverGoodsData():Void{
        for(i in 0...20){
            var goodsItem:GoodsItemVO = new GoodsItemVO();
            goodsItem.id = i+1;
            goodsItem.num = 2;
            _hasgoods.push(goodsItem);
        }
    }

    public function specifyTypeGoods():Void{
        var len:Int = _hasgoods.length;
        for(i in 0...len){

        }
    }
}
