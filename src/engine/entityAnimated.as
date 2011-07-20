package engine 
{
	import engine.entity;
	import flash.display.BitmapData;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class entityAnimated extends entity implements IAnimated 
	{
		
		var _animFrames:int;
		var _animDelay:int;
		var _animCurrentFrame:int;
		var _animTileWidth:int;
		var _animTileHeight:int;
		var _animTileRows:int;
		var _animTileColumns:int;
		
		var _countdown:int;
		
		public function entityAnimated() 
		{
			_animFrames = 0;
			_animDelay = 0;
			_animCurrentFrame = 0;
			_animTileWidth = 0;
			_animTileHeight = 0;
			_animTileRows = 0;
			_animTileColumns = 0;
			_countdown = 0;
		}
		
		/* INTERFACE engine.IAnimated */
		
		override public function doUpdate()
		{
			_countdown--;
			if (_countdown < 1)
			{
				_countdown = _animDelay;
				_animCurrentFrame++;
				if (_animCurrentFrame > _animFrames)
					_animCurrentFrame = 0;
			}
			super.doUpdate();
		}
		
		override public function doRender(buf:BitmapData, x:int, y:int):void
		{
			
		}
		
		public function get animFrames():int 
		{
			return _animFrames;
		}
		
		public function set animFrames(value:int):void 
		{
			_animFrames = value;
		}
		
		public function get animDelay():int 
		{
			_countdown = _animDelay;
			return _animDelay;
		}
		
		public function set animDelay(value:int):void 
		{
			_animDelay = value;
		}
		
		public function get animCurrentFrame():int 
		{
			return _animCurrentFrame;
		}
		
		public function set animCurrentFrame(value:int):void 
		{
			_animCurrentFrame = value;
		}
		
		public function get animTileWidth():int 
		{
			return _animTileWidth;
		}
		
		public function set animTileHeight(value:int):void 
		{
			_animTileHeight = value;
		}
		
		public function get animTileRows():int 
		{
			return _animTileRows;
		}
		
		public function get animTileColumns():void 
		{
			return _animTileColumns;
		}
	}

}