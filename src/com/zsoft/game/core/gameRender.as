package com.zsoft.game.core 
{
	import com.zsoft.game.core.gameTime;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * Render stuff
	 * 
	 * Should be something like:
		 * 
		 * Render background
		 * Render background doodads (graphic entities with no other function
		 * Render entities (the player, monsters, bullets, etc...  everything in the game world with function
		 * Render forground doodads (graphic entities in front of entities such as grass, smoke effects, etc
		 * Render UI (Interface stuff goes on top)
	 * 
	 * @author Ben Stephens
	 */
	internal class gameRender
	{
		public static function doRender(game:Game):void
		{
			var buf:BitmapData;
			with (game)
			{
				// point buf to the buffer which is currently not rendered
				_buffer = !_buffer;
				buf = _buffers[_buffer];
				buf.lock();
				
				switch(_gamestate)
				{
					case GameState.Init:
						break;
					case GameState.Menu:
						_mainmenu.doRender(buf, 0, 0);
						break;
					default:
						throw new Error("Invalid gamestate in doRender in gameRender");
						break;
				}
				
				// call other render routines in here
				// doodads, entities, fgdoodads and ui
				
				buf.unlock();
				
				// switch buffer to be used
				game._screen.bitmapData = buf;
				game.tmp.text = gameTime.getFps().toString();			
			}
		}
	
	}

}