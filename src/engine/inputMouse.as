
package engine
{
	/**
	 * Encapsulates functions related to mouse input
	 * @author Ben Stephens
	 */

	
	import flash.display.Stage;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.MouseEvent;
	
	public class inputMouse
	{

		private var _inputStack:Array;
		
		/* Class variables */
		private var _stage:Stage;									// The stage we're connected to
		//private var _keyArray:Array = new Array();					// An array to store the state of keys
		
		public function getStack():Array
		{
			// returns variables on the stack and removes the reference to it
			var arr:Array = _inputStack;
			_inputStack = new Array();
			return arr;
		}

		/* Constructor */
		public function inputMouse(stage:Stage):void
		{
			_stage = stage;											// record the stage we're getting input from
			_inputStack = new Array();
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
			_inputStack = null;
			_stage = null;
		}
		
		// Check if last command was a mousedown
		public function isMouseDown():Boolean
		{
			return _inputStack[_inputStack.length - 1];
		}
		
		// When a key is down the related array member will be true
		private function mousedown(e:MouseEvent):void
		{
			e.stageX
		}
		
		// Set back to false when the key is lifted
		private function mouseup(e:MouseEvent):void
		{
			//_keyArray[e.keyCode][1] = false;
		}
		
		private function mousemove(e:MouseEvent):void {
			
		}
		

	}

}