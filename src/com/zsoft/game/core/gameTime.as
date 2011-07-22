package com.zsoft.game.core 
{
	import flash.geom.Point;
	/**
	 * Maintains time related information and encapsulates timers
	 * Provide queue for callback functions to be run at a specified gametick
	 * 
	 * @author Ben Stephens
	 */
	
	public class gameTime 
	{
		private static var _lastupdate:uint = new Date().getTime();
		private static var _lastupdatediff:uint = 0;
		private static var _lastsample:int = _lastupdate;
		private static var _fps:int = 0;
		private static var _lastframetime:uint = 0;
		private static var _frames:int = 0;
		private static var _lastdiffinsec:Number = 0;
		
		public static function get lastUpdateDiff():int { return _lastupdatediff; }
		public static function get lastUpdateDiffInMin():int { return _lastdiffinsec; }
		
		public static function doUpdate():void
		{
			var i:uint = _lastupdate;
			_lastupdate = new Date().getTime();
			_lastupdatediff = _lastupdate - i;
			_lastdiffinsec = _lastupdatediff / 1000;
			
			_lastframetime = _lastupdate - _lastsample;
			if (_lastframetime > 1000)
			{
				_fps = _frames / ((_lastupdate - _lastsample)/1000);
				_lastsample = _lastupdate;
				_frames = 0;
			}
			else 
			{
				_frames++;
			}
			return;
		}
		
		public static function getFps():int
		{
			return _fps;
		}
		
		public static function getLastUpdate():uint
		{
			return _lastupdate;
		}
		
		public static function getDistance(speed:int):Number
		{
			return (_lastdiffinsec) * speed;
		}
		
	}

}