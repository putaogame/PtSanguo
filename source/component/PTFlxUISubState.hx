package component;
import flixel.addons.ui.FlxUIGroup;
import flixel.addons.ui.interfaces.ICursorPointable;
import haxe.xml.Fast;
import flixel.addons.ui.FlxUI;
import flixel.addons.ui.FlxUISubState;
import flixel.FlxG;
import flixel.addons.ui.U;
import flixel.addons.ui.FlxUIState;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.interfaces.IFlxUIWidget;

/**
 * User: gaoyun
 * Date: 14-6-9
 * Time: 下午12:00
 * description：
 *  1.添加静态变量currentCursor，方便在其他地方调用
 *  2.cursor的类型改为PTFlxUICursor；
 */

class PTFlxUISubState extends FlxUISubState{

    public static var currentCursor:FlxUICursor = null;
    public var cursor:FlxUICursor = null;
    private var _makeCursor:Bool;		//whether to auto-construct a cursor and load default widgets into it

    public function new() {
        super();
    }

    public override function create():Void {
//        if (FlxUIState.static_tongue != null) {
//            _tongue = FlxUIState.static_tongue;
//        }

        if (_makeCursor == true) {
            cursor = new PTFlxUICursor(onCursorEvent);
            currentCursor = cursor;
        }

        if(_xml_id != "" && _xml_id != null){
            _ui = new FlxUI(null,this,null,_tongue);
            add(_ui);

            _ui.getTextFallback = getTextFallback;

            var bak.data:Fast = U.xml(_xml_id);
            if (bak.data == null) {
                bak.data = U.xml(_xml_id, "xml", true, "");	//try without default directory prepend
            }

            if (bak.data == null) {
            #if debug
				FlxG.log.error("FlxUISubstate: Could not load _xml_id \"" + _xml_id + "\"");
			#end
            }else{
                _ui.load(bak.data);
            }
        }

        if (cursor != null) {			//Cursor goes on top, of course
            add(cursor);
            var widget:IFlxUIWidget;
            if(_ui != null){
                for (widget in _ui.members) {
                    if (Std.is(widget, ICursorPointable) || Std.is(widget, FlxUIGroup))//if it's directly pointable or a group
                    {
                        cursor.addWidget(cast widget);	//add it
                    }
                }
            }

            cursor.location = 0;
        }

        FlxG.mouse.visible = true;
    }

    public function onCursorEvent(code:String, target:IFlxUIWidget):Void
    {
        getEvent(code, target, null);
    }
}
