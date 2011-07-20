package engine 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.Event;
	import engine.GameEngine;
	import flash.text.TextField;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	internal class gameInit
	{
		public static function doInit(game:GameEngine):void
		{
			var i:int;
			var bla:int;
			with(game)
			{
				if (_running)
				{
					return;
				}
				_running = true;
				_paused = false;
			
				_inputkb = new inputKeyboard(_stage);
				_controls = new inputControls();
				_assets = new dataAssets();
				
				_buffer = 0;
				_buffers = new Array(2)
				
				for (i = 0; i < 2; i++)
				{
					_buffers[i] = new BitmapData(_stage.stageWidth, _stage.stageHeight, false, 0x00000000);
				}
				_screen = new Bitmap(null, "auto", true);
				_stage.addChild(_screen); // place holder for the current buffer being output
				_background = new uiBgStarfield(_stage.stageWidth, _stage.stageHeight);
				_gametime = new gameTime();
				
				
				// load our initial assets (could do a loading screen here and use the Intro gamestate)
				// will have to add progress bar as a ui widget Im sure
				bla = _assets.loadSprite("heli.png");
				
				_mainmenu = new uiMenu(game);
				_mainmenu.background = _background;
				_mainmenu.addSprite(bla, 10, 10);
				
				tmp = new TextField();
				tmp.textColor = 0xFF1C2E;
				_stage.addChild(tmp);
				
				
			}
		}
	}
	

}