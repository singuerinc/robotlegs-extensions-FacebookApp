package robotlegs.bender.extensions.facebook.impl.model {
	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;

	import flash.events.IEventDispatcher;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookUser {
		[Inject]
		public var dispatcher : IEventDispatcher;
		public var id : String;
		public var name : String;
		public var first_name : String;
		public var last_name : String;
		public var link : String;
		public var username : String;
		public var gender : String;
		public var locale : String;
		public var picture : String;
		public var updated_time : String;
		public var timezone : int;
		public var email : String;
		private var _logged : Boolean;

		public function set logged(value : Boolean) : void {
			_logged = value;
			dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.USER_STATUS_CHANGE, _logged));
		}

		public function get logged() : Boolean {
			return _logged;
		}
		
		private var _friends : Array;
		
		public function set friends(value:Array):void{
			_friends = value;
			dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.USER_FRIENDS_DATA_CHANGE, _friends));
		}
		
		public function get friends():Array{
			return _friends;
		}
	}
}
