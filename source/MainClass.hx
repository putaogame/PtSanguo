package ;

import com.engine.core.UIManager;
import com.engine.core.Common;
import manager.ConfigFileManager;
import manager.TextureManager;
/**
 * User: gaoyun
 * Date: 14-7-2
 * Time: 下午4:42
 * description：
 */

class MainClass {
    public function new() {
        start();
    }

    public function start():Void{
        //priority 1
        ConfigFileManager.getInstance();
        //priority 2
        TextureManager.getInstance();
        //priority 3
        Common.ui = UIManager.getInstance();
    }

}
