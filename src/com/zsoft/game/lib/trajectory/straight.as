package com.zsoft.game.lib.trajectory 
{
	import com.zsoft.game.lib.object.entity;
	import com.zsoft.game.core.gameTime;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class straight extends Trajectory
	{
					
		private var _move:Point;
		
		public function straight()
		{
			super();
			_move = new Point(0, 0);
		}
		
		override public function calcMove(pos:Point, timepassed:uint):Point
		{
			var distance:Number = gameTime.getDistance(this.speed);
			_move.x = pos.x + distance * Math.cos(this.angle);
			_move.y = pos.y + distance * Math.sin(this.angle);
			return _move;
		}
		
	}

}