package com.putaolab.game.module.mainCity.view;
import manager.TextureManager;
import flixel.FlxSprite;
import openfl.text.TextFormatAlign;
import flixel.text.FlxText;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import component.PTFlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
class BaseBuild extends PTFlxUIGroup {
    private var _buildingItemSpec:BuildingItemSpec;
    private var build:FlxSprite;
    private var _nameTextField:FlxText;
    private var _nameTextFieldBG:FlxSprite;

    private function new(?data:BuildingItemSpec){
        super();
        this._buildingItemSpec = data;
    }
    public function initialise():Void {
        this.x = _buildingItemSpec.cx;
        this.y = _buildingItemSpec.cy;

        build = TextureManager.getInstance().getSpriteWithTexture(_buildingItemSpec.name,"texture0");
        add(build);

        _nameTextFieldBG = TextureManager.getInstance().getSpriteWithTexture("buildNameBG","texture0");
        _nameTextFieldBG.x = (this.width-_nameTextFieldBG.width)*0.5;
        _nameTextFieldBG.y = this.height+8;

        _nameTextField = new FlxText((this.width-_nameTextFieldBG.width)*0.5,_nameTextFieldBG.y,_nameTextFieldBG.width,"",18);
        _nameTextField.alignment = "center";
        _nameTextField.text = "name:"+_buildingItemSpec.description;

        add(_nameTextFieldBG);
        add(_nameTextField);
    }
    public function setBuildingSpec(data:BuildingItemSpec):Void {
        this._buildingItemSpec = data;
    }
}
