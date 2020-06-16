package  
{
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	
	public class igrac extends FlxSprite
	{
		[Embed(source = 'resursi/player.png')] public var SIgrac:Class;
		public const SPEED:Number = 250;
		public const gravitacija :int = 1000;
		public const JUMP:int = 400;
		
		public function igrac(X:Number,Y:Number)
		{
			
			super(X, Y);
			loadGraphic(SIgrac,true, true, 56, 72);
			addAnimation("trci", [0, 1], 8, true);
			addAnimation("stoj", [2, 3], 10, true);
			play("stoj");
			acceleration.y = gravitacija;
			maxVelocity.y = 600;	
		}
		override public function update():void
		{
			 velocity.x = 0;
			 if (FlxG.keys.LEFT)
			     {
					 velocity.x = -SPEED; play("trci");
				 }
			 else
			 if (FlxG.keys.RIGHT)
			     {
					 velocity.x = +SPEED; play("trci");
				 }
			 if ((FlxG.keys.justPressed("SHIFT") || FlxG.keys.justPressed("UP")) && !velocity.y)
			      {
					  velocity.y -= JUMP; play("trci");
				  }
			 if(velocity.x == 0 && velocity.y == 0)
                        play("stoj");
                 else
                        play("trci");
			 super.update();
			 
			 
		}
	}

}