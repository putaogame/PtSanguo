package manager;

import com.putaolab.model.itemSpec.ResourceItemSpec;
import Array;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import tools.Util;
import haxe.xml.Fast;
import Array;
import Array;
import component.PTTexturePackerData;
import flixel.interfaces.IFlxDestroyable;
import flixel.util.loaders.TexturePackerData;
import component.PTTexturePackerData;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-5-26
 * Time: 上午11:44
 * description：资源管理类
 */


class ConfigFileManager{

    private static var _instance:ConfigFileManager;
    public var buildingItemSpecs:Array<BuildingItemSpec>;
    public var resourceItemSpecs:Array<ResourceItemSpec>;
    private function new() {
        initialiseBuildingModel();
        initialiseResourceModel();
        initialiseGoodsModel();
    }

    public static function getInstance():ConfigFileManager
    {
        if(_instance==null)
        {
            _instance = new ConfigFileManager();
        }
        return _instance;
    }
    private function initialiseBuildingModel():Void{
        var fast:Fast = Util.getXMLFast("assets/data/item/buildingItems.xml");
        buildingItemSpecs = new Array<BuildingItemSpec>();
        for(building in fast.nodes.buildingItem){
            var buildingItemSpec:BuildingItemSpec = new BuildingItemSpec(building);
            buildingItemSpecs.push(buildingItemSpec);
        }
    }
    private function initialiseResourceModel():Void{
        var fast:Fast = Util.getXMLFast("assets/data/resource/resource.xml");
        resourceItemSpecs = new Array<ResourceItemSpec>();
        for(resource in fast.nodes.resourceItem){
            var resourceItemSpec:ResourceItemSpec = new ResourceItemSpec(resource);
            resourceItemSpecs.push(resourceItemSpec);
        }
    }
    private function initialiseGoodsModel():Void{

    }







}