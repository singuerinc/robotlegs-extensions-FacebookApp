package robotlegs.bender.extensions.facebook.impl.services.init {
	import robotlegs.bender.core.api.IContextLogger;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;

	import com.facebook.graph.Facebook;
	import com.facebook.graph.data.FacebookAuthResponse;

	import flash.errors.IllegalOperationError;
	import flash.events.IEventDispatcher;

	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookInitAPIService {
		[Inject]
		public var logger : IContextLogger;
		[Inject]
		public var authResponse : FacebookAuthResponse;
		[Inject]
		public var dispatcher : IEventDispatcher;
		[Inject]
		public var user : FacebookUser;
		public var api_key : String;

		public function init() : void {
			if (!api_key) {
				throw new IllegalOperationError('Facebook Application Extension can\'t init without apiKey value.');
			}
			logger.info(this, 'Facebook API init...');
			Facebook.init(api_key, onFacebookInit, {oauth:true, status:true});
		}

		private function onFacebookInit(success : Object, fail : Object) : void {
			fail = null;
			authResponse = success as FacebookAuthResponse;
			logger.info(this, 'Facebook API init', [(authResponse) ? 'success!' : 'fail!']);
			user.logged = authResponse != null;
			dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT, authResponse));
		}
	}
}