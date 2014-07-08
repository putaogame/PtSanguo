package com.putaolab.game.module.mainCity.view;
import flixel.text.FlxText;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import component.PTFlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
class BaseBuild extends PTFlxUIGroup {
    private var _buildingItemSpec:BuildingItemSpec;
    private var _nameTextField:FlxText;

    private function new(data:BuildingItemSpec){
        this._buildingItemSpec = data;
    }
    private function initialise():Void {

    }
    private function setBuildingSpec(data:BuildingItemSpec):Void {
        this._buildingItemSpec = data;
    }


}
