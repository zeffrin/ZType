package engine 
{
	import flash.display.BitmapData;
	import engine.GameEngine;
	import engine.dataRandom;
	import engine.uiBg;
	
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	
	internal class uiBgStarfield extends uiBg
	{
		private const countStarfield:int = 3;
		private const starsPerField:int = 20;
		private const minStarIntensity:int = 0xff;
		private const maxStarItensity:int = 0xdd;
		private const starX:int = 0;
		private const starY:int = 1;
		private const starIntensity:int = 2;

		private var _starfield:Array;  // _starfield[0-2] = [[x, y, intensity], [x, y, intensity], etc]
		
		public function uiBgStarfield(width:int, height:int):void
		{
			this.width = width;
			this.height = height;
			
			// prepare the space background
			_starfield = new Array(countStarfield);
			for (i = 0; i < countStarfield; i++)
			{
				_starfield[i] = new Array(starsPerField);
			}
			
			// fill the array with stars
			for (var i:int = 0; i < countStarfield; i++)
			{
				for (var j:int = 0; j < starsPerField; j++)
				{
					_starfield[i][j] = [dataRandom.randomNumber(0, width), dataRandom.randomNumber(0, height), dataRandom.randomNumber(minStarIntensity, maxStarItensity)];
				}
			}
			return;
		}
		
		override public function doCleanup():void
		{
			for (var i:int = 0; i < countStarfield; i++)
			{
				for (var j:int = 0; j < starsPerField; j++) 
				{
					_starfield[i][j] = null; 
				}
				_starfield[i] = null;
			}
			return;
		}
		
		override public function doUpdate():void
		{
			for (var i:int = 0; i < countStarfield; i++)
			{
				for (var j:int = 0; j < starsPerField; j++)
				{
					_starfield[i][j][starX] -= i + 1;
					if (_starfield[i][j][starX] < 0)
						_starfield[i][j][starX] = this.width;
				}
			}
		}
		
		override public function doRender(s:BitmapData, x:int, y:int):void
		{
			s.fillRect( s.rect, 0xff000000 );
			for (var i:int = 0; i < countStarfield; i++)
			{
				for (var j:int = 0; j < starsPerField; j++)
				{
					// put intensity value in the three colour channels
					var colour:uint = 0xff000000;
					for (var k:int = 0; k < 3; k++)
					{
						colour |= _starfield[i][j][starIntensity] << k * 8;
					}
					s.setPixel(_starfield[i][j][starX], _starfield[i][j][starY], colour);
				}
			}
			return;
		}
	
	}

}