package component;

import flixel.addons.ui.FlxUIButton;
import flixel.addons.ui.interfaces.ICursorPointable;
import flash.display.BitmapData;
import openfl.Assets;
import flixel.util.FlxDestroyUtil;
import flixel.ui.FlxButton;

/**
 * User: gaoyun
 * Date: 14-5-26
 * Time: 下午6:06
 * description：
 */
class PTFlxUIButton extends FlxUIButton implements ICursorPointable{
    public function new(X:Float = 0, Y:Float = 0, ?Label:String, ?OnClick:Void->Void) {
        super(X, Y,Label,OnClick);
    }

    public static inline var CLICK_EVENT:String = "click_button";

    /**
	 * Provide one combined asset, load all 3 state frames from it and infer the width/height
	 * @param	asset graphic to load
	 * @param   for_toggle whether this is for a toggle button or not
	 * @param   key string key for caching (optional)
	 */

     override public function loadGraphicsUpOverDown(asset:Dynamic, for_toggle:Bool=false, ?key:String):Void {
        _slice9_assets = null;
        _slice9_arrays = null;
        resize_ratio = -1;

        if (for_toggle) {
            has_toggle = true;	//this makes it assume it's 6 images tall
        }

        var upB:BitmapData = null;
        var overB:BitmapData = null;
        var downB:BitmapData = null;

        var bd:BitmapData = null;

        if (Std.is(asset, BitmapData)) {
            bd = cast asset;
        }else if (Std.is(asset, String)) {
            bd = Assets.getBitmapData(asset);
        }

        upB = grabButtonFrame(bd, FlxButton.NORMAL, has_toggle);
        overB = grabButtonFrame(bd, FlxButton.HIGHLIGHT, has_toggle);
        downB = grabButtonFrame(bd, FlxButton.PRESSED, has_toggle);

        var normalPixels:BitmapData = assembleButtonFrames(upB, overB, downB);

        if (has_toggle) {
            upB = grabButtonFrame(bd, FlxButton.NORMAL + 3, true);
            overB = grabButtonFrame(bd, FlxButton.HIGHLIGHT + 3, true);
            downB = grabButtonFrame(bd, FlxButton.PRESSED + 3, true);

            var togglePixels:BitmapData = assembleButtonFrames(upB, overB, downB);
            var combinedPixels:BitmapData = combineToggleBitmaps(normalPixels, togglePixels);

            normalPixels = FlxDestroyUtil.dispose(normalPixels);
            togglePixels = FlxDestroyUtil.dispose(togglePixels);

            loadGraphic(combinedPixels, true, upB.width, upB.height, false, key);
        }else {
            loadGraphic(normalPixels, true, upB.width, upB.height, false, key);
        }
    }

    override public function grabButtonFrame(all_frames:BitmapData, button_state:Int, for_toggle:Bool=false, src_w:Int=0, src_h:Int=0):BitmapData{
        var h:Int = src_h;
        if(h == 0){
            if (!for_toggle) {
                h = Std.int(all_frames.height);
            }else {
                h = Std.int(all_frames.height / 6);
            }
        }
        var w:Int = src_w;
        if (w == 0) {
            w = cast all_frames.width;
        }
        var pixels:BitmapData = new BitmapData(w,h);
        _flashRect.x = 0;
        _flashRect.y = 0;
        _flashRect.width = w;
        _flashRect.height = h;
        pixels.copyPixels(all_frames, _flashRect, _flashPointZero);
        return pixels;
    }

}
