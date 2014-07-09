package com.putaolab.component.list;

import flixel.addons.ui.FlxUICursor;
import com.putaolab.component.list.itemrender.GoodsItemRender;
import com.putaolab.model.vo.GoodsItemData;
import com.vo.GoodsInfo;
import flixel.addons.ui.interfaces.IFlxUIButton;
import component.PTFlxUIGroup;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午3:03
 * description：面板上的list
 */

class GoodsList extends BaseList{


    private var _data:Array<GoodsInfo>;
    private var _cursor:FlxUICursor;

    public function new(row:Int = 1,column:Int=1,width:Int = 30,height = 30,?rowSpace:Int,?columnSpace:Int) {
        super(row,column,width,height,rowSpace,columnSpace);
        _renderClassName = "com.putaolab.component.list.itemrender.GoodsItemRender";
    }

    public function setData(data:Array<GoodsInfo>):Void{
        this._data = data;
        initialiseRenders(_data.length);
        refreshList();
    }
    public function setCursor(cursor:FlxUICursor):Void{
        _cursor = cursor;
    }
    //初始化renders
    override private function initialiseRenders(count:Int):Void{
        if(count > _column*_row)
            count = _column*_row;

        var total:Int = 0;
        for(i in 0..._row){
            for(j in 0..._column){
                var render:GoodsItemRender  = cast(Type.createInstance(Type.resolveClass(_renderClassName), [0,0]),GoodsItemRender);
                render.parent = this;
                render.row = i;
                render.column = j;

                add(render);

                _renders.push(render);
                render.y = i*(_itemHeight+_rowSpace);
                render.x = j*(_itemWidth+_columnSpace);
                _cursor.addWidget(render);
                total++;
                if(total >= count){
                    return;
                }
            }
        }
    }
    override public function showNextRow():Bool{
        if(startIndex + _column*_row >= this._data.length){
            return false;
        }
        startIndex += _column;
        refreshList();
        return true;
    }
    override public function showPreviousRow():Bool{
        if(startIndex < _column){
            return false;
        }
        startIndex -= _column;
        refreshList();
        return true;
    }
    override public function refreshList():Void{

        for(i in 0..._renders.length){
            var index:Int = startIndex+i;
            var data:GoodsItemData = null;
            if(index < this._data.length){
                data = new GoodsItemData();
            }
            //var data:GoodsItemData = this._data[index];

            cast(_renders[i],GoodsItemRender).setData(data);
        }
    }

}
