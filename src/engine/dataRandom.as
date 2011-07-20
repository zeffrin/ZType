package engine 
{
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class dataRandom 
	{
		/** 
		* Generates a truly "random" number
		* @return Random Number
		* @author http://scriptplayground.com/tutorials/as/Generate-random-number-in-ActionScript-3/
		*/ 
		public static function randomNumber(low:Number=0, high:Number=1):Number
		{
			return Math.floor(Math.random() * (1+high-low)) + low;
		}
	}
}