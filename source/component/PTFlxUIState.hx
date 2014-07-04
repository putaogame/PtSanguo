package component;

import flixel.addons.ui.interfaces.ICursorPointable;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.U;
import haxe.xml.Fast;
import flixel.util.FlxPoint;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUIList;
import flixel.addons.ui.FlxUIGroup;
import flixel.addons.ui.FlxUISprite;
import flixel.FlxState;
import flixel.group.FlxSpriteGroup;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flash.system.System;
import flixel.tweens.FlxTween;
/*
*        1.添加静态变量currentCursor，方便在其他地方调用
*        2.cursor的类型改为PTFlxUICursor；
*
*        * */
class PTFlxUIState extends FlxUIState{

    public static var currentCursor:FlxUICursor = null;


    public override function create():Void {
        if (FlxUIState.static_tongue != null) {
            _tongue = FlxUIState.static_tongue;
        }
        if (_makeCursor == true) {
            cursor = new PTFlxUICursor(onCursorEvent);
            currentCursor = cursor;
        }

        if(_xml_id != null && _xml_id != ""){
            trace(" if(_xml_id != null && _xml_id !=  ");
            _ui = new FlxUI(null,this,null,_tongue);
            add(_ui);

            if(getTextFallback != null){
                _ui.getTextFallback = getTextFallback;
            }

            var data:Fast = U.xml(_xml_id);
            if (data == null) {
                data = U.xml(_xml_id, "xml", true, "");	//try again without default directory prepend
            }
            if (data == null) {
                FlxG.log.error("FlxUISubState: Could not load _xml_id \"" + _xml_id + "\"");
            } else{
                _ui.load(data);
            }
        }
        if(_ui == null){
            _ui = new FlxUI(null,this,null,_tongue);
            add(_ui);
        }
        if (cursor != null) {			//Cursor goes on top, of course
            add(cursor);
            var widget:IFlxUIWidget;
            for (widget in _ui.members) {
                if (Std.is(widget, ICursorPointable) || Std.is(widget, FlxUIGroup))//if it's directly pointable or a group
                {
                    cursor.addWidget(cast widget);	//add it
                }
            }
            cursor.location = 0;
        }


        FlxG.mouse.visible = true;
    }

}
