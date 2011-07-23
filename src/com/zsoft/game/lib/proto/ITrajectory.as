package com.zsoft.game.lib.proto 
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