package tools;

import pgr.dconsole.DC;
/**
 * User: gaoyun
 * Date: 14-6-30
 * Time: 上午11:10
 * description：日志管理类
 */

class LogUtil {
    //打印log信息还是trace信息 true:打印log信息
    public static var isLog:Bool = true;
    public function new() {
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
}
