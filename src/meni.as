package  
{
	
	import flash.text.Font;
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxText;
	
	public class meni extends FlxState
	{
		[Embed(source = 'resursi/NoviFont.TTF', fontName = "NFont")]public var F:Class;
		[Embed(source = 'resursi/play.png')]public var Sdalje:Class;
		[Embed(source = 'resursi/sinta_menu.png')]public var IPoz:Class;
		[Embed(source = 'resursi/playI.png')]public var Idalje:Class;
		public var Poz:FlxSprite;
		public var naslov:FlxText;
		public var info:FlxText;
		public var dugme:FlxButton;
		public var dalje:FlxSprite;
		public var Invdalje:FlxSprite;
		
		override public function create():void
		{
			
			FlxG.mouse.show();
			
			naslov = new FlxText(160, 20, 400, "Milan Micic");
			naslov.setFormat("NFont", 72, 0xEEDD88,"left",0xFF000000);
		    Poz = new FlxSprite(240, 180, IPoz);
			Poz.scale.x = 4; Poz.scale.y = 4;
			info = new FlxText(240, 370, 290, "arrows  -  move      shift    -   jump");
			info.font = "NFont"; info.size = 32; info.color = 0x000000;
			dugme = new FlxButton(560, 430, Funkcija);
			dalje = new FlxSprite(0,0,Sdalje);
			Invdalje = new FlxSprite(0,0,Idalje);
			dugme.loadGraphic(dalje,Invdalje);
			add(Poz);
			add(naslov);
			add(info);
			add(dugme);
			
		}
		public function Funkcija():void
		{  
			FlxG.state=new(stanje);
		}
	}

}