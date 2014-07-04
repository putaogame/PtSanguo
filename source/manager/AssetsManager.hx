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

    private static var _assetsmanger:AssetsManager;
    private var _textPackerData:PTTexturePackerData;

    private function new() {
    }

    public static function getInstance():AssetsManager
    {
        if(_assetsmanger==null)
        {
            _assetsmanger = new AssetsManager();
        }
        return _assetsmanger;
    }

    public function setSparrowData(xmlName:String,xmlstr:String,pngstr:String):Void
    {
        _currentTextPackerData = new PTTexturePackerData(xmlstr,pngstr);
        _textPackerMap.set(xmlName,_currentTextPackerData);
    }

    /*根据资源名字得到指定的资源*/
    public function getSprite(X:Float=0,Y:Float=0,name:String,xmlName:String):FlxSprite
    {
        getTextPackerData(xmlName);
        var sp = new FlxSprite(0, 0);
        sp.x = X;
        sp.y = Y;
        sp.loadGraphicFromTexture(_currentTextPackerData,false,name);
        return sp;
    }

    public function getAnimation(X:Float,Y:Float,Ani_Key:String,Ani_Name:String,FrameRate:Int = 30,xmlName:String):FlxSprite
    {
        getTextPackerData(xmlName);
        var sp = new FlxSprite(X, Y);
        sp.loadGraphicFromTexture(_currentTextPackerData);
        sp.animation.addByPrefix(Ani_Key,Ani_Name,FrameRate);
        return sp;
    }

     public function uploadAnimationToSprite(sprite:FlxSprite,animationNames:Array<String>,prefixs:Array<String>,FrameRate:Int = 30, Looped:Bool = true,xmlName:String):Void
     {
         getTextPackerData(xmlName);
         sprite.loadGraphicFromTexture(_currentTextPackerData);
         for(i in 0...animationNames.length){
             sprite.animation.addByPrefix(animationNames[i],prefixs[i],FrameRate,Looped);
         }

     }

    public function uploadTextureToSprite(sprite:FlxSprite,name:String,xmlName:String):Void
    {
        getTextPackerData(xmlName);
        sprite.loadGraphicFromTexture(_currentTextPackerData,false,name);
    }

    //得到当前的textPacker资源
    public function getTextPackerData(xmlName:String):TexturePackerData
    {
        _currentTextPackerData = cast(_textPackerMap.get(xmlName),PTTexturePackerData);
        if(_currentTextPackerData == null){
//            setSparrowData();//如果为空怎么处理
        }
//        trace(_currentTextPackerData);
        return _currentTextPackerData;
    }

    //销毁资源
    public function destroyTextPackerData(xmlName:String):Void{
        var destryedData:PTTexturePackerData = cast(_textPackerMap.get(xmlName),PTTexturePackerData);
        destryedData.destroy();
        _textPackerMap.remove(xmlName);
    }

}