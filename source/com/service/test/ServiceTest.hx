package com.service.test;
import pgr.dconsole.DC;
class ServiceTest {
    public function new() {
        init();
    }
    private function init():Void{
        DC.init(1);
        DC.log("ServiceTest V1.0");
    }
}
