package mainCity;

import flixel.FlxSprite;
import tools.Util;
import haxe.xml.Fast;
/**
 * User: gaoyun
 * Date: 14-7-3
 * Time: 下午4:00
 * description：建筑坐标解析
 */

class AnalyzeBuildingPostion {
    private static var _instance:AnalyzeBuildingPostion;
    private var _buildingPostionArr:Array<BuildingSpec>;
    public var buildingSpecArr:Array<BuildingSpec>;


    private function new() {
        _buildingPostionArr = new Array<BuildingSpec>();
        buildingSpecArr = new Array<BuildingSpec>();
    }

    public static function getInstance():AnalyzeBuildingPostion{
        if(_instance == null){
            _instance = new AnalyzeBuildingPostion();
        }
        return _instance;
    }

    public function parseXmlElement(url:String):Void{
        var fast:Fast = Util.getXMLFast(url);
        for(build in fast.nodes.build){
            var buildingSpec:BuildingSpec = new BuildingSpec();
            buildingSpec.id = build.att.id;
            buildingSpec.X = Std.parseInt(build.att.X);
            buildingSpec.Y = Std.parseInt(build.att.Y);
            buildingSpec.type = build.att.type;
            buildingSpec.buildName = build.att.buildName;
            differentiationElement(buildingSpec.type,buildingSpec);
//            _buildingPostionArr.push(buildingSpec);
        }
    }

    public function differentiationElement(type:String,buildSpec:BuildingSpec):Void{
        switch(type){
            case "BuildingSpec":
                buildingSpecArr.push(buildSpec);
        }
    }

    public function applicationPostion(build:FlxSprite,buildSpec:BuildingSpec):Void{
        build.x = buildSpec.X;
        build.y = buildSpec.Y;
    }
}
