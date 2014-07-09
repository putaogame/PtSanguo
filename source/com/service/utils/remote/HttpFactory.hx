package com.service.utils.remote;
import com.service.utils.remote.net.HttpService;
import com.service.utils.remote.events.FaultEvent;
import com.service.utils.remote.events.ResultEvent;
import pgr.dconsole.DC;
import com.service.utils.remote.events.ExceptionEvent;
class HttpFactory {
    private static var _instance:HttpFactory;

    private function new() {
    }
    public function send(method:String,onResult:ResultEvent->Void):Void{
        HttpService.getInstance(method,onResult,onFault,onException);
    }

    private function onFault(e:FaultEvent):Void{
        DC.logError("fault");
    }
    private function onException(e:ExceptionEvent):Void{
        DC.logError("exception code: "+e.code);
        DC.logError("exception msg: "+e.message);
    }

    public static function getInstance():HttpFactory{
        if(_instance == null){
            _instance = new HttpFactory();
        }
        return _instance;
    }
}
