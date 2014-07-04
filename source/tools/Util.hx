package tools;

import haxe.xml.Fast;
import openfl.Assets;

/**
 * User: gaoyun
 * Date: 14-6-10
 * Time: 下午8:43
 * description：解析XML
 */

class Util {

    public static function getXMLFast(url:String=""):Fast
    {
        var fastData:Fast = new haxe.xml.Fast(Xml.parse(Assets.getText(url)).firstElement());
        return fastData;
    }
}
