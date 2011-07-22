package com.zsoft.game.lib.object 
{
	import com.zsoft.game.lib.object.entity;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class entityAnimated extends entity
	{
		
		private var _frames:int;
		private var _delay:int;
		private var _currentframe:int;
		private var _tilewidth:int;
		private var _tileheight:int;
		private var _tilerows:int;
		private var _tilecolumns:int;
		
		private var _countdown:int;
		
		public function entityAnimated() 
		{
			_frames = 0;
			_delay = 0;
			_currentframe = 0;
			_tilewidth = 0;
			_tileheight = 0;
			_tilerows = 0;
			_tilecolumns = 0;
			_countdown = 0;
		}
		
		/* INTERFACE engine.IAnimated */
		
		override public function doUpdate(timepassed:uint):void
		{
			_countdown -= timepassed;
			if (_countdown < 1)
			{
				_countdown = _delay;
				_currentframe++;
				if (_currentframe >= _frames)
					_currentframe = 0;
			}
			super.doUpdate(timepassed);
		}
		
		override public function doRender(buf:BitmapData, x:Number, y:Number):void
		{
			var rect:Rectangle = new Rectangle( ((_tilewidth * _currentframe) %_tilecolumns)*_tilewidth, ((_tileheight * _currentframe) % _tilerows)*_tileheight, _tilewidth, _tileheight);
			if(_bitmapData)
				buf.copyPixels(_bitmapData, rect, new Point(this.x + x, this.y + y));
			return;
		}
		
		public function get Frames():int 
		{
			return _frames;
		}
		
		public function set Frames(value:int):void 
		{
			_frames = value;
		}
		
		public function get Delay():int 
		{
			return _delay;
		}
		
		public function set Delay(value:int):void 
		{
			_delay = value;
		}
		
		public function get CurrentFrame():int 
		{
			return _currentframe;
		}
		
		public function set CurrentFrame(value:int):void 
		{
			_currentframe = value;
		}
		
		public function get TileWidth():int { return _tilewidth; }
		public function set TileWidth(val:int):void { _tilewidth = val; }
		public function get TileHeight():int { return _tileheight; }
		public function set TileHeight(value:int):void { _tileheight = value; }
		public function get TileRows():int { return _tilerows; }
		public function set TileRows(val:int):void { _tilerows = val; }
		public function get TileColumns():int { return _tilecolumns; }
		public function set TileColumns(val:int):void { _tilecolumns = val; }

	}
}