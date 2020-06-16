package  
{
	import org.flixel.FlxSprite;
	
	public class sprajtovi extends FlxSprite
	{
		
		public function sprajtovi(X:Number,Y:Number, Width:Number, Height:Number) 
		{
			super(X, Y);
			createGraphic(Width, Height, 0xff000000);
			this.fixed = true;
			
		}
		
	}

}