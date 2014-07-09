package com.putaolab.model.vo;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:36
 * description：
 */

import com.putaolab.model.itemSpec.ItemSpec;
import com.putaolab.component.list.itemrender.BaseItemRender;
class GoodsItemData extends BaseItemData{

    public var itemSpec:ItemSpec;
    public var count:Int;
    public function new() {
        super();

    }

}
