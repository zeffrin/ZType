package com.zsoft.game.core 
{
	import com.zsoft.game.core.data.opacitybuffer;
	import com.zsoft.game.lib.object.entity;
	import com.zsoft.game.lib.ui.Bg;
	import com.zsoft.game.lib.ui.bg.starfield;
	import com.zsoft.game.lib.ui.Button;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.text.TextField;
	import com.zsoft.game.core.input.inputKeyboard;
	import com.zsoft.game.core.input.Controls;
	import com.zsoft.game.core.data.load;
	import com.zsoft.game.lib.ui.Menu;
	import com.zsoft.game.lib.object.entityAnimated;
	import com.zsoft.game.lib.trajectory.straight;
	import com.zsoft.game.lib.misc.random;
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	internal class gameInit
	{
	
		public static function doInit(game:Game):void
		{
			var i:int;
			var bla:entity;
			with(game)
			{
				if (_running)
				{
					return;
				}
				_running = true;
				_paused = false;
			
				_inputkb = new inputKeyboard(_stage);
				_controls = new Controls();
				_loader = new load();
			
				_buffer = 0;
				_buffers = new Array(2)
				
				for (i = 0; i < 2; i++)
				{
					_buffers[i] = new BitmapData(_stage.stageWidth, _stage.stageHeight, false, 0x00000000);
				}
				
				_screen = new Bitmap(null, "auto", true);
				_stage.addChild(_screen); // place holder for the current buffer being output
				_gametime = new gameTime();

				_opacitybuffer = new opacitybuffer();
				
				/* stuff which will move out of core below */
				
				
				_background = new starfield(_stage.stageWidth, _stage.stageHeight);
				_background.trajectory.speed = 55;  // pixels per second
				_background.trajectory.angle = 90;
				_mainmenu = new Menu(game);
				_mainmenu.background = _background;
				
				heli = _loader.loadImage("heli.png");
				
			 game.gamestate = new GameState();
				var test:Array = new Array(3000);
				for (var k:int = 0; k < 3000; k++)
				{ 
					test[k] = new entityAnimated();
					test[k].Delay = 70;
					test[k].Frames = 5;
					test[k].CurrentFrame = k % 5;
					test[k].TileHeight = 52;
					test[k].bitmap = heli;
					test[k].TileWidth = 128;
					test[k].TileRows = 1;
					test[k].TileColumns = 5;
					test[k].x = 300;
					test[k].opacity = random.randomNumber(0, 200);
					test[k].y = 300;
					test[k].trajectory = new straight();
					test[k].trajectory.speed = random.randomNumber(2, 100);
					test[k].trajectory.angle = random.randomNumber(0, 2 * Math.PI);
					_mainmenu.addChild (test[k]);
				}
			
				
				game.gamestate.background = _background;
				
				
				// load our initial assets (could do a loading screen here and use the Intro gamestate)
				// will have to add progress bar as a ui widget Im sure
			
				tmp = new TextField();
				tmp.textColor = 0xFF1C2E;
				_stage.addChild(tmp);
				
				
			}
		}
	}


}