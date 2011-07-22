package com.zsoft.game.core.data 
{
	/**
	 * ...
	 * @author Ben Stephens
	 */
	
	 import com.zsoft.game.lib.object.entity;
	 import flash.display.Bitmap;
	 import flash.display.BitmapData;
	 import flash.display.Loader;
	 import flash.events.Event;
	 import flash.net.URLRequest;
	 import flash.utils.Dictionary;
	 
	public class load 
	{
		private var _loaders:Dictionary;
		private var _queue:int;
	
		public function load() 
		{
			_loaders = new Dictionary(false);
			_queue = 0;
		}
		
		// adds to download queue and returns length of queue
		public function loadImage(url:String, img:entity):int
		{
			var l:Loader = new Loader();
			l.contentLoaderInfo.addEventListener(Event.COMPLETE, imageComplete);
			l.load(new URLRequest(url));
			_loaders[l] = img;
			_queue++;
			return _queue;
		}
		
		private function imageComplete(ev:Event):void
		{
			var i:entity = _loaders[ev.target.loader];
			i.bitmapData = ev.target.content.bitmapData;
			delete _loaders[ev.target];
			_queue--
		}
		
		public function get queueLength():int { return _queue; }
		
	}

}