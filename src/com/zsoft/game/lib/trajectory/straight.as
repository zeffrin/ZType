package com.zsoft.game.lib.trajectory 
{
	import com.zsoft.game.lib.object.entity;
	import com.zsoft.game.core.gameTime;
	import flash.geom.Point;
	import com.zsoft.game.lib.trajectory.ITrajectory;
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class straight extends Trajectory
	{
					
		public function straight()
		{
			super();
		}
		
		override public function calcMove(pos:Point, timepassed:uint):Point
		{
			var distance:Number = gameTime.getDistance(this.speed);
			var p:Point = new Point();
			p.x = pos.x + distance * Math.cos(this.angle);
			p.y = pos.y + distance * Math.sin(this.angle);
			return p;
		}
		
	}

}