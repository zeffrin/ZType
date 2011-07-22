package com.zsoft.game.core 
{
	import flash.events.Event;
	
	import com.zsoft.game.core.Game;
	/**
	 * Do everything from Init here but basically in reverse
	 * 
	 * Though flash has garbage collection it's good practice
	 * to explicitly give the memory back to the system before
	 * we end
	 * 
	 * @author Ben Stephens
	 */
	internal class gameCleanup 
	{
		public static function doCleanup(game:Game):void
		{
			with (game)
			{
				if (!_running)
				{
					return;
				}

				//_stage.displayState = StageDisplayState.NORMAL;
				_stage.frameRate = 30;
				_inputkb.doCleanup();
				_inputkb = null;
				_bgmanager.doCleanup();
				_bgmanager = null;
				_buffer = 0;
				_buffers = null;
				_gamestate = GameState.GS_SCORE;
				_stage.removeEventListener(Event.ENTER_FRAME, game.loopEvent);
				_running = false;
			}
		}
		
	}

}