package engine
{

	import engine.gameInput;
	import engine.gameRender;
	
	/**
	 * The gameloop, controls input/output, leaving the engine etc
	 * @author Ben Stephens
	 */
	internal class gameLoop
	{
		public static function doUpdate(game:GameEngine):void
		{
			with (game)
			{
				switch(_gamestate)
				{
					case constGameStates.GS_INIT:
						// Waiting for our initial assets (loaded in gameInit) to finish downloading						
						if (game._assets.getDloadQueueLength() == 0)
						{
							_gamestate = constGameStates.GS_MENU;
							game._mainmenu.activated = true;
						}
						break;
					case constGameStates.GS_MENU:
						game._mainmenu.doUpdate();
						// test if we've done something in the menu and should change game state
						break;
						
					case constGameStates.GS_GAME:
						throw new Error("not implemented");
						break;
						
					default:
						throw new Error("Game state not implemented in doLoop");
				}
			}
		}
		
	}

}