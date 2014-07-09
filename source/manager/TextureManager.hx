package manager;

import tools.Util;
import com.putaolab.model.itemSpec.TextureItemSpec;
import component.PTTexturePackerData;
import component.PTTexturePackerData;
import Array;
import Array;
import component.PTTexturePackerData;
import flixel.interfaces.IFlxDestroyable;
import flixel.util.loaders.TexturePackerData;
import component.PTTexturePackerData;
import flixel.FlxSprite;
/**
 * User: gaoyun
 * Date: 14-5-26
 * Time: 上午11:44
 * description：资源管理类
 */


class TextureManager{

    private static var _instance:TextureManager;
    //
    private var _textures:Array<PTTexturePackerData>;
    private var _publicTexture:PTTexturePackerData;
    private var _loadingTexture:PTTexturePackerData;

    private function new() {
        _textures = new Array<PTTexturePackerData>();
        initPublicTexture();
    }
    public static function getInstance():TextureManager
    {
        if(_instance == null)
        {
            _instance = new TextureManager();
        }
        return _instance;
    }
    private function initPublicTexture():Void{
        destroyPreTexture();

        var textureItemSpecs:Array<TextureItemSpec> = ConfigFileManager.getInstance().textureItemSpecs;
        Util.log("initPublicTexture: textureItemSpecs.length    "+textureItemSpecs.length);

        for(i in 0...textureItemSpecs.length){
            if(textureItemSpecs[i].scene == "public"){
                _publicTexture = textureItemSpecs[i].getTextureData();
                Util.log("initPublicTexture: _publicTexture    ");
                Util.log(_publicTexture);
            }else if(textureItemSpecs[i].scene == "loading"){
                _loadingTexture = textureItemSpecs[i].getTextureData();
            }
        }
    }
    public function initTextureByScene(scene:String,destroyPreTexture:Bool = true):Void{
        if(destroyPreTexture)
            this.destroyPreTexture();
        Util.log("initTextureByScene: scene  "+scene);
        var textureItemSpecs:Array<TextureItemSpec> = ConfigFileManager.getInstance().textureItemSpecs;
        for(i in 0...textureItemSpecs.length){
            Util.log("textureItemSpecs[i].scene  "+textureItemSpecs[i].scene);
            if(textureItemSpecs[i].scene == scene ){
                _textures.push(textureItemSpecs[i].getTextureData());
            }
        }

    }
    public inline function destroySpecifyedTexture(sceneName:String):Void{
        var j:Int = 0;
        for(i in 0..._textures.length){
            if(j >= _textures.length){
                break;
            }
            if(_textures[j].name == sceneName){
                _textures[j].destroy();
                _textures.splice(j,1);
                j--;
            }
            j++;
        }

    }
    private inline function destroyPreTexture():Void{
        if(_textures != null){
            while(_textures.length > 0){
                var t:PTTexturePackerData = _textures.pop();
                t.destroy();
            }
        }
    }

    /*根据资源名字得到指定的资源*/
    public function getSpriteWithTexture(name:String,textureName:String):FlxSprite
    {
        var texture:PTTexturePackerData = getTextPackerData(textureName);

        var sp = new FlxSprite();
        sp.loadGraphicFromTexture(texture,false,name);
        return sp;
    }
    public function getSpriteWithAnimation(Name:String,Prefix:String,FrameRate:Int = 30,Looped:Bool = true,textureName:String):FlxSprite
    {
        var texture:PTTexturePackerData = getTextPackerData(textureName);
        var sp = new FlxSprite();
        sp.loadGraphicFromTexture(texture);
        sp.animation.addByPrefix(Name,Prefix,FrameRate,Looped);
        return sp;
    }
    public function uploadTextureToSprite(sprite:FlxSprite,name:String,textureName:String):Void
    {
        sprite.loadGraphicFromTexture(getTextPackerData(textureName),false,name);
    }
     public function uploadAnimationToSprite(sprite:FlxSprite,animationNames:Array<String>,prefixs:Array<String>,FrameRate:Int = 30, Looped:Bool = true,textureName:String):Void
     {
         var texture:PTTexturePackerData = getTextPackerData(textureName);
         sprite.loadGraphicFromTexture(texture);

         for(i in 0...animationNames.length){
             sprite.animation.addByPrefix(animationNames[i],prefixs[i],FrameRate,Looped);
         }

     }

    //得到当前的textPacker资源
    public function getTextPackerData(textureName:String):PTTexturePackerData
    {
        Util.log("getTextPackerData  arg  :  "+textureName);
          if(_publicTexture != null && _publicTexture.name == textureName){
            return _publicTexture;
          }else if(_loadingTexture != null && _loadingTexture.name == textureName){
              return _loadingTexture;
          }
          for(i in 0..._textures.length){
            if(_textures[i].name == textureName){
                return _textures[i];
            }
          }

          return null;

    }

}