package component;

import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.FlxUIList;
import flixel.FlxSprite;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.interfaces.IFlxUIButton;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.util.FlxPoint;

/*
*   1.动态刷新cursor内的wiget
*
* */

class PTFlxUIList extends FlxUIList{
    private var _cursorPointable:Bool = false;
    private var _cursor:PTFlxUICursor = null;
    public var cursor(get,set):PTFlxUICursor;

    public function new(X:Float=0,Y:Float=0,?Widgets:Array<IFlxUIWidget>=null,W:Float=0,H:Float=0,?MoreString:String="<X> more...",?Stacking:Int=FlxUIList.STACK_VERTICAL,?Spacing:Float=0,PrevButtonOffset:FlxPoint=null,NextButtonOffset:FlxPoint=null,PrevButton:IFlxUIButton=null,NextButton:IFlxUIButton=null,CurrentCursor:FlxUICursor){
        cursor =cast CurrentCursor;
        super(X,Y,Widgets,W,H,MoreString,Stacking,Spacing,PrevButtonOffset,NextButtonOffset,PrevButton,NextButton);
    }

    /*
    *        删除cursor内widget，并返回cursor的当前widget
    *        */
    private function removeFromCursor():IFlxUIWidget{
        if(_cursorPointable){
            var currentWiget:IFlxUIWidget = cursor.widgets[cursor.location];
            for(member in group.members){
                cursor.removeWidget(cast member);
            }
            return currentWiget;
        }
        return null;
    }
    /*
    *   把list内的所有widget加入cursor，并刷新当前widget
       *   *  */
    private function addToCursor(wiget:IFlxUIWidget):Void{
        if(_cursorPointable){
            for(member in group.members){
                if(member.visible && member.active)
                    cursor.addWidget(cast member);
            }
            if(wiget != null){
                var location:Int = cursor.widgets.indexOf(wiget);
                cursor.location = location > -1 ? location:cursor.location;
            }

        }
    }
    override private function refreshList():Void {
        if (_skipRefresh) {
            return;
        }
        var currentWiget:IFlxUIWidget = removeFromCursor();

        super.refreshList();
        addToCursor(currentWiget);
//        prevButton.OnUp= new FlxButtonEvent(onClick.bind(-1));
    }

    override public function remove(Object:FlxSprite,Splice:Bool=true):FlxSprite{

        if(_cursorPointable){
            cursor.removeWidget(cast Object);
        }
        var obj = super.remove(Object,Splice);
        return obj;
    }
    override public function add(Object:FlxSprite):FlxSprite{

//        if(_cursorPointable && Std.is(Object,IFlxUIWidget)){
//            cursor.addWidget(cast Object);
//        }
        var obj = super.add(Object);
        return obj;
    }


    public function get_cursor():PTFlxUICursor{
        return _cursor;
    }
    public function set_cursor(FCursor:PTFlxUICursor):PTFlxUICursor{
        this._cursor = cast FCursor;
        _cursorPointable = FCursor != null;

        return FCursor;
    }
}
