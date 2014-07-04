package battle.charater;

import flixel.util.FlxRandom;
import flixel.FlxObject;
import manager.AssetsManager;
import Math;
import Array;
import flixel.util.FlxColor;
import flixel.FlxSprite;
typedef AttackTarget = { solider:Solider, front:Bool};
typedef GuyAttackMe = { front:Solider, back:Solider};

class Solider extends FlxSprite{

    public var guyAttackMe:GuyAttackMe;//进攻我的人
    public var attackTarget:AttackTarget;//我进攻的人

    public var dead(default,set):Bool;
    public var status:Int = 0;//0,静止，1，前进，2，进攻
    public var type:Int;
    private var V:Float = 200;


    public function new(facing = FlxObject.RIGHT) {
        super();
        this.facing = facing;
        guyAttackMe = {front:null,back:null};
        AssetsManager.getInstance().uploadAnimationToSprite(this,["walk","attack"],["walks","attack"],10,true,"jibing");
        animation.play("walk");

        if(facing == FlxObject.LEFT){
            flipX = true;
        }
        V = 200*FlxRandom.intRanged(5,10)/10;
        trace(V);
    }
    public function attack(solider:Solider,?facetoface:Bool = true):Void{
        if(dead || solider.dead){
            return;
        }
        attackTarget = {solider:solider, front:facetoface};

        if(facetoface){
            guyAttackMe.front = solider;
        }else{
            solider.guyAttackMe.back = this;
        }
    }

    public function set_dead(value:Bool):Bool{
        dead = value;
        attackTarget = null;
        guyAttackMe = null;
//        makeGraphic(50,50);
        return value;
    }
   /* public function lookforOppent():Void{


    }*/
    public function run(vx:Float,vy:Float):Void{
        velocity.x = vx;
        velocity.y = vy;
        status = 1;
        animation.play("walk");
    }
    public function stop():Void{
        velocity.x = 0;
        velocity.y = 0;
        status = 0;
        animation.pause();
    }

   /* public function attackFront(solider:Solider):Void{


    }
    public function attackBack(solider:Solider):Void{


    }*/
    override public function update():Void{
        super.update();

        checkAttackTargetPos();
        checkOpponentStatus();

    }
    /*检查是否在攻击对象的正确位置*/
    private function checkAttackTargetPos(){
        if(attackTarget != null){
            gotoTarget(attackTarget);
        }
    }
    /*检查攻击对象是否已经死亡，更新攻击目标*/
    private function checkOpponentStatus(){
        if(attackTarget != null){
            if(attackTarget.solider.dead)
                attackTarget = null;
        }
    }
    public function gotoTarget(attackTarget:AttackTarget):Void{
        if(attackTarget.front){
            gotoTargetFront(attackTarget.solider);
        }else{
            gotoTargetBack(attackTarget.solider);
        }
    }
    private inline function turn(facing:Int):Void{
        this.facing = facing;
        if(this.facing == FlxObject.LEFT){
            flipX = true;
        }else{
            flipX = false;
        }
    }
    private inline function startAttack():Void{
        stop();
        status = 2;
        animation.play("attack");
    }
    private function gotoTargetFront(solider:Solider):Void{
        if(solider.facing == FlxObject.RIGHT){
            if(Math.abs((solider.x+160) - x) < 10 && Math.abs(y - solider.y) < 20){
                startAttack();
                return;
            }
            turn(FlxObject.LEFT);

            var dx:Float = (solider.x+160) - x;
            var dy:Float = solider.y - y;

            var vx:Float = dx > 0 ? V : -V;
            var vv:Float = Math.abs(V*dy/dx);
            var vy:Float = dy >0 ? vv : -vv;
            run(vx,vy);

        }else if(solider.facing == FlxObject.LEFT){

            if(Math.abs((solider.x-160) - x) < 10 && Math.abs(y - solider.y) < 20){
                startAttack();
                return;
            }
            turn(FlxObject.RIGHT);

            var dx:Float = (solider.x-160) - x;
            var dy:Float = solider.y - y;

            var vx:Float = dx > 0 ? V : -V;
            var vv:Float = Math.abs(V*dy/dx);
            var vy:Float = dy >0 ? vv : -vv;
            run(vx,vy);
        }

    }
    private function gotoTargetBack(solider:Solider):Void{
        if(solider.facing == FlxObject.RIGHT){
            if(Math.abs((solider.x-160) - x) < 10 && Math.abs(y - solider.y) < 20){
                startAttack();
                return;
            }
            turn(FlxObject.RIGHT);

            var dx:Float = (solider.x-160) - x;
            var dy:Float = solider.y - y;

            var vx:Float = dx > 0 ? V : -V;
            var vv:Float = Math.abs(V*dy/dx);
            var vy:Float = dy >0 ? vv : -vv;
            run(vx,vy);

        }else if(solider.facing == FlxObject.LEFT){

            if(Math.abs((solider.x+160) - x) < 10 && Math.abs(y - solider.y) < 20){
                startAttack();
                return;
            }
            turn(FlxObject.LEFT);

            var dx:Float = (solider.x+160) - x;
            var dy:Float = solider.y - y;

            var vx:Float = dx > 0 ? V : -V;
            var vv:Float = Math.abs(V*dy/dx);
            var vy:Float = dy >0 ? vv : -vv;
            run(vx,vy);
        }
    }


}
