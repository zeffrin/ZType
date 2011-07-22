package com.zsoft.game.core.input 
{
	/**
	 * Should encapsulate all other input classes and integrate input controls
	 * doUpdate() should mark the array with the time keys were pressed mouse was clicked etc
	 * @author Ben Stephens
	 */

	import com.zsoft.game.core.input.Keys;
	import com.zsoft.game.core.input.Controls;
	 
	public class Input
	{
		
		private var _keyMap:Array;
		
		public function inputControls():void
		{
			// Create a keymap and for now load in some defaults
			_keyMap = new Array(Controls.Length);
			_keyMap[Controls.BTN_FIRE] = Keys.KEY_o;
			_keyMap[Controls.BTN_BOMB] = Keys.KEY_p;
			_keyMap[Controls.BTN_UP] = Keys.KEY_w;
			_keyMap[Controls.BTN_LEFT] = Keys.KEY_a;
			_keyMap[Controls.BTN_DOWN] = Keys.KEY_s;
			_keyMap[Controls.BTN_RIGHT] = Keys.KEY_d;
			_keyMap[Controls.BTN_PAUSE] = Keys.KEY_PAUSE;
			_keyMap[Controls.BTN_MENU] = Keys.KEY_F10;
		}
		
		public function getControl(control:int):int
		{
			return _keyMap[control];
		}
	}

}