package robotlegs.bender.extensions.facebook.impl.controller.user {
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserLoginService;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookLoginCommand {
		[Inject]
		public var service : IFacebookUserLoginService;

		public function execute() : void {
			service.login();
		}
	}
}