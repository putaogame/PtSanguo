package ;


import component.PTFlxUIButton;
import flixel.FlxSprite;
import component.PTFlxUIState;
/**
 * User: gaoyun
 * Date: 14-6-30
 * Time: 上午10:57
 * description：
 */

class PTTestState extends PTFlxUIState{
    private var testLog:PTFlxUIButton;
    private var testAsset:PTFlxUIButton;
    private var testXML:PTFlxUIButton;
    private var testPlaySound:PTFlxUIButton;
//    private var testLog:PTFlxUIButton;

    public function new() {
        super();
    }
    override public function create():Void{
        testButton();
    }

    private function testButton():Void{
        testLog = new PTFlxUIButton(0,0,"testLog");
        testLog.params = ["testLog"];
        testLog.x = 210;
        testLog.y = 10;

        testAsset = new PTFlxUIButton(0,0,"testAsset");
        testAsset.params = ["testAsset"];
        testAsset.x = 210;
        testAsset.y = 30;

        testXML = new PTFlxUIButton(0,0,"testXML");
        testXML.params = ["testXML"];
        testXML.x = 210;
        testXML.y = 50;

        testPlaySound = new PTFlxUIButton(0,0,"testPlaySound");
        testPlaySound.params = ["testPlaySound"];
        testPlaySound.x = 210;
        testPlaySound.y = 70;

        add(testLog);
        add(testAsset);
        add(testXML);
        add(testPlaySound);

    }

    override public function getEvent(id:String, sender:Dynamic, s:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "testPlaySound":
                        case "testXML":
                        case "testAsset":

                        case "testLog":
                    }
            }
        }
    }
}
