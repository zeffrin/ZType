package
{
	import flash.display.Sprite;
	import flash.events.Event;
	import com.zsoft.game.core.Game;
	import com.junkbyte.console.Cc;
	import flash.display.StageScaleMode;
	import flash.system.ApplicationDomain;
	import flash.display.StageDisplayState;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	 public class Main extends Sprite
	{
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point

			stage.scaleMode = StageScaleMode.SHOW_ALL;
			
			//stage.displayState=StageDisplayState.FULL_SCREEN
			
			var game:Game = new Game(stage);
			game.startGame();
			
			Cc.config.commandLineAllowed = true;
			Cc.config.alwaysOnTop = true;
			Cc.commandLine = true;
			Cc.config.style.backgroundAlpha = 0.6;
			Cc.startOnStage(stage, "`");
			
		}
		
	}
	
}