package com.zsoft.game.core 
{
	/**
	 * ...
	 * @author Ben Stephens
	 */
	public class GameState
	{
		
		public static const Init:int = 0;				// Game State consts (what kind of language
		public static const Intro:int = 1;				// doesn't have enums pfft
		public static const Menu:int = 2;
		public static const Running:int = 4;
		public static const Credits:int = 8;
		public static const Score:int = 16;
	}

}