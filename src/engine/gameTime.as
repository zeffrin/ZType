package engine 
{
	/**
	 * Maintains time related information and encapsulates timers
	 * Provide queue for callback functions to be run at a specified gametick
	 * 
	 * @author Ben Stephens
	 */
	
	public class gameTime 
	{
		private var _lastupdate:uint;
		private var _fps:int;
		private var _lastframetime:uint;
		
		private var _frames:int;
		private var _lastsample:int;
		
		
		public function gameTime():void
		{
			_lastupdate = new Date().getTime();
			_lastsample = _lastupdate;
			_fps = 0;
			_frames = 0;
			_lastframetime = 0;
		}
		
		public function get lastFrameTime():int
		{
			return _lastframetime;
		}
		
		public function doUpdate():void
		{
			var i:uint = _lastupdate;
			_lastupdate = new Date().getTime();
			
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
		
		public function getFps():int
		{
			return _fps;
		}
		
		public function getLastUpdate():uint
		{
			return _lastupdate;
		}
		
		
	}

}