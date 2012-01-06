package robotlegs.bender.extensions.facebook.impl.controller.user {
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserGetBasicDataService;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookGetUserBasicDataCommand {
		[Inject]
		public var service : IFacebookUserGetBasicDataService;

		public function execute() : void {
			service.getUserBasicData();
		}
	}
}
