package com.putaolab.game.view;
import manager.TextureManager;
import component.PTFlxUIGroup;
import flixel.text.FlxText;
import flixel.FlxSprite;
/*
*
   *     * */
class IconButton extends PTFlxUIGroup {
    private var _icon:FlxSprite;
    private var _iconName:String;
    private var _text:String;
    private var _textField:FlxText;

    public function new() {
        super();
    }
    public function initialise():Void{
        _icon = TextureManager.getInstance().getSpriteWithTexture(_iconName,"texture0");
        add(_icon);
    }

    public function setIcon(iconName:String):Void{
        _iconName = iconName;
    }


}
