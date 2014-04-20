package kureli.art {
	import flash.geom.Point;
	import kureli.data.Box;
	import kureli.data.Shape;
	/**
	 * ...
	 * @author George
	 */
	public class Prop extends Asset {
		
		public var startPos:Point;
		public var velocity:Point;
		
		public var shape:Shape;
		
		override protected function setDefaultPoperties():void {
			super.setDefaultPoperties();
			
			shape = createDefaultShape();
			
			startPos = new Point(x, y);
			velocity = new Point();// 0, 0
		}
		
		/** For overriding. */
		private function createDefaultShape():Shape { return Box.fromBounds(this); }
		
		override public function reset():void {
			super.reset();
			
			x = startPos.x;
			y = startPos.y;
			
			velocity.x = 0;
			velocity.y = 0;
		}
		
		override public function destroy():void {
			super.destroy();
			
			startPos = null;
			velocity = null;
		}
		
		override public function update():void {
			
			move();
			
			super.update();
		}
		
		protected function move():void {
			
			x += velocity.x;
			y += velocity.y;
		}
	}
}