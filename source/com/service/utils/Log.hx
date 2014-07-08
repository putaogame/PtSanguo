package com.service.utils;
import pgr.dconsole.DC;
class Log {
    public static var isdebug:Bool = true;
    private function new() {
    }

    public static function debug(mydata:Dynamic):Void{
        if(isdebug) return;
        DC.log(mydata);
    }
}
