package  
{
	import org.flixel.FlxSprite;
	
	public class platforme extends FlxSprite	
	{
		[Embed(source = 'resursi/platform.png')]public var imgPlat:Class;
		
		public function platforme(X:Number,Y:Number) 
		{
			super(X, Y, imgPlat);
			fixed = true;
			collideBottom = false;
			collideLeft = false;
			collideRight = false;
		}
		
	}

}