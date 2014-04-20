package kureli{
	import flash.display.Sprite;
	import flash.events.Event;
	import kureli.art.Level;
	import kureli.art.Level1;
	
	/**
	 * ...
	 * @author George
	 */
	
	[SWF(width = "550", height = "400", backgroundColor = "#FFFFFF", frameRate = "30")]
	public class Main extends Sprite {
		
		private var _level:Level1;
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			addChild(_level = new Level1());
			
			_level.update()
			
			addEventListener(Event.ENTER_FRAME, enterFrame);
		}
		
		/**
		 * Updates this and all of it's children
		 * @param	e	The event passed n from the event dispatcher
		 */
		private function enterFrame(e:Event):void {
			_level.update();
		}
	}
}