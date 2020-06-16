package  
{
	
	import org.flixel.FlxButton;
	import org.flixel.FlxG;
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	import org.flixel.FlxState;
	import org.flixel.FlxTileblock;
	import org.flixel.FlxU;
	
	public class stanje extends FlxState	
	{
		[Embed(source = 'resursi/level.png')] public var imgLevel:Class;
		[Embed(source = 'resursi/bg.png')] public var imgBoja:Class;
		[Embed(source = 'resursi/struggle.png')]public var imgStrugle:Class;
		[Embed(source = 'resursi/desperation.png')]public var imgDespe:Class;
		[Embed(source = 'resursi/longing.png')]public var imgLon:Class;
		[Embed(source = 'resursi/pain.png')]public var imgPain:Class;
		[Embed(source = 'resursi/toiletFilmStrip.png')] public var imgToalet:Class;
		[Embed(source = 'resursi/release.png')]public var imgReal:Class;
		[Embed(source = 'resursi/toilet.mp3')]public var zika:Class;
		
	    public var pozadina:FlxSprite;
		public var vrata:FlxTileblock;
		public var Igrac:igrac;
		public var PGrupa:FlxGroup;
		public var grupa:FlxGroup;
		public var zid:FlxTileblock;
		public var strugle:FlxSprite;
		public var despe:FlxSprite;
		public var lon:FlxSprite;
		public var pain:FlxSprite;
		public var kraj:FlxSprite;
		public var toalet:FlxSprite;
		
				
		override public function create():void 
		{   
			FlxG.mouse.hide();
			
			pozadina = new FlxSprite(0,0, imgLevel);
		
			zid = new FlxTileblock(0, 0, 5, 895);
			zid.loadGraphic(imgBoja);
			add(zid);
			bgColor = 0xFFFBEF75;
			
			add(pozadina);
			
			vrata = new FlxTileblock(2645, 610, 10, 60);
			vrata.loadGraphic(imgBoja);
			vrata.fixed = true;
			add(vrata);
			
			strugle = new FlxSprite(100, 720, imgStrugle);
			add(strugle);
			despe = new FlxSprite(610, 450, imgDespe);
			add(despe);
			lon = new FlxSprite(1550, 275, imgLon);
			add(lon);
			pain = new FlxSprite(2240, 130, imgPain);
			add(pain);
			
			toalet = new FlxSprite(2560, 576);
			toalet.loadGraphic(imgToalet,true,false, 192, 128);
			
			toalet.addAnimation("otvoren", [0]);
			toalet.addAnimation("zatvoren",[1],0);
			toalet.play("otvoren");
			add(toalet);
			
			grupa = new FlxGroup();
			grupa.add(new sprajtovi(0, 896, 528, 15));
			grupa.add(new sprajtovi(512, 768, 15, 140));
			grupa.add(new sprajtovi(527, 768, 112, 15));
			grupa.add(new sprajtovi(624, 783, 15, 65));
			grupa.add(new sprajtovi(639, 833, 80, 15));
			grupa.add(new sprajtovi(704, 576, 15, 257));
			grupa.add(new sprajtovi(704, 576, 255, 15));
			grupa.add(new sprajtovi(944, 576, 15, 208));
			grupa.add(new sprajtovi(959, 769, 115, 15));
			grupa.add(new sprajtovi(1072, 769, 15, 79));
			grupa.add(new sprajtovi(1072, 832, 340, 15));
			grupa.add(new sprajtovi(1408, 512, 15, 336));
			grupa.add(new sprajtovi(1408, 512, 144, 15));
			grupa.add(new sprajtovi(1536, 448, 15, 64));
			grupa.add(new sprajtovi(1536, 448, 144, 15));
			grupa.add(new sprajtovi(1665, 384, 15, 64));
			grupa.add(new sprajtovi(1665, 384, 174, 15));
			grupa.add(new sprajtovi(1840, 384, 15, 207));
			grupa.add(new sprajtovi(1840, 576, 415, 15));
			grupa.add(new sprajtovi(2240, 320, 15, 257));
			grupa.add(new sprajtovi(2240, 320, 127, 15));
			grupa.add(new sprajtovi(2352, 320, 15, 385));
			grupa.add(new sprajtovi(2352, 705, 400, 15));
			grupa.add(new sprajtovi(2752, 560, 15, 160));
			grupa.add(new sprajtovi(2500, 560, 265, 15));
			grupa.add(new sprajtovi(2495, 0, 15, 575));
			
			PGrupa = new FlxGroup();
			PGrupa.add(new platforme(400, 808));
			PGrupa.add(new platforme(580, 670));
			PGrupa.add(new platforme(610, 600));
			PGrupa.add(new platforme(1090, 690));
			PGrupa.add(new platforme(1180, 630));
			PGrupa.add(new platforme(1280, 700));
			PGrupa.add(new platforme(1330, 600));
			PGrupa.add(new platforme(1290, 520));
			PGrupa.add(new platforme(1930, 450));
			PGrupa.add(new platforme(2030, 400));
			PGrupa.add(new platforme(2130, 350));
			
			kraj = new FlxSprite(2460, 540, imgReal);
			
			Igrac = new igrac(50, 850);
			
			
			add(PGrupa);
			add(Igrac);
			
			FlxG.followBounds(0, 0, 2880, 960);
			FlxG.follow(Igrac,5);
				
		    if (FlxU.collide(toalet,Igrac) == true )
			  {
				 Igrac.kill();
				 toalet.play("zatvoren");
				 FlxG.play(zika, 1, false);
			     kraj.velocity.y = -40;
			     add(kraj);							     				
			       
			  }
		   
		
			
								
		}	  
		
		override public function update():void
		{
			
			if (FlxU.collide(vrata,Igrac) == true )
			  {
				 toalet.play("zatvoren");
				 Igrac.kill();
			     kraj.velocity.y = -40;
			     add(kraj);							     				
			     FlxG.play(zika, 1, false);
			  }  
			    if 
					 (kraj.y <= 100)
					 {
						 FlxG.state = new(meni);
				     }
			  
			super.update();
			FlxU.collide(Igrac, grupa);
			FlxU.collide(Igrac, zid);
			FlxU.collide(Igrac, PGrupa);
			
			
			
			 
			
			
			
		}
		
	}

}