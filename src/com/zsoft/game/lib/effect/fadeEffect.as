package com.zsoft.game.lib.effect 
{
	import com.zsoft.game.lib.object.entity;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class fadeEffect extends Effect
	{
		private var _duration:int;
		private var _started:uint;
		protected var _current:int;
		private var _startopacity:int;
		private var _finalopacity:int;
		private var _owner:entity;
		
		public function fadeEffect(owner:entity)
		{
			_owner = owner;
			super();
		}
		
		public function get duration():int { return _duration; }
		public function set duration(val:int):void { _duration = val; }
	
		public function get startOpacity():int { return _startopacity; }
		public function set startOpacity(val:int):void { _startopacity = val; }
		

		public function doEffect(timepassed:uint)
		{
			var t = _duration / timepassed;
			var t1 = (_finalopacity - _startopacity) / t;
			_owner.opacity += t1;
		}
		
	}

}