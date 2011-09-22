package com.zsoft.game.lib.object 
{
	import com.zsoft.game.lib.object.entity;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.geom.Point;
	import com.zsoft.game.core.data.opacitybuffer;
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
		
		private var _framerect:Rectangle;
		private var _countdown:int;
		
		public function entityAnimated() 
		{
			super();
			_frames = 0;
			_delay = 0;
			_currentframe = 0;
			_tilewidth = 0;
			_tileheight = 0;
			_tilerows = 0;
			_tilecolumns = 0;
			_countdown = 0;
			_framerect = new Rectangle(0, 0, 0, 0);
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
					
				_framerect.x = ((_tilewidth * _currentframe) % _tilecolumns) * _tilewidth;
				_framerect.y = ((_tileheight * _currentframe) % _tilerows) * _tileheight;
			}
			super.doUpdate(timepassed);
		}
		
		override public function doRender(buf:BitmapData, x:Number, y:Number):void
		{
			_drawpos.x = this.x + x;
			_drawpos.y = this.y + y;
			if (_bitmap.bitmapData)
			{
				buf.copyPixels(_bitmap.bitmapData, _framerect, _drawpos, opacitybuffer.instance.getOpacityBmp(_opacity), null, true);
			}
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
		public function set TileWidth(val:int):void { _tilewidth = val; _framerect.width = val; }
		public function get TileHeight():int { return _tileheight; }
		public function set TileHeight(val:int):void { _tileheight = val; _framerect.height = val; }
		public function get TileRows():int { return _tilerows; }
		public function set TileRows(val:int):void { _tilerows = val; }
		public function get TileColumns():int { return _tilecolumns; }
		public function set TileColumns(val:int):void { _tilecolumns = val; }

	}
}