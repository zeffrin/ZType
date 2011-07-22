package com.zsoft.game.lib.ui.bg 
{
	import com.zsoft.game.lib.trajectory.straight;
	import flash.display.BitmapData;
	import com.zsoft.game.lib.ui.Bg;
	import com.zsoft.game.lib.misc.random;
	import flash.geom.Point;
	
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	
	public class starfield extends Bg
	{
		private const countStarfield:int = 3;
		private const starsPerField:int = 20;
		private const minStarIntensity:int = 0xff;
		private const maxStarItensity:int = 0xdd;
		private const starPos:int = 0;
		private const starIntensity:int = 1;

		private var _starfield:Array;  // _starfield[0-2] = [[x, y, intensity], [x, y, intensity], etc]
		
		public function starfield(width:int, height:int):void
		{
			this.width = width;
			this.height = height;

			this._trajectory = new straight();
			this.trajectory.speed = 10;
			this.trajectory.angle = 0;
			
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
					_starfield[i][j] = [new Point(random.randomNumber(0, width), random.randomNumber(0, height)), random.randomNumber(minStarIntensity, maxStarItensity)];
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
		
		override public function doUpdate(timepassed:uint):void
		{
			var move:Point = this.trajectory.calcMove(this._pos, timepassed);
			for (var i:int = 0; i < countStarfield; i++)
			{
				for (var j:int = 0; j < starsPerField; j++)
				{
					_starfield[i][j][starPos].x += move.x * (i+1);
					_starfield[i][j][starPos].y += move.y * (i+1);
					
					
					if (_starfield[i][j][starPos].x < 0)
						_starfield[i][j][starPos].x += this.width;
					else if (_starfield[i][j][starPos].x > this.width)
						_starfield[i][j][starPos].x -= this.width;
						
						
					if (_starfield[i][j][starPos].y < 0)
						_starfield[i][j][starPos].y += this.height;
					else if (_starfield[i][j][starPos].y > this.height)
						_starfield[i][j][starPos].y -= this.height;
				}
			}
		}
		
		override public function doRender(s:BitmapData, x:Number, y:Number):void
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
					s.setPixel(_starfield[i][j][starPos].x, _starfield[i][j][starPos].y, colour);
				}
			}
			return;
		}
	
	}

}