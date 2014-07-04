package battle.charater;

import flixel.group.FlxSpriteGroup;


class Troop extends FlxSpriteGroup{
    public var general:General;
    public var soliders:Array<Solider>;
    public var units:Array<Solider>;
    public var id:Int;
    public var type:Int;
    public var target:Troop;

    public function new(id:Int,type:Int) {
        super();
        this.id = id;
        this.type = type;
        //初始化军队
        units = new Array<Solider>();
        initSolider();
    }
    private function initSolider():Void{

    }
    private static var V:Float = 200;
    public function setAttackTarget(troop:Troop):Void{
        this.target = troop;
        attackTarget();
    }

    private function run(vx:Float,vy:Float):Void{
        for(i in 0...units.length){
            units[i].velocity.x = vx;
            units[i].velocity.y = vy;
        }
    }
    private function attackTarget():Void{
        var targetUnits:Array<Solider> = this.target.units;
        var i:Int = 0;
        while(i < targetUnits.length && i < units.length){
            attackFaceToFace(targetUnits[i],units[i]);
            i++;
        }

        var j:Int = 0;
        if(i < targetUnits.length){
            while(i < targetUnits.length){
                attackBack(targetUnits[i],units[j]);
                j++;
                i++;
            }
        }else if(i < units.length){
            while(i < units.length){
                attackBack(units[i],targetUnits[j]);
                j++;
                i++;
            }
        }

    }
    private inline function attackFaceToFace(solider1:Solider,solider2:Solider):Void{
        solider1.attack(solider2);
        solider2.attack(solider1);
    }
    private inline function attackBack(solider1:Solider,solider2:Solider):Void{
        solider1.attack(solider2,false);
    }
    private inline function checkSoliderOpponent():Void{
        for(i in 0...units.length){
            if(units[i].attackTarget == null){
                lookForOpponent(units[i]);
            }
        }
    }
    /*检查士兵是否死亡*/
    private inline function checkSoliderStatus():Void{
        var j:Int = 0;
        for(i in 0...units.length){
            if(j >= units.length){
                break;
            }
            if(units[j].dead){
                removeSolider(units[j]);
                j--;
            }
            j++;
        }

    }
    /*清除一个士兵*/
    private inline function removeSolider(solider:Solider):Void{
        units.remove(solider);
        remove(solider);
    }
    private function lookForOpponent(solider:Solider):Void{
        if(target != null){
            var units:Array<Solider> = target.units;
            for(i in 0...units.length){
                if(units[i].guyAttackMe != null && units[i].guyAttackMe.front == null){
                    attackFaceToFace(solider,units[i]);
                    return;
                }
            }
            for(i in 0...units.length){
                if(units[i].guyAttackMe != null && units[i].guyAttackMe.back == null){
                    attackBack(solider,units[i]);
                    return;
                }
            }
        }

    }
    override public function update():Void{
        super.update();
        checkSoliderOpponent();
        checkSoliderStatus();
    }
}
