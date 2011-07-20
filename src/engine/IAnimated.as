package engine 
{
	
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public interface IAnimated 
	{
		function get animFrames():int;
		function set animFrames(val:int):void;
		
		function get animDelay():int;
		function set animDelay(val:int):void;
		
		function get animCurrentFrame():int;
		function set animCurrentFrame(val:int):void;
		
		function get animTileWidth():int;
		function set animTileHeight(val:int):void;
		
		function get animTileRows():int;
		function get animTileColumns(val:int):void;
		
		function doUpdate(time:uint);
		
	}
	
}