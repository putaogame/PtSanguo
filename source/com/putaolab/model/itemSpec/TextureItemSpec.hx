package com.putaolab.model.itemSpec;
/**
 * User: gaoyun
 * Date: 14-7-1
 * Time: 下午5:36
 * description：
 */

import component.PTTexturePackerData;
import haxe.xml.Fast;
class TextureItemSpec extends ItemSpec{
    public var imageUrl:String;
    public var xmlUrl:String;
    public var scene:String;
    public function new(data:Fast) {
        super();
        id = data.att.id;
        name = data.att.name;
        imageUrl = data.att.imageUrl;
        xmlUrl = data.att.xmlUrl;
        scene = data.att.scene;
        type = data.att.type;
    }
    public function getTextureData():PTTexturePackerData{
        if(type == "ImageResource"){
            return new PTTexturePackerData(xmlUrl,imageUrl,name);
        }
        return null;

    }

}
