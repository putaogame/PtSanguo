package globalModel;

import haxe.xml.Fast;
/**
 * User: gaoyun
 * Date: 14-7-2
 * Time: 下午2:06
 * description：
 */

import tools.Util;
class TextPackerConfigModel {
    private static var _instance:TextPackerConfigModel;
    public function new() {
    }
    public static function getInstance():TextPackerConfigModel{
        if(_instance == null){
            _instance = new TextPackerConfigModel();
        }
        return _instance;
    }

    public function initliseData():Void{
        var fast:Fast = Util.getXMLFast("");
//        for(){
//
//        }
    }

}
