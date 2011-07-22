package com.zsoft.game.lib.ui 
{
	import com.zsoft.game.core.Game;
	import com.zsoft.game.lib.object.entity;
	import com.zsoft.game.lib.ui.Bg;
	import com.zsoft.game.lib.ui.Button;
	import flash.display.BitmapData;
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class Menu extends entity
	{
		private var _ents:Array;		// sprites will be just basic entities
		private var _game:Game;
		private var _background:Bg;
	
		public function Menu(game:Game):void
		{
			_ents = new Array();
			_background = null;
			_game = game;
		}
		
		public function get background():Bg { return _background; }
		public function set background(val:Bg):void { _background = val; }
		
		override public function doUpdate(timepassed:uint):void
		{
			if(_background)	_background.doUpdate(timepassed);
			
			var i:int;
			for (i = 0; i < _ents.length; i++)
				_ents[i].doUpdate(timepassed);
		}
		
		override public function doRender(buf:BitmapData, x:Number, y:Number ):void
		{
			if(_background)	_background.doRender(buf, x, y);
			
			// Draw any sprites and then buttons
			var i:int = 0;
			for (i = 0; i < _ents.length; i++)
			{
				if (_ents[i].visible)
					_ents[i].doRender(buf, x + this.x, y + this.y);
			}
			return;
			
		}			

		// pass in a sprite id, returns entity id
		public function addChild(e:entity):void
		{
			_ents.push(e);
		}
	}

}