package manager;

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


class AssetsManager{
    //当前用的资源
    private var _currentTextPackerData:PTTexturePackerData;
    private var _textPackerMap:Map<String,IFlxDestroyable> = new Map<String,IFlxDestroyable>();

    private static var _instance:AssetsManager;
    private var _textPackerData:PTTexturePackerData;

    private function new() {
    }

    public static function getInstance():AssetsManager
    {
        if(_instance==null)
        {
            _instance = new AssetsManager();
        }
        return _instance;
    }

    public function setSparrowData(xmlName:String,xmlstr:String,pngstr:String):Void
    {
        _currentTextPackerData = new PTTexturePackerData(xmlstr,pngstr);
        _textPackerMap.set(xmlName,_currentTextPackerData);
    }

    /*根据资源名字得到指定的资源*/
    public function getSprite(name:String,textureName:String):FlxSprite
    {
        var texture:PTTexturePackerData = getTextPackerData(textureName);
        var sp = new FlxSprite();
        sp.loadGraphicFromTexture(texture,false,name);
        return sp;
    }
//addByPrefix(Name:String, Prefix:String, FrameRate:Int = 30, Looped:Bool = true):Void
    public function getAnimation(Name:String,Prefix:String,FrameRate:Int = 30,Looped:Bool = true,textureName:String):FlxSprite
    {
        var texture:PTTexturePackerData = getTextPackerData(textureName);
        var sp = new FlxSprite();
        sp.loadGraphicFromTexture(texture);
        sp.animation.addByPrefix(Name,Prefix,FrameRate,Looped);
        return sp;
    }

     public function uploadAnimationToSprite(sprite:FlxSprite,animationNames:Array<String>,prefixs:Array<String>,FrameRate:Int = 30, Looped:Bool = true,textureName:String):Void
     {
         var texture:PTTexturePackerData = getTextPackerData(textureName);
         sprite.loadGraphicFromTexture(texture);

         for(i in 0...animationNames.length){
             sprite.animation.addByPrefix(animationNames[i],prefixs[i],FrameRate,Looped);
         }

     }

    public function uploadTextureToSprite(sprite:FlxSprite,name:String,textureName:String):Void
    {
        getTextPackerData(textureName);
        sprite.loadGraphicFromTexture(_currentTextPackerData,false,name);
    }

    //得到当前的textPacker资源
    public function getTextPackerData(textureName:String):TexturePackerData
    {
        _currentTextPackerData = cast(_textPackerMap.get(textureName),PTTexturePackerData);
        if(_currentTextPackerData == null){
//            setSparrowData();//如果为空怎么处理
        }
//        trace(_currentTextPackerData);
        return _currentTextPackerData;
    }

    //销毁资源
    public function destroyTextPackerData(textureName:String):Void{
        var destryedData:PTTexturePackerData = cast(_textPackerMap.get(textureName),PTTexturePackerData);
        destryedData.destroy();
        _textPackerMap.remove(textureName);
    }

}