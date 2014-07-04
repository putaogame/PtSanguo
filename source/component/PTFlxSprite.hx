package component;

import flixel.FlxSprite;
import flixel.addons.ui.interfaces.ICursorPointable;

/**
 * User: gaoyun
 * Date: 14-6-10
 * Time: 下午5:51
 * description：
 */

class PTFlxSprite extends FlxSprite implements ICursorPointable{
    public function new() {
        super(X, Y);
    }


}
