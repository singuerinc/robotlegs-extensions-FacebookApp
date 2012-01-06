package robotlegs.bender.extensions.facebook.impl.controller.friends {
	import robotlegs.bender.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookGetFriendsDataCommand {
		[Inject]
		public var service : IFacebookUserGetFriendsDataService;

		public function execute() : void {
			service.getFriends();
		}
	}
}
