package com.zsoft.game.core.input 
{
	/**
	 * Stores players configured controls
	 * 
	 * Provides consts to reference controls
	 * 
	 * 
	 * @author Ben Stephens
	 */
	
	import com.zsoft.game.core.input.Controls;
	 
	public class Controls 
	{
		/* Consts to represent the buttons our game will use */
		
		public static const BTN_FIRE:int = 0;
		public static const BTN_BOMB:int = 1;
		public static const BTN_LEFT:int = 2;
		public static const BTN_RIGHT:int = 3;
		public static const BTN_UP:int = 4;
		public static const BTN_DOWN:int = 5;
		public static const BTN_PAUSE:int = 6;
		public static const BTN_MENU:int = 7;
		public static const Length:int = 8;		// having Length here gives us a way to easily get
												// a count on these in the rest of the program
												// when we change them here
	}

}