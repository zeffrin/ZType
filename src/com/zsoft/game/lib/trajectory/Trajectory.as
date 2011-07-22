package com.zsoft.game.lib.trajectory 
{
	import com.zsoft.game.lib.object.entity;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class Trajectory implements ITrajectory
	{

		private var _speed:int;
		private var _angle:int;
		private var _owner:entity;
		
		public function Trajectory()
		{
			_speed = 0;
			_angle = 0;
			_owner = owner;
		}
		
		public function get owner():entity { return _owner; }
		
		public function get speed():int { return _speed; }
		public function set speed(val:int):void { _speed = val; }
		
		public function get angle():int { return _angle; }
		public function set angle(val:int):void { _angle = val; }
		
		public function calcMove(pos:Point, timepassed:uint):Point
		{
			throw Error("Invalid use of Type 'Trajectory'");
		}
	}

}