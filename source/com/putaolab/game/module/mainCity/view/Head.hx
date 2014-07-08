package com.putaolab.game.module.mainCity.view;
import flixel.FlxSprite;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import component.PTFlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
class Head extends PTFlxUIGroup {
    private var name:FlxSprite;

    private function new(data:BuildingItemSpec){
        this._buildingItemSpec = data;
    }
    private function initialise():Void {

    }
    private function setBuildingSpec(data:BuildingItemSpec):Void {
        this._buildingItemSpec = data;
    }


}
