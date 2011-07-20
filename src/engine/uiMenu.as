package engine 
{
	import flash.display.BitmapData;
	import engine.constBackgrounds;
	import engine.entity;
	
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class uiMenu extends entity
	{
		private var _sprites:Array;		// sprites will be just basic entities
		private var _buttons:Array;		// buttons will be a child class from entity
		private var _game:GameEngine;
		private var _background:uiBg;
		private var _activated:Boolean;
	
		public function uiMenu(game:GameEngine):void
		{
			_sprites = new Array();
			_buttons = new Array();
			_background = null;
			_game = game;
			_activated = false;
		}
	
		public function get activated():Boolean { return _activated; }
		public function set activated(val:Boolean):void
		{
			if (val)
				_activated = true;
			else
				_activated = false;
		}
		
		public function get background():uiBg { return _background; }
		public function set background(val:uiBg):void { _background = val; }
		
		override public function doUpdate():void
		{
			if(_background)	_background.doUpdate();
			
			var i:int;
			for (i = 0; i < _sprites.length; i++)
				_sprites[i].doUpdate();
			for (i = 0; i < _buttons.length; i++)
				_buttons[i].doUpdate();
		}
		
		override public function doRender(buf:BitmapData, x:int, y:int ):void
		{
			if (!_activated)
			{
				throw new Error("Calling doRender on deactivated menu");
			}
			// Draw any sprites and then buttons
			var i:int = 0;
			for (i = 0; i < _sprites.length; i++)
			{
				if (_sprites[i].visible)
				{
					// ask the asset manager to draw the sprites if they're visible, offset by menu position
					_game._assets.drawSprite(_sprites[i].sprite, buf, _sprites[i].x + this.x, _sprites[i].y + this.y);
				}
			}
			for (i = 0; i < _buttons.length; i++)
			{
				if (_buttons[i].visible)
				{
					_game._assets.drawSprite(_buttons[i].sprite, buf, _buttons[i].x + this.x, _buttons[i].y + this.y);
				}
			}
			return;
			
		}			

		// pass in a sprite id, returns entity id
		public function addSprite(asset:int, x:int, y:int):void
		{
			var e:entity = new entity();;
			
			e.sprite = asset;
			e.x = x;
			e.y = y;
			e.visible = true;
			_sprites.push(e);
		}
		
		public function addButton(asset:int, x:int, y:int, callback:Function):void
		{
			var e:uiButton = new uiButton(callback);
			e.sprite = asset;
			e.x = x;
			e.y = y;
			e.visible = true;
			_buttons.push(e);
		}
		
	}

}