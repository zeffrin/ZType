package engine 
{
	/**
	 * Should encapsulate all other input classes and integrate input controls
	 * doUpdate() should mark the array with the time keys were pressed mouse was clicked etc
	 * @author Ben Stephens
	 */

	import engine.constKeys;
	import engine.constControls;
	 
	 public class inputControls
	{
		
		private var _keyMap:Array;
		
		public function inputControls():void
		{
			// Create a keymap and for now load in some defaults
			_keyMap = new Array(constControls.Length);
			_keyMap[constControls.BTN_FIRE] = constKeys.KEY_o;
			_keyMap[constControls.BTN_BOMB] = constKeys.KEY_p;
			_keyMap[constControls.BTN_UP] = constKeys.KEY_w;
			_keyMap[constControls.BTN_LEFT] = constKeys.KEY_a;
			_keyMap[constControls.BTN_DOWN] = constKeys.KEY_s;
			_keyMap[constControls.BTN_RIGHT] = constKeys.KEY_d;
			_keyMap[constControls.BTN_PAUSE] = constKeys.KEY_PAUSE;
			_keyMap[constControls.BTN_MENU] = constKeys.KEY_F10;
		}
		
		public function getControl(control:int):int
		{
			return _keyMap[control];
		}
	}

}