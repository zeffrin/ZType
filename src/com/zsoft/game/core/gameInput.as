package com.zsoft.game.core 
{
	/**
	 * This class will maintain all info related to input and relate it to the game
	 * 
	 * @author Ben Stephens
	 */
	
	import com.zsoft.game.core.input.Keys;
	import com.zsoft.game.core.input.inputKeyboard;
	 
	internal class gameInput
	{
	
		public static function doUpdate(game:Game, timepassed:uint):void
		{
			switch(game._gamestate)
			{
				case GameState.Init:
					if (game._inputkb.isKeyDown(Keys.KEY_ESC))
					{
						game.endGame();
						return;
					}
				case GameState.Menu:
					if (game._inputkb.isKeyDown(Keys.KEY_RARROW))
					{
						game._mainmenu.x++;
					}
					break;
					
				default:
					throw new Error("game state not implemented in doUpdate in gameInput");
			}
		}
	
	}

}