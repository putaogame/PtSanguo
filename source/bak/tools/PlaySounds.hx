package bak.tools;

import flixel.FlxG;
import flixel.FlxG;
/**
 * User: gaoyun
 * Date: 14-6-13
 * Time: 下午4:30
 * description：
 */

class PlaySounds {
    private static var _soud:PlaySounds;
    private function new() {
    }

    public static function getInstance():PlaySounds
    {
        if(_soud==null){
            _soud = new PlaySounds();
        }
        return _soud;
    }

    public function playsound(EmbeddedSound:Dynamic, Volume:Float = 1, Looped:Bool = false ,AutoDestroy:Bool = false, ?OnComplete:Void->Void):Void{
        #if android
        FlxG.sound.play(EmbeddedSound, Volume, Looped,AutoDestroy,OnComplete);
        #end
    }

}
