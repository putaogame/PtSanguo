package component;

import com.putaolab.component.list.itemrender.BaseItemRender;
import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.FlxUI;
import flixel.FlxG;
import flixel.input.gamepad.FlxGamepad;
import flixel.addons.ui.FlxUICursor;
import flixel.addons.ui.interfaces.ICursorPointable;
import flixel.addons.ui.interfaces.IFlxUIWidget;
import flixel.addons.ui.interfaces.IFlxUIClickable;
import flixel.addons.ui.interfaces.IHasParams;
import flixel.FlxSprite;
import flixel.ui.FlxButton;
/**
 * @author Lars Doucet
 * 1.添加widgets    get接口，在外部刷新节点时用到
  * 2.override _sortXY方法
  * 3.override addWidget  removeWidget方法
  * 4.if （widget.active/visible == false）,cursor跳过
 */


class PTFlxUICursor extends FlxUICursor
{
    public function new(Callback:String->IFlxUIWidget->Void,InputMethod:Int=FlxUICursor.INPUT_KEYS,DefaultKeys:Int=FlxUICursor.KEYS_DEFAULT_TAB,?Asset:Dynamic=null)
    {
        if(Asset== null){
            Asset = "assets/images/image/arrow.png";
        }
        super(Callback,InputMethod,DefaultKeys,Asset);

    }
    public var widgets(get,null):Array<IFlxUIWidget>;
/*    public function new()
    {

    }*/

    public function get_widgets():Array<IFlxUIWidget>{
        return _widgets;
    }

    override private function _doInput(X:Int, Y:Int):Void {
        //处理List滚动，焦点在上边界或者下边界，继续滚动时，将滚动list内容
        if(Std.is(_widgets[location],BaseItemRender)){
            var item:BaseItemRender = cast(_widgets[location],BaseItemRender);
            var abort:Bool = false;
            if(Y == 1 && item.parent.atLastRow(item)){
                abort = item.parent.showNextRow();
            }else if(Y == -1 && item.parent.atFirstRow(item)){
                abort = item.parent.showPreviousRow();
            }
            if(abort)
                return;

        }

        super._doInput(X,Y);

        if(!_widgets[location].active || !_widgets[location].visible){
            _doInput(X,Y);
        }
    }

 /*   override public function addWidget(widget:IFlxUIWidget):Void
    {
        if (Std.is(widget, ICursorPointable))			//directly pointable? add it
        {
            _widgets.push(widget);
        }
        else if (Std.is(widget, FlxUIGroup))			//it's a group?
        {
            var g:FlxUIGroup = cast widget;
            for (member in g.members)
            {
                if (Std.is(member, IFlxUIWidget))
                {
                    addWidget(cast member);					//add each member individually
                }
            }
        }
        _widgets.sort(_sortXY);
    }*/

   /* override public function removeWidget(widget:IFlxUIWidget):Bool{
        var value:Bool = false;
        if (_widgets != null) {
            if (_widgets.indexOf(widget) != -1) {
                value = _widgets.remove(widget);
                _widgets.sort(_sortXY);
            }
        }
        return value;
    }*/

/*    override private function _sortXY(a:IFlxUIWidget, b:IFlxUIWidget):Int {
        if (a.y + a.height/2 < b.y + b.height/2 ) return -1;
        if (a.y + a.height/2 > b.y + b.height/2) return 1;
        if (a.x + a.width/2< b.x + b.width/2) return -1;
        if (a.x + a.width/2> b.x + b.width/2) return 1;
        return 0;
    }*/
    private var firstTimeMap:Map<Int,Bool> = new Map<Int,Bool>();
    override public function update():Void{
        super.update();

        var gamepadArray:Array<FlxGamepad> = FlxG.gamepads.getActiveGamepads();


            for(i in 0...gamepadArray.length){
                trace("----------------------------------------------bbbbbbbbbbbbbbb");
                var _gamePad:FlxGamepad = gamepadArray[i];

                if(_gamePad == null)
                    continue;

//                trace("i-----",i);
//                trace("_gamePad.id-----",_gamePad.id);
//                trace("iiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
//                trace(ft);
                if(_gamePad.anyJustPressed([0,1,3,4])){
//                    trace("_widgets.length----",_widgets.length);
//                    trace("location-----------",location);
                    var currWidget:IFlxUIWidget = _widgets[location];

                    FlxUI.event("click_button",currWidget,null,cast(currWidget,FlxUIButton).params);
//                    trace("eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee");
                    break;
                }
            }
    }

}