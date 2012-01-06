package robotlegs.bender.extensions.facebook.impl.services.friends {
	import robotlegs.bender.core.api.IContextLogger;
	import robotlegs.bender.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;

	import com.facebook.graph.Facebook;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookGetFriendsDataService implements IFacebookUserGetFriendsDataService {
		[Inject]
		public var logger : IContextLogger;
		[Inject]
		public var user : FacebookUser;

		public function getFriends() : void {
			logger.info(this, 'Get friends...');
			Facebook.api('/me/friends', handleFriendsLoad, {fields:'name,picture'});
		}

		private function handleFriendsLoad(response : Object, fail : Object) : void {
			fail = null;

			var friends : Array = response as Array;
			var l : uint = friends.length;

			logger.info(this, 'Get friends complete. Total friends:', [l]);
			var frds : Array = new Array();

			for (var i : uint = 0; i < l; i++) {
				var friend : Object = friends[i];
				var f : FacebookUser = new FacebookUser();
				f.id = friend['id'];
				f.name = friend['name'];
				f.picture = friend['picture'];
				frds.push(f);
			}

			(user as FacebookUser).friends = frds;
		}
	}
}
