package bak;

import com.putaolab.module.backpack.GoodsManager;
import flixel.FlxSprite;
import manager.AssetsManager;
import tools.LogUtil;
import flixel.tweens.FlxTween;
import flixel.addons.ui.FlxUIGroup;
import com.putaolab.module.backpack.GoodsItemVO;
import com.putaolab.module.backpack.GoodsVO;
import tools.LogUtil;
import component.PTFlxUIState;
import component.PTFlxUIButton;
import com.putaolab.view.list.PanelList;
import com.putaolab.module.backpack.GoodsItem;
import com.putaolab.list.BaseItem;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-7-3
 * Time: 下午3:03
 * description：
 */

class BackPackState extends PTFlxUIState{
//    public function new() {
//    }
//list面板上的所有组件
    private var _prevButton:PTFlxUIButton;
    private var _nextButton:PTFlxUIButton;
    private var _goodsList:PanelList;
    private var _listPanel:FlxUIGroup;
    private var _listBG:FlxSprite;
    private var _allGoodsBtn:PTFlxUIButton;
    private var _weapenBtn:PTFlxUIButton;
    private var _equipmentBtn:PTFlxUIButton;
    private var _consumptionBtn:PTFlxUIButton;

//属性面板上的所有组件
    private var _propertyPanel:FlxUIGroup;
    private var _prpertyBG:FlxSprite;
//是否已经有属性面板
    private var _isHavePropertyPanel:Bool = false;

    override public function create():Void
    {
        super.create();
        initialise();
    }

    public function initialise():Void{
        _listPanel = new FlxUIGroup();
        _listPanel.x = 200;
        add(_listPanel);
        initTabMenu();
        initList();
        initBtn();
    }

    public function initTabMenu():Void{
        _listBG = AssetsManager.getInstance().getSprite(0,0,"listBG","commenAssets");
        _listPanel.add(_listBG);
        var btnsp1:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"tabMenu","commenAssets");
        var btnsp2:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"tabMenu","commenAssets");
        var btnsp3:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"tabMenu","commenAssets");
        var btnsp4:FlxSprite = AssetsManager.getInstance().getSprite(0,0,"tabMenu","commenAssets");
        _allGoodsBtn = new PTFlxUIButton(0,0,"allGoods");
        _allGoodsBtn.params = ["allGoods"];
        _allGoodsBtn.loadGraphicsUpOverDown(btnsp1.getFlxFrameBitmapData());
        _weapenBtn = new PTFlxUIButton(0,0,"weapen");
        _weapenBtn.params = ["weapen"];
        _weapenBtn.loadGraphicsUpOverDown(btnsp2.getFlxFrameBitmapData());
        _equipmentBtn = new PTFlxUIButton(0,0,"equipment");
        _equipmentBtn.params = ["equipment"];
        _equipmentBtn.loadGraphicsUpOverDown(btnsp3.getFlxFrameBitmapData());
        _consumptionBtn = new PTFlxUIButton(0,0,"consumption");
        _consumptionBtn.params = ["consumption"];
        _consumptionBtn.loadGraphicsUpOverDown(btnsp4.getFlxFrameBitmapData());
        _allGoodsBtn.x = _weapenBtn.x =_equipmentBtn.x =_consumptionBtn.x = 380;
        _allGoodsBtn.y = 100;
        _weapenBtn.y = 150;
        _equipmentBtn.y = 200;
        _consumptionBtn.y = 250;
        _listPanel.add(_allGoodsBtn);
        _listPanel.add(_weapenBtn);
        _listPanel.add(_equipmentBtn);
        _listPanel.add(_consumptionBtn);
    }

    public function initList():Void{
        var itemArr:Array<BaseItem> = new Array<BaseItem>();
        var goods:Array<GoodsItemVO> = GoodsManager.getInstance().getHaveGoods();
        LogUtil.log("initialise : "+goods.length);
        for(i in 0...goods.length){
            var bak.data:GoodsVO = GoodsManager.getInstance().getGoodsVo(goods[i].id);
            var goodsItem:GoodsItem = new GoodsItem(0,0, bak.data,[goods[i].id+""]);
            goodsItem.setData(goods[i]);
            goodsItem.initialise();
            itemArr.push(goodsItem);
        }
        _goodsList = new PanelList(0,0,3,3);
        _goodsList.x = 0;
        _goodsList.y = 30;
        _listPanel.add(_goodsList);
        _goodsList.setDatas(itemArr);
        _goodsList.refreshList();
    }
    public function initBtn():Void{
        _nextButton = new PTFlxUIButton(0,0,"next");
        _nextButton.params = ["next"];
        _nextButton.x = 280;
        _nextButton.y = 410;
        _listPanel.add(_nextButton);

        _prevButton = new PTFlxUIButton(0,0,"prev");
        _prevButton.params = ["prev"];
        _prevButton.x = 50;
        _prevButton.y = 410;
        _listPanel.add(_prevButton);
    }
    public function ShowPropertyPanel():Void{
        _propertyPanel = new FlxUIGroup();
        add(_propertyPanel);
        _prpertyBG =  AssetsManager.getInstance().getSprite(0,0,"itemPropertyBG","commenAssets");
        _propertyPanel.add(_prpertyBG);
        _propertyPanel.x = -190;
        _propertyPanel.y = 30;

        updatePropertyPanel();
        FlxTween.tween(_propertyPanel,{x:5,y:30},0.5);
    }
    public function updatePropertyPanel():Void{

    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
    }
    override public function getEvent(id:String, target:Dynamic, bak.data:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "next":
                            _goodsList.pageIndex = 1;
                        case "prev":
                            _goodsList.pageIndex = -1;
                        case "allGoods":
                            LogUtil.log("allGoods");
                        case "weapen":
                            LogUtil.log("weapen");
                        case "equipment":
                            LogUtil.log("equipment");
                        case "consumption":
                            LogUtil.log("consumption");
                    }
                case "click_PTFlxUIGroup":
                    if(_isHavePropertyPanel){
                        updatePropertyPanel();
                    }else{
                        ShowPropertyPanel();
                        _isHavePropertyPanel = true;
                    }
                    LogUtil.log("click_PTFlxUIGroup:"+params+" : "+cast(bak.data,GoodsVO).name+" : "+cast(bak.data,GoodsVO).description);
            }
        }
    }
}
