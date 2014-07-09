package com.service.utils.remote.net;

import com.service.utils.remote.config.LangService;
import com.service.utils.remote.events.ExceptionEvent;
import com.service.utils.remote.events.FaultEvent;
import com.service.utils.remote.events.ResultEvent;
class HttpService {
    //config information
    private static var MAXTHREAD:Int = 5;
    private static var GATEWAY:String = "";
    private static var DESTINATION:String = "";

    private var _isbusy:Bool = false;
    private var _method:String;
    private var _onResult:ResultEvent->Void;
    private var _onFault:FaultEvent->Void;
    private var _onException:ExceptionEvent->Void;

    private static var __index:Int = 0;
    private static var __hosts:Map<Int,HttpService>;
    private function new(method:String,onResult:ResultEvent->Void,onFault:FaultEvent->Void,onException:ExceptionEvent->Void) {
        _method = method;
        _onResult = onResult;
        _onFault = onFault;
        _onException = onException;

        start();
    }
    private function start():Void{
        _isbusy = true;
        onResult(new ResultEvent("TEST RESULT"));
    }
    private function onResult(e:ResultEvent):Void{
        _isbusy = false;
        _onResult(e);
    }
    private function onFault(e:FaultEvent):Void{
        _isbusy = false;
        _onFault(e);
    }
    public function getIsbusy():Bool{
        return _isbusy;
    }

    public static function getInstance(method:String,onResult:ResultEvent->Void,onFault:FaultEvent->Void,onException:ExceptionEvent->Void):HttpService{
        if(__hosts == null){
            __hosts = new Map();
        }
        var curr:Int = 0;
        while(curr<MAXTHREAD){
            var currIndex:Int = currIndex();
            var httpService:HttpService = __hosts.get(currIndex);
            if(httpService == null){
                httpService = new HttpService(method,onResult,onFault,onException);
                __hosts.set(currIndex,httpService);
            }
            if(!httpService.getIsbusy()){
                return httpService;
            }
            curr++;
        }
        //no more thread
        onException(new ExceptionEvent(LangService.CODE_MAX_NUM,LangService.MSG_MAX_NUM));
        return null;
    }
    private static function currIndex():Int{
        var nextIndex:Int = __index;
        if(nextIndex >= MAXTHREAD){
            nextIndex = 0;
        }
        nextIndex++;
        return __index;
    }
}
