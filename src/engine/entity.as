package engine 
{
	import flash.geom.Point;
	import engine.dataAssets;
	import flash.display.BitmapData;
		/**
	 * // Base entity class
	 * 
	 * @author Ben Stephens
	 */
	public class entity 
	{

		protected var _x:int;
		protected var _y:int;
		private var _width:int;
		private var _height:int;
		protected var _visible:Boolean;
		protected var _sprite:int;
		protected var _bitmapData:BitmapData;
		
		
		public function entity() 
		{
			_x = 0;
			_y = 0;
			_visible = false;
			_width = 0;
			_height = 0;
			_bitmapData = null;
		}

		public function set x(val:int):void { _x = val; }
		public function get x():int{ return _x; }
		
		public function get y():int{ return _y; }
		public function set y(val:int):void { _y = val; }
		
		public function get width():int{ return _width; }
		public function set width(val:int):void { _width = val; }
		
		public function get height():int{ return _height; }
		public function set height(val:int):void { _height = val; }
		
		public function get sprite():int { return _sprite; }
		public function set sprite(val:int):void { _sprite = val; }
		
		public function get visible():Boolean { return _visible; }
		public function set visible(val:Boolean):void { _visible = val; }
		
		public function get bitmapData():BitmapData { return _bitmapData; }
		public function set bitmapData(val:BitmapData):void { _bitmapData = val; }
		
		public function doCleanup():void
		{
			return;
		}

		public function doUpdate():void
		{
			return;
		}
		
		public function doRender(buf:BitmapData, x:int, y:int):void
		{
			
			return;
		}
	}

}