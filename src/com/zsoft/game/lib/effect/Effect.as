package com.zsoft.game.lib.effect 
{
	import com.zsoft.game.lib.object.entityAnimated;
	/**
	 * ...
	 * @author ...
	 */
	public class Effect extends entityAnimated
	{
		public function Effect()
		{
		}
	
		public function doEffect(pos:Point, timepassed:uint):Point
		{
			throw Error("Invalid use of Type 'Effect'");
		}
	}

}
