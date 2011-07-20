package engine
{
	import flash.display.ShaderPrecision;
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.text.TextField;
	
	import engine.gameInit;
	import engine.gameInput;
	import engine.gameLoop;
	import engine.gameRender;
	import engine.gameCleanup;
	import engine.constGameStates;
	import engine.uiBgStarfield;
	import engine.dataAssets;
	
	/**
	 * GameEngine provides top level for all other game related
	 * classes.
	 * 
	 * Is responsible for the stage given it at construction
	 * 
	 * @author Ben Stephens
	 */
	public class GameEngine
	{
	
		/* Internal variables */
		

		
		internal var _stage:Stage;							// _stage this game engine renders to
		internal var _running:Boolean;						// Whether the gameloop is running
		internal var _paused:Boolean;						// Whether the gameloop is paused
		internal var _gamestate:int;						// The state the gameloop is running in
		
		internal var _inputkb:inputKeyboard;				// Our keyboard input module
		internal var _background:uiBgStarfield;				// Our background module
		internal var _controls:inputControls;				// Later this should be a variable in the player object
		internal var _assets:dataAssets;					// Holds sprites and sound samples
		internal var _gametime:gameTime;					// Game time object
		
		internal var _buffer:int;
		internal var _buffers:Array;
		internal var _screen:Bitmap;
		
		internal var _mainmenu:uiMenu;						// menu object

		internal var stmp:int;
		internal var tmp:TextField;
		
		
		/* Constructor */
		
		public function GameEngine(stage:Stage):void
		{
			_stage = stage;
			_running = false;
			_paused = false;
			_inputkb = null;
			_background = null;
			_controls = null;
			_assets = null;
			_buffer = 0;
			_buffers = null;
			_screen = null;
			_gametime = null;
			
			_mainmenu = null;
			
			stmp = 0;
			tmp = null;
			
			_gamestate = constGameStates.GS_INIT;
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
			_gametime.doUpdate();
			gameInput.doUpdate(this);
			gameLoop.doUpdate(this);
			gameRender.doRender(this);
		}
	}

}