package com.zsoft.game.core.data 
{
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class opacitybuffer 
	{
		
		protected var _opacitybuffer:Array;
		protected static var _instance:opacitybuffer;
		
		public static function get instance():opacitybuffer { if (_instance) return _instance; return _instance = new opacitybuffer(); }
		
		public function opacitybuffer() 
		{
				_instance = this;
				_opacitybuffer = new Array(256);
				for (var i:int = 0; i < 256; i++)
				{
					_opacitybuffer[i] = new BitmapData(128,52, true, i<<24);
				}
		}
		
		public function getOpacityBmp(opacity:int):BitmapData
		{
			return _opacitybuffer[opacity];
		}
		
	}

}