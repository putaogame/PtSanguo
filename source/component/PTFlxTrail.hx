package component;

import flixel.addons.effects.FlxTrail;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxDestroyUtil;
import flixel.util.FlxPoint;

/**
 * Nothing too fancy, just a handy little class to attach a trail effect to a FlxSprite.
 * Inspired by the way "Buck" from the inofficial #flixel IRC channel 
 * creates a trail effect for the character in his game.
 * Feel free to use this class and adjust it to your needs.
 * @author Gama11
 */
class PTFlxTrail extends FlxTrail
{

	private var _scale:Float = 1;

	private var _scaleDiff:Float;


	public function new(Sprite:FlxSprite, ?Image:Dynamic, Length:Int = 10, Delay:Int = 3, Alpha:Float = 0.4, Diff:Float = 0.05,Scale:Float = 0.8,ScaleDiff:Float = 0.05):Void
	{
        _scale = Scale;
        _scaleDiff = ScaleDiff;
		super(Sprite,Image,Length,Delay,Alpha,Diff);
	}



	/**
	 * A function to add a specific number of sprites to the trail to increase its length.
	 *
	 * @param 	Amount	The amount of sprites to add to the trail.
	 */
	override public function increaseLength(Amount:Int):Void
	{
		// Can't create less than 1 sprite obviously
		if (Amount <= 0) 
		{
			return;
		}

		_trailLength += Amount;

		// Create the trail sprites
		for (i in 0...Amount)
		{
			var trailSprite:FlxSprite = new FlxSprite(0, 0);
			
			
			if (_image == null) 
			{
				trailSprite.loadGraphicFromSprite(sprite);
			}
			else 
			{
				trailSprite.loadGraphic(_image);
			}
			trailSprite.exists = false;
			add(trailSprite);
			trailSprite.alpha = _transp;
			_transp -= _difference;

            trailSprite.scale.x = trailSprite.scale.y = _scale;
            _scale -= _scaleDiff;
			trailSprite.solid = solid;

            if (trailSprite.alpha <= 0)
			{
				trailSprite.kill();
			}
            if (trailSprite.scale.x <= 0)
            {
                trailSprite.kill();
            }
		}	
	}

}
