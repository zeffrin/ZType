package com.zsoft.game.lib.object 
{
	import com.zsoft.game.lib.trajectory.Trajectory;
	import flash.filters.DropShadowFilter;
	import flash.geom.Point;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import com.zsoft.game.core.gameTime;
	import flash.geom.Rectangle;
	import com.zsoft.game.core.data.opacitybuffer;
		/**
	 * // Base entity class
	 * 
	 * @author Ben Stephens
	 */
	public class entity 
	{

		protected var _pos:Point;
		private var _width:int;
		private var _height:int;
		protected var _visible:Boolean;
		protected var _bitmap:Bitmap;
		protected var _trajectory:Trajectory;
		protected var _drawpos:Point;
		protected var _clickrect:Rectangle;
		protected var _clickable:Boolean;
		protected var _clicked:Boolean;
		protected var _opacity:int;
		
		public function entity() 
		{
			_pos = new Point(0, 0);
			_drawpos = new Point(0, 0);
			_clickrect = new Rectangle(0, 0, 0, 0);
			_clickable = false;
			_visible = true;
			_width = 0;
			_height = 0;
			_bitmap = null;
			_trajectory = null;
			_clicked = false;
			_opacity = 0;
		}

		public function set x(val:Number):void { _pos.x = val; }
		public function get x():Number{ return _pos.x; }
		
		public function get y():Number{ return _pos.y; }
		public function set y(val:Number):void { _pos.y = val; }
		
		public function get position():Point { return _pos; }
		public function set position(val:Point):void { _pos = val; }
		
		public function get width():int{ return _width; }
		public function set width(val:int):void { _width = val; }
		
		public function get height():int{ return _height; }
		public function set height(val:int):void { _height = val; }

		public function get visible():Boolean { return _visible; }
		public function set visible(val:Boolean):void { _visible = val; }

		public function get opacity():int { return _opacity; }
		public function set opacity(val:int):void { _opacity = val;	}
		
		public function get bitmap():Bitmap { return _bitmap; }
		public function set bitmap(val:Bitmap):void { _bitmap = val; }
		
		public function get trajectory():Trajectory { return _trajectory; }
		public function set trajectory(val:Trajectory):void { _trajectory = val; }
		
		public function get clickrect():Rectangle { return _clickrect; }
		public function set clickrect(val:Rectangle):void { _clickrect = val; }
		
		public function get clickable():Boolean { return _clickable; }
		public function set clickable(val:Boolean):void
		{ 
			_clickable = val;
			// register with gamestate clickable
		}
		
		public function get clicked():Boolean { return _clicked; }
		public function set clicked(val:Boolean):void { _clicked = val; }
		
		public function doCleanup():void
		{
			_visible = false;
			_bitmap = null;
			_trajectory = null;
			return;
		}

		public function doUpdate(timepassed:uint):void
		{
			if (_trajectory)
			{
				_pos = _trajectory.calcMove(_pos, timepassed);
			}
			return;
		}
		
		public function doRender(buf:BitmapData, x:Number, y:Number):void
		{
			_drawpos.x = x + this.x;
			_drawpos.y = y + this.y;
			if (_bitmap.bitmapData)
			{
				buf.copyPixels(_bitmap.bitmapData, _bitmap.bitmapData.rect, _drawpos);
			}
			return;
		}
	}

}