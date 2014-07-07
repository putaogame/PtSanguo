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
    
        //priority 1
        ConfigFileManager.getInstance();
        //priority 2
        AssetsManager.getInstance();

    }

}
