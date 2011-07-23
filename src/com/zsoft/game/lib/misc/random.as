package com.zsoft.game.lib.misc
{
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class random 
	{
		/** 
		* Generates a truly "random" number
		* @return Random Number
		* @author http://scriptplayground.com/tutorials/as/Generate-random-number-in-ActionScript-3/
		*/ 
		public static function randomNumber(low:Number=0, high:Number=1):Number
		{
			return Math.random() * ((high-low) + low);
		}
	}
}