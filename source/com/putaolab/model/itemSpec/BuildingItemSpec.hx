package com.putaolab.model.itemSpec;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:36
 * description：
 */

import haxe.xml.Fast;
class BuildingItemSpec extends ItemSpec{

    public var cx:Int;
    public var cy:Int;

    public function new(data:Fast) {
        super();
        id = data.att.id;
        name = data.att.name;
        description = data.att.description;
        cx = Std.parseInt(data.att.x);
        cy = Std.parseInt(data.att.y);

    }

}
