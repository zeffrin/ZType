package com.zsoft.game.lib.trajectory 
{
	import com.zsoft.game.lib.proto.ITrajectory;
	import com.zsoft.game.lib.object.entity;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class Trajectory implements ITrajectory
	{

		private var _speed:Number;
		private var _angle:Number;
		private var _owner:entity;
		
		public function Trajectory()
		{
			_speed = 0;
			_angle = 0;
			_owner = null;
		}
		
		public function get owner():entity { return _owner; }
		
		public function get speed():int { return _speed; }
		public function set speed(val:int):void { _speed = val; }
		
		public function get angle():Number { return _angle; }
		public function set angle(val:Number):void { _angle = val; }
		
		public function calcMove(pos:Point, timepassed:uint):Point
		{
			throw Error("Invalid use of Type 'Trajectory'");
		}
	}

}