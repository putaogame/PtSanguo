package com.putaolab.game.module.mainCity.view;
import manager.TextureManager;
import flixel.FlxSprite;
import com.putaolab.model.itemSpec.BuildingItemSpec;
import component.PTFlxUIGroup;
import com.putaolab.game.module.mainCity.data.MainCityData;
class Head extends PTFlxUIGroup {
    private var _name:FlxSprite;
    private var _icon:FlxSprite;
    private var _iconName:String;
    private var _nameString:String;

    private function new(iconName:String,nameString:String){
        super();
        _iconName = iconName;
        _nameString = nameString;
        params = ["Head"];
        initialise();
    }
    private function initialise():Void {
        _icon = TextureManager.getInstance().getSpriteWithTexture(_iconName,"texture0");
        add(_icon);
    }



}
