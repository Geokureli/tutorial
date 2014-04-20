package kureli.art {
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author George
	 */
	public class Asset extends MovieClip {
		
		public var assets:Vector.<Asset> = new <Asset>[];
		
		public function Asset() {
			super();
			
			setDefaultPoperties();
			findChildren();
			
			addEventListener(Event.ADDED_TO_STAGE, init)
		}
		
		/** declare starting values here */
		protected function setDefaultPoperties():void { }
		
		protected function findChildren():void {
			var child:Asset;
			
			for (var i:int = 0; i < numChildren; i++) {
				// --- CAST CHILD AS ASSET
				child = getChildAt(i) as Asset;
				// --- CHILDREN THAT ARE NOT ASSETS WILL BE NULL
				if (child != null)
					assets.push(child);
			}
		}
		
		/**
		 * Override this if you want to access the stage
		 * @param	e
		 */
		protected function init(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		
		public function reset():void {
			// --- RESET CHILDREN
			for each(var child:Asset in assets)
				child.reset();
		}
		
		/** Always remember to clear your memory */
		public function destroy():void {
			// --- DESTROY CHILDREN
			for each(var child:Asset in assets)
				child.destroy();
			
			assets = null;
		}
		
		/** Called from the parent asset. */
		public function update():void {
			// --- UPDATE CHILDREN
			for each(var child:Asset in assets)
				child.update();
		}
		
		override public function addChild(child:DisplayObject):DisplayObject {
			
			if (child is Asset)
				assets.push(child);
			
			return super.addChild(child);
		}
	}
}