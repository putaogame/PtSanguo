package ;

import manager.ConfigFileManager;
import manager.AssetsManager;
/**
 * User: gaoyun
 * Date: 14-7-2
 * Time: 下午4:42
 * description：
 */

class MainClass {
    public function new() {
        initAssets();
    }

    public function initAssets():Void{
        ConfigFileManager.getInstance();

        AssetsManager.getInstance().setSparrowData("commenAssets","assets/images/commonAssets.xml","assets/images/commonAssets.png");

    }

}
