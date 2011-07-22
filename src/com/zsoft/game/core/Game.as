package com.zsoft.game.core
{
	import com.zsoft.game.core.data.load;
	import com.zsoft.game.core.input.Controls;
	import com.zsoft.game.core.input.Input
	import com.zsoft.game.core.input.inputKeyboard;
	import com.zsoft.game.lib.ui.bg.starfield;
	import com.zsoft.game.lib.ui.Menu;
	
	import flash.display.ShaderPrecision;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	
	/**
	 * GameEngine provides top level for all other game related
	 * classes.
	 * 
	 * Is responsible for the stage given it at construction
	 * 
	 * @author Ben Stephens
	 */
	public class Game
	{
	
		internal var _stage:Stage;							// _stage this game engine renders to
		internal var _running:Boolean;						// Whether the gameloop is running
		internal var _paused:Boolean;						// Whether the gameloop is paused
		internal var _gamestate:int;						// The state the gameloop is running in
		
		internal var _inputkb:inputKeyboard;				// Our keyboard input module
		internal var _background:starfield;				// Our background module
		internal var _controls:Controls;					// Later this should be a variable in the player object
		internal var _loader:load;
		
		internal var _buffer:int;
		internal var _buffers:Array;
		internal var _screen:Bitmap;
		
		internal var _mainmenu:Menu;						// menu object

		internal var stmp:int;
		internal var tmp:TextField;
		
		
		/* Constructor */
		
		public function Game(stage:Stage):void
		{
			_stage = stage;
			_running = false;
			_paused = false;
			_inputkb = null;
			_background = null;
			_controls = null;
			_buffer = 0;
			_buffers = null;
			_screen = null;
			_mainmenu = null;
			
			stmp = 0;
			tmp = null;
			
			_gamestate = GameState.Init;
		}
		
		public function startGame():void
		{
			gameInit.doInit(this);
			_stage.addEventListener(Event.ENTER_FRAME, loopEvent);
		}
		
		public function endGame():void
		{
			gameCleanup.doCleanup(this);
		}
		
		public function loopEvent(e:Event):void
		{
			gameTime.doUpdate();
			gameInput.doUpdate(this, gameTime.lastUpdateDiff);
			gameLoop.doUpdate(this, gameTime.lastUpdateDiff);
			gameRender.doRender(this);
		}
	}

}