
package engine
{
	/**
	 * Encapsulates functions related to keyboard input
	 * @author Ben Stephens
	 * 
	 * Instantiate with a stage to collect keyboard activity from
	 * eg var _kb = new InputKeyboard(stage);
	 * 
	 * Query the state of keys with isKeyDown(keycode)
	 * eg _kb.isKeyDown(InputKeyboard.KEY_ESC)
	 * 
	 * When finished with keyboard reclaim memory
	 * eg _kb.destInputKeyboard();
	 *    _kb = null;
	 * 
	 */
	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	public class inputMouse
	{

		/* Class variables */
		private var _stage:Stage;									// The stage we're connected to
		private var _keyArray:Array = new Array();					// An array to store the state of keys
		
		
		/* Constructor */
		public function inputMouse(stage:Stage):void
		{
			_stage = stage;											// record the stage we're getting input from
			
			// Clear the array, set all keys to unpressed state
			for (var i:int = 0; i < 222; i++)
			{
				//_keyArray.push([i,false]);
			}
			
			// Add event listeners to catch all mouse events
			_stage.removeEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, mouseup);
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, mousemove);
		}
		
		public function doCleanup():void
		{
			if (!_stage)
			{
				return;
			}
			// Deregister the listeners now we're packing up
			_stage.removeEventListener(MouseEvent.MOUSE_DOWN, mousedown);
			_stage.removeEventListener(MouseEvent.MOUSE_UP, mouseup);
			_stage.removeEventListener(MouseEvent.MOUSE_MOVE, mousemove);
			_keyArray = null;
			_stage = null;
		}
		
		// Function to provide class users to query a key's state
		public function isMouseDown():Boolean
		{
			//return _keyArray[X][1];
		}
		
		// When a key is down the related array member will be true
		private function mousedown(e:MouseEvent):void
		{
			//_keyArray[e.keyCode][1] = true;
		}
		
		// Set back to false when the key is lifted
		private function mouseup(e:MouseEvent):void
		{
			//_keyArray[e.keyCode][1] = false;
		}
		

	}

}