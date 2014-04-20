package kureli.art {
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Keyboard;
	import kureli.data.Circle;
	import kureli.data.Shape;
	/**
	 * ...
	 * @author George
	 */
	public class Hero_base extends Prop {
		
		static public const SPEED:int = 5;
		
		public var up:Boolean;
		public var down:Boolean;
		public var left:Boolean;
		public var right:Boolean;
		
		private function createDefaultShape():Shape { return Circle.fromBounds(this); }
		
		override protected function init(e:Event):void {
			super.init(e);
			
			// --- SET KEYBOARD LISTENERS
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyHandler);
			stage.addEventListener(KeyboardEvent.KEY_UP, keyHandler);
		}
		
		private function keyHandler(e:KeyboardEvent):void {
			
			switch(e.keyCode) {
				
				case Keyboard.UP:
				case Keyboard.W:
					
					up = e.type == KeyboardEvent.KEY_DOWN;
				break;
				
				case Keyboard.DOWN:
				case Keyboard.S:
					
					down = e.type == KeyboardEvent.KEY_DOWN;
				break;
				
				case Keyboard.LEFT:
				case Keyboard.A:
					
					left = e.type == KeyboardEvent.KEY_DOWN;
				break;
				
				case Keyboard.RIGHT:
				case Keyboard.D:
					
					right = e.type == KeyboardEvent.KEY_DOWN;
				break;
			}
		}
		
		override public function update():void {
			
			// --- COMPUTE VELOCITY
			velocity.x = 0;
			if (right) velocity.x += SPEED;
			if (left) velocity.x -= SPEED;
			
			velocity.y = 0;
			if (down) velocity.y += SPEED;
			if (up) velocity.y -= SPEED;
			
			// --- MOVEMENT VIA VELOCITY IS HANDELED IN Asset.as
			super.update();
		}
	}
}