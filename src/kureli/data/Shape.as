package kureli.data {
	import flash.geom.Point;
	/**
	 * ...
	 * @author George
	 */
	public class Shape {
		
		public var mass:Number;
		private var _density:Number;
		public var offset:Point;
		
		public function Shape() {
			
			offset = new Point();
			density = 1;
			mass = density;
		}
		
		protected function calcMass():void {
			mass = density;
		}
		
		public function overlaps(shape:Shape, distance:Point):Boolean { return false; }
		
		public function get density():Number { return _density; }
		public function set density(value:Number):void {
			
			_density = value;
			calcMass();
		}
	}
}