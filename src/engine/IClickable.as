package engine 
{
	
	/**
	 * Interface clickable entities must implement
	 * 
	 * gameInput handles figuring out which entities have been interacted with
	 * but entities which wish to be interactive need to register with gameInput
	 * 
	 * @author Ben Stephens
	 */
	public interface IClickable 
	{
		
		/* onClick takes the time at which the click was performed and returns
		 * whether or not the event is considered handled or whether gameInput
		 * should try other assets
		 */
		function doClick(time:uint):Boolean;
		function get onClick():Function;
		function set onClick(val:Function):void;
	}
	
}