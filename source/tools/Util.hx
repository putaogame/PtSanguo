package tools;

import pgr.dconsole.DC;
import haxe.xml.Fast;
import openfl.Assets;

/**
 * User: gaoyun
 * Date: 14-6-10
 * Time: 下午8:43
 * description：解析XML
 */

class Util {
    public static var isLog:Bool = true;

    public static function getXMLFast(url:String=""):Fast
    {
        var fastData:Fast = new haxe.xml.Fast(Xml.parse(Assets.getText(url)).firstElement());
        return fastData;
    }

    public static function log(data:Dynamic, color:Int = -1):Void{
//        trace("isLog : "+isLog);
        if(isLog){
            DC.init(1);
            DC.log(data,color);
        }else{
            trace(data);
        }
    }
    public static function registerFunction(Function:Dynamic, alias:String):Void{
        DC.init(1);
        DC.registerFunction(Function,alias);
    }
    public static function registerObject(object:Dynamic, alias:String = ""):Void{
        DC.init(1);
        DC.registerObject(object,alias);
    }

    public function playsound(EmbeddedSound:Dynamic, Volume:Float = 1, Looped:Bool = false ,AutoDestroy:Bool = false, ?OnComplete:Void->Void):Void{
        #if android
        FlxG.sound.play(EmbeddedSound, Volume, Looped,AutoDestroy,OnComplete);
        #end
    }







}
