package com.putaolab.component.list;

import com.putaolab.component.list.itemrender.BaseItemRender;
import flixel.addons.ui.interfaces.IFlxUIButton;
import component.PTFlxUIGroup;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午3:03
 * description：面板上的list
 */

class BaseList extends PTFlxUIGroup{

    private var startIndex:Int = 0;

    private var _row:Int;
    private var _column:Int;

    private var _itemWidth:Int;
    private var _itemHeight:Int;
    private var _rowSpace:Int;
    private var _columnSpace:Int;
    private var _renders:Array<BaseItemRender>;

    private var _renderClassName:String;

    private var _prevButton:IFlxUIButton;
    private var _nextButton:IFlxUIButton;

    public function new(row:Int = 1,column:Int=1,width:Int = 30,height = 30,rowSpace:Int=10,columnSpace:Int=10) {
        super();
        _renders = [];
        _row = row;
        _itemWidth = width;
        _itemHeight = height;
        _column = column;
        _rowSpace = rowSpace;
        _columnSpace = columnSpace;
    }
    private function setItemRenderName(renderClassName:String):Void{
        this._renderClassName = renderClassName;
    }
    private function setColumRow(colum:Int,row:Int,width:Int = 30,height = 30):Void{
        this._column = colum;
        this._row = row;
        _itemWidth = width;
        _itemHeight = height;
    }

//初始化renders
    private function initialiseRenders(count:Int):Void{

    }
    public function showNextRow():Bool{
        return false;
    }
    public function showPreviousRow():Bool{
        return false;
    }
    public function atFirstRow(item:BaseItemRender):Bool{
        return item.row == 0;
    }
    public function atLastRow(item:BaseItemRender):Bool{
        return item.row == _row-1;
    }

    public function refreshList():Void{

    }


}
