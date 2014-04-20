package kureli.art {
	import flash.events.Event;
	/**
	 * ...
	 * @author George
	 */
	public class Level extends Asset {
		private var _hero:Hero;
		
		override protected function init(e:Event):void {
			super.init(e);
		}
		
		override protected function findChildren():void {
			super.findChildren();
			
			for each(var asset:Asset in assets)
				if (asset is Hero)
					_hero = asset as Hero;
		}
		
		override public function update():void {
			super.update();
			
			//--- SCROLLING
			x = -_hero.x + stage.stageWidth / 2;
			y = -_hero.y + stage.stageHeight / 2;
		}
	}
}