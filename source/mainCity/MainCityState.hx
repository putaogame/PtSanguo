package mainCity;

import component.PTFlxUIState;
/**
 * User: gaoyun
 * Date: 14-7-3
 * Time: 下午3:40
 * description：
 */

class MainCityState extends PTFlxUIState{
    public function new() {
        super();
    }

    override public function create():Void{
        super.create();
        initlise();
    }

    public function initlise():Void{
        var buildSpecArr:Array<BuildingSpec> = AnalyzeBuildingPostion.getInstance().buildingSpecArr;
        var len:Int = buildSpecArr.length;
        for(i in 0...len){
            trace(buildSpecArr[i].X);
        }
    }
}
