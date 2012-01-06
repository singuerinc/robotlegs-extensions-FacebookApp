package robotlegs.bender.extensions.facebook.impl.services.user {
	import robotlegs.bender.core.api.IContextLogger;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserLoginService;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;

	import com.facebook.graph.Facebook;
	import com.facebook.graph.data.FacebookAuthResponse;

	import flash.events.IEventDispatcher;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookUserLoginService implements IFacebookUserLoginService {
		[Inject]
		public var logger : IContextLogger;
		[Inject]
		public var user : FacebookUser;
		[Inject]
		public var authResponse : FacebookAuthResponse;
		[Inject]
		public var dispatcher : IEventDispatcher;

		public function login() : void {
			logger.info(this, 'User Login...');
			Facebook.login(onFacebookLogin, {scope:'email,read_stream'});
		}

		private function onFacebookLogin(success : Object, fail : Object) : void {
			fail = null;

			var response : FacebookAuthResponse = success as FacebookAuthResponse;

			if (response != null && response is FacebookAuthResponse) {
				logger.info(this, 'User success.');
				authResponse = response;
			} else {
				logger.warn(this, 'User Login fail!');
				authResponse = null;
			}
			user.id = authResponse.uid;
			user.logged = (authResponse.uid is String) && (authResponse.accessToken is String);
		}
	}
}
