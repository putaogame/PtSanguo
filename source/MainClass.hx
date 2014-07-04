package ;

import mainCity.AnalyzeBuildingPostion;
import manager.AssetsManager;
import com.putaolab.module.backpack.GoodsModel;
/**
 * User: gaoyun
 * Date: 14-7-2
 * Time: 下午4:42
 * description：
 */

class MainClass {
    public function new() {
        initAssets();
        initliseModel();
    }

    public function initAssets():Void{
        AnalyzeBuildingPostion.getInstance().parseXmlElement("assets/config/buildingPostion.xml");
        AssetsManager.getInstance().setSparrowData("commenAssets","assets/images/commonAssets.xml","assets/images/commonAssets.png");
    }

    public function initliseModel():Void{
        GoodsModel.getInstance();
    }
}
