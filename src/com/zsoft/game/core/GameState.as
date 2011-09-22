package com.zsoft.game.core 
{
	import com.zsoft.game.lib.ui.Bg;
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
		
		private var _clickables:Array;
		private var _entities:Array;
		private var _background:Bg;
		
		public function GameState():void
		{
			_clickables = new Array();
			_entities = new Array();
		}
		
		public function get clickables():Array { return _clickables; }
		public function set clickables(val:Array):void { _clickables = val; }
		
		public function get entities():Array { return _entities; }
		public function set entities(val:Array):void { _entities = val; }
		
		public function get background():Bg { return _background; }
		public function set background(val:Bg):void { _background = val; }
		
	}

}