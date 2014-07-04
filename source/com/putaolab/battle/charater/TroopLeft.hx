package com.putaolab.battle.charater;

import Math;
import Math;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import Array;
class TroopLeft extends Troop{


    override private function initSolider():Void{
        general = new General();
        general.x  =130;
        general.y  =130;
        units.push(general);
        add(general);
        soliders = new Array<Solider>();

        var count:Int = 10;

        for(i in 0...count){
            var s:Solider = new Solider();
            soliders.push(s);
            units.push(s);
            add(s);
            if(i % 2 == 0){
                s.x = 0;
            }else{
                s.x = 60;
            }
            s.y = i/2 * 60;
        }
    }

}
