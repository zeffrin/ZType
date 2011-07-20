package engine 
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.geom.Point;
	import flash.events.Event;
	import flash.sampler.Sample;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.net.URLRequest;

	/**
	 * Manages graphics assets
	 * 
	 * Ensuring we only load each asset from disk once ensures we don't experience performance troubles
	 * 
	 * 	For loading art assets.  For best results do all the loading
	 *	before the game starts.
	 *  eg:
		 * 
		 * function loadstuff():void
		 * {
		 * 	 addEventListener(constGameEvents.DloadQueueComplete, loadFinished);
		 * 
		 *   loadSprite("bla");
		 *   loadSprite("player.png");
		 *   loadSprite("enemy.png");
		 *   loadSample("fire.mp3");
		 *   loadSample("plraccel.mp3");
		 *   loadSample("plrslow.mp3");
		 *   loadSample("plrdie.mp3");
		 * }
		 * 
		 * function loadFinished(e:GameEvent):void
		 * {
		 *   removeEventListener(constGameEvents.DloadQueueComplete, loadFinished);
		 * 	 // kick off rest of game IE
		 *   game._gamestate = constGameStates.GS_GAME;
		 * }
		 * 
		 *
		 * 
	 *  
	 * 
	 * @author Ben Stephens
	 */
	internal class dataAssets
	{
		
		private var _assets:Array;				// 2D Array holds asset filenames, type and index in relevent array
		private var _sprites:Array;				// Array of BitmapData objects for our sprites
		private var _sounds:Array;				// Array of short mp3s to be used as sound effects
		private var _music:Array;				// Array of longer mp3s for music - These are seperate because music will
		private var _dloadqueue:Array;      	// have different volume control and not experience environmental audio effects
		private var _dloadinprogress:Array;		// For example if we had time slow down in the game we can easily adjust the 
		private var _dloading:Boolean			// need a bool since we fix the size on dloadinprogress
		// effect channels without touching music
		
		public function dataAssets() 
		{
			_assets = new Array();
			_sprites = new Array();
			_sounds = new Array();
			_music = new Array();
			_dloadqueue = new Array();
			_dloading = false;
			_dloadinprogress = new Array(1);  // Will only ever be one in progress for now so we can give a size hint here yay
		}
		
		public function loadSprite(assetfile:String):int
		{
			// Checking to see if this is already in the assets list
			// will be here whether it's finished downloading or not
			// This cryptic looking thing is a closure, because we're
			// using an array in an array can't just use indexOf
			var i:int;
			var r:Boolean = _assets.some(function(element:int, index:int, array:Array):Boolean {
				if (element[0] == assetfile)
				{
					i = index;
					return true;
				}
				return false;
			});
			/* end of closure */
			// if we found a match, return its index
			if (r)
			{
				return i;
			}
			
			i = _assets.push([assetfile, constAssetTypes.SPRITE, 0]) - 1; //adjust to get index
			_dloadqueue.push([assetfile, constAssetTypes.SPRITE, i]);
			startDownloads();
			return i;
		}
		
		public function startDownloads():void
		{
			// If already downloading or there's nothing to be downloaded
			// just drop straight out
			if (_dloading || _dloadqueue.length < 1)
			{
				return;
			}
			
			var next:Array = _dloadqueue.shift();
			_dloadinprogress[0] = next;
			_dloading = true;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onDloadComplete);
			loader.load(new URLRequest(next[0]));
		}
		
		public function getDloadQueueLength():int
		{
			return _dloadqueue.length + (_dloading?1:0);
		}
		
		
		
		private function onDloadComplete (event:Event):void
		{
			var assetfile:String;
			var assettype:int;
			var index:int;
			var i:int;  // will be used to hold index when we add to new assetarray
			
			var tmp:Array = _dloadinprogress[0];
			assetfile = tmp[0];
			assettype = tmp[1];
			index = tmp[2];
			tmp = null;
			
			switch(assettype)
			{
				case constAssetTypes.SPRITE:
					trace(Bitmap(LoaderInfo(event.target).content).bitmapData.transparent);
					i = _sprites.push(Bitmap(LoaderInfo(event.target).content).bitmapData);
					break;
				default:
					throw new Error("Asset Type not implemented in onDloadComplete");
			}
			
			// put the index to the sprite back into the asset library
			_assets[index][2] = i - 1; // adjust to get the index
			
			// start another download if there's more in the queue
			_dloading = false;
			_dloadinprogress[0] = null;
			if (_dloadqueue.length > 0)
			{
				startDownloads();
			}
			
		}
		
		
		public function drawSprite(asset:int, buf:BitmapData, x:int, y:int):void
		{
			var sprite:int = _assets[asset][2];
			
			if (asset < 0 || asset > _assets.length)
			{
				throw new Error("Referenced invalid sprite index in drawSprite");
			}
			buf.copyPixels(_sprites[sprite], _sprites[sprite].rect, new Point(x, y));
		}
		
		public function loadSample():int
		{
			return -1;
		}
		
		public function loadMusic():int
		{
			return -1;
		}
	}
}
