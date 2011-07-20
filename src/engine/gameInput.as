package engine 
{
	/**
	 * This class will maintain all info related to input and relate it to the game
	 * 

	 * 
	 
	 * 
	 * 
	 * @author Ben Stephens
	 */
	internal class gameInput 
	{
	
		public static function doUpdate(game:GameEngine):void
		{
			switch(game._gamestate)
			{
				case constGameStates.GS_INIT:
					if (game._inputkb.isKeyDown(constKeys.KEY_ESC))
					{
						game.endGame();
						return;
					}
				case constGameStates.GS_MENU:
					if (game._inputkb.isKeyDown(constKeys.KEY_RARROW))
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