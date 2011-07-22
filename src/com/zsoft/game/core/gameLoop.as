package com.zsoft.game.core
{
	/**
	 * The gameloop, controls input/output, leaving the engine etc
	 * @author Ben Stephens
	 */
	internal class gameLoop
	{
		public static function doUpdate(game:Game, timepassed:uint):void
		{
			with (game)
			{
				switch(_gamestate)
				{
					case GameState.Init:
						// Waiting for our initial assets (loaded in gameInit) to finish downloading						
						if (game._loader.queueLength == 0)
						{
							_gamestate = GameState.Menu;
						}
						break;
					case GameState.Menu:
						game._mainmenu.doUpdate(timepassed);
						// test if we've done something in the menu and should change game state
						break;
						
					default:
						throw new Error("Game state not implemented in doLoop");
				}
			}
		}
		
	}

}