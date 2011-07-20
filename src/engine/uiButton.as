package engine 
{
	/**
	 * Button widget for providing a clickable area on the screen with
	 * a callback
	 * @author Ben Stephens
	 */
	public class uiButton extends entity implements IClickable
	{
		public function uiButton(callback:Function) 
		{
			_onclick = callback;
			_enabled = false;
		}
	
		/* Implementation for IClickable */
		private var _onclick:Function;
		private var _enabled:Boolean;
		public function get onClick():Function { return _onclick; }
		public function set onClick(val:Function):void { _onclick = val; }
		public function doClick(time:uint):Boolean { return _onclick(time); }
		public function get enabled():Boolean { return _enabled; }
		public function set enabled(val:Boolean):void { _enabled = val; }

		
	}

}