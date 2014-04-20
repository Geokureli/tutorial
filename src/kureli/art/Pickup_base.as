package kureli.art {
	import kureli.data.Circle;
	import kureli.data.Shape;
	/**
	 * ...
	 * @author George
	 */
	public class Pickup_base extends Asset {
		
		private function createDefaultShape():Shape { return Circle.fromBounds(this); }
		
		public function collect():void {
			// play sound;
			
			visible = false;
		}
		
		override public function reset():void {
			super.reset();
			
			visible = true;
		}
	}
}