package com.putaolab.view.scene;

import bak.mainCity.MainCityState;
import flixel.FlxG;
import component.PTFlxUIState;

class MenuState extends PTFlxUIState
{

	override public function create():Void
	{
		super.create();
        FlxG.switchState(new MainCityState());
	}

    public function initialise():Void{

    }

    public function updatePropertyPanel():Void{

    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
    }
    override public function getEvent(id:String, target:Dynamic, bak.data:Dynamic, ?params:Array<Dynamic>):Void{
        if (params != null) {
            switch(id) {
                case "click_button":
                    switch(cast(params[0], String)) {
                        case "next":
                    }
            }
        }
    }


}