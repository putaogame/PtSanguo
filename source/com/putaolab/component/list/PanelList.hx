package com.putaolab.componentlist;

import com.putaolab.componentlist.itemrender.BaseItemRender;
import tools.LogUtil;
import flixel.addons.ui.interfaces.IFlxUIButton;
import component.PTFlxUIGroup;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午3:03
 * description：面板上的list
 */

class PanelList extends PTFlxUIGroup{

    public var pageIndex(default, set):Int = 0;
    public var _pageIndex:Int = 0;
    private var _row:Int;
    private var _column:Int;
    private var _rowSpace:Int = Reg.rowSpace;
    private var _columnSpace:Int = Reg.columnSpace;
    private var _prevButton:IFlxUIButton;
    private var _nextButton:IFlxUIButton;
    private var _itemArr:Array<BaseItemRender>;
    private var _currentItemArr:Array<BaseItemRender>;

    public function new(X:Int,Y:Int,row:Int,column:Int) {
        super(X, Y);
        _row = row;
        _column = column;
    }

    //加减pageIndex
    public function set_pageIndex(pageindex:Int):Int{
        _pageIndex += pageindex;
        refreshList();
        return _pageIndex;
    }

    public function refreshList():Void{
        removeCurrentItems();
        var len:Int = _row*_column;
        if(_pageIndex<0){//判断第一页跳到最后一页
            _pageIndex = (_itemArr.length%len);
        }
        LogUtil.log("refreshList() : "+_pageIndex+" :: "+_itemArr.length%len);
        if(_pageIndex > (_itemArr.length%len)){//判断最后一页跳到第一页
            _pageIndex = 0;
        }

        if(_itemArr.length>len*(_pageIndex+1)){//判断是否能够填充满一个版块
            _currentItemArr = _itemArr.slice(_pageIndex*len,len*(_pageIndex+1));
        }else{
            _currentItemArr = _itemArr.slice(_pageIndex*len,_itemArr.length);
        }

        for(i in 0..._column){
            for(j in 0..._row){
                if(_currentItemArr[i*_row+j] == null){
                    return;
                }
                _currentItemArr[i*_row+j].x = j*(_rowSpace+_currentItemArr[i*_row+j].width);
                _currentItemArr[i*_row+j].y = i*(_columnSpace+_currentItemArr[i*_row+j].height);
                add(_currentItemArr[i*_row+j]);
            }
        }
    }

    public function removeCurrentItems():Void{
        if(_currentItemArr == null || _currentItemArr.length == 0){
            return;
        }
        LogUtil.log("removeCurrentItems() : "+_currentItemArr.length);
        var len:Int = _currentItemArr.length;
        for(i in 0...len){
            remove(_currentItemArr[i]);
        }
    }

    public function setDatas(datas:Array<BaseItemRender>):Void{
        _itemArr = datas;
    }
}
