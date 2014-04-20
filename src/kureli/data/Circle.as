package kureli.data {
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author George
	 */
	public class Circle extends Shape {
		
		private var _radius:Number;
		private var _radiusSquared:Number;
		
		public function Circle(radius:Number) {
			super();
			
			this.radius = radius;
		}
		
		override protected function calcMass():void {
			mass = radiusSquared * Math.PI * density;
		}
		
		/**
		 * Finds whether the target shape is overlapping this shape. Usually called from Prop.as
		 * @param	shape		The shape to check
		 * @param	distance	the relative posiion of the target shape's Prop
		 * @return	True, if the shape is overlapping
		 */
		override public function overlaps(shape:Shape, distance:Point):Boolean {
			
			// --- FIND OUT WHAT WE'RE HITTING AND HANDLE IT SPECIALLY
			if (shape is Circle)
				return overlapsCircle(shape as Circle, distance);
			
			if (shape is Box)
				return overlapsBox(shape as Box, distance);
			
			return false;
		}
		
		private function overlapsCircle(circle:Circle, distance:Point):Boolean {
			
			// formula: sqrt(x^2 + y^2) <= r1 + r2
			// instead of square rooting the distance, we square the radius sum, to save on calculations
			var radSumSquared:Number = (radius + circle.radius) * (radius + circle.radius);
			var distanceSquaredSum:Number = distance.x * distance.x + distance.y * distance.y;
			
			return distanceSquaredSum <= radSumSquared;
		}
		
		private function overlapsBox(box:Box, distance:Point):Boolean {
			// --- NOT IMPLEMENTED YET
			return false;
		}
		
		public function get radius():Number { return _radius; }
		public function set radius(value:Number):void {
			
			_radius = value;
			_radiusSquared = radius * radius;
			calcMass();
		}
		
		public function get radiusSquared():Number { return _radiusSquared; }
		
		static public function fromBounds(target:DisplayObject):Circle {
			
			var rect:Rectangle = target.getBounds(target);
			
			var shape:Circle = new Circle(rect.width > rect.height ? rect.width : rect.height);
			shape.offset.x = rect.x + rect.width / 2;
			shape.offset.y = rect.y + rect.height / 2;
			
			return shape;
		}
	}
}