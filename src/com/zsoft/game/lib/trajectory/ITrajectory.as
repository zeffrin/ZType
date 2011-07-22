package com.zsoft.game.lib.trajectory 
{
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public interface ITrajectory 
	{
		function calcMove(pos:Point, timepassed:uint):Point;
	}
	
}