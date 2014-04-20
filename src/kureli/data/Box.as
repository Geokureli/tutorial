package kureli.data {
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author George
	 */
	public class Box extends Shape {
		private var _width:Number;
		private var _height:Number;
		
		public function Box(width:Number, height:Number) {
			super();
			
			_width = width;
			_height = height;
			
			calcMass();
		}
		
		override protected function calcMass():void {
			mass = _width * _height * density;
		}
		
		override public function overlaps(shape:Shape, distance:Point):Boolean {
			
			if (shape is Box)
				return overlapsBox(shape as Box, distance)
			
			if (shape is Circle)
				return overlapsCircle(shape as Circle, distance)
			
			return false;
		}
		
		private function overlapsBox(box:Box, distance:Point):Boolean {
			// --- NOT IMPLEMENTED YET
			return false;
		}
		
		private function overlapsCircle(circle:Circle, distance:Point):Boolean {
			// --- NOT IMPLEMENTED YET
			return false;
		}
		
		public function get width():Number { return _width; }
		public function set width(value:Number):void {
			
			_width = value;
			calcMass();
		}
		
		public function get height():Number { return _height; }
		public function set height(value:Number):void {
			
			_height = value;
			calcMass();
		}
		
		public function toRect():Rectangle {
			return new Rectangle(offset.x, offset.y, width, height);
		}
		
		static public function fromBounds(target:DisplayObject):Box {
			
			var rect:Rectangle = target.getBounds(target);
			
			var shape:Box = new Box(rect.width, rect.height);
			shape.offset.x = rect.x;
			shape.offset.y = rect.y;
			
			return shape;
		}
	}
}