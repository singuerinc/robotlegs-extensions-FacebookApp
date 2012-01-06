package robotlegs.bender.extensions.facebook.impl.services.user {
	import robotlegs.bender.core.api.IContextLogger;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserLogoutService;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;

	import com.facebook.graph.Facebook;

	import flash.events.IEventDispatcher;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookUserLogoutService implements IFacebookUserLogoutService {
		[Inject]
		public var logger : IContextLogger;
		[Inject]
		public var user : FacebookUser;
		[Inject]
		public var dispatcher : IEventDispatcher;

		public function logout() : void {
			logger.info(this, 'User logout...');
			Facebook.logout(onFacebookLogout);
		}

		private function onFacebookLogout(success : Object) : void {
			if (success) {
				user.logged = false;
				logger.info(this, 'User logout success!');
			} else {
				logger.warn(this, 'User logout fail!');
			}
		}
	}
}