package manager;

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
    //当前用的资源
    private var _currentTextPackerData:PTTexturePackerData;
    private var _textPackerMap:Map<String,IFlxDestroyable> = new Map<String,IFlxDestroyable>();
    private var _textPackerData:PTTexturePackerData;



    private static var _instance:AssetsManager;
    private var _textures:Array<PTTexturePackerData>;
    private var _publicTexture:PTTexturePackerData;
    private var _loadingTexture:PTTexturePackerData;

    private function new() {
        _textures = new Array<PTTexturePackerData>();
        initPublicTexture();
    }
    public static function getInstance():AssetsManager
    {
        if(_instance == null)
        {
            _instance = new AssetsManager();
        }
        return _instance;
    }
    private function initPublicTexture():Void{
        destroyPreTexture();

        var textureItemSpecs:Array<TextureItemSpec> = ConfigFileManager.getInstance().textureItemSpecs;
        for(i in 0...textureItemSpecs.length){
            if(textureItemSpecs[i].scene == "public"){
                _publicTexture = textureItemSpecs[i].getTextureData();
            }else if(textureItemSpecs[i].scene == "loading"){
                _loadingTexture = textureItemSpecs[i].getTextureData();
            }
        }
    }
    public function initTextureByScene(scene:String):Void{
        destroyPreTexture();

        var textureItemSpecs:Array<TextureItemSpec> = ConfigFileManager.getInstance().textureItemSpecs;
        for(i in 0...textureItemSpecs.length){
            if(textureItemSpecs[i].scene == scene ){
                _textures.push(textureItemSpecs[i].getTextureData());
            }
        }
    }
    private inline function destroyPreTexture():Void{
        if(_textures != null)
            while(_textures.length > 0){
                var t:PTTexturePackerData = _textures.pop();
                t.destroy();
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
        getTextPackerData(textureName);
        sprite.loadGraphicFromTexture(_currentTextPackerData,false,name);
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
          if(textureName == "public"){
            return _publicTexture;
          }else if(textureName == "loading"){
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