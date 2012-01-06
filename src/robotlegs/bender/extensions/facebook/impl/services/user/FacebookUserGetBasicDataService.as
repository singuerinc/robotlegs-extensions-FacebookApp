package robotlegs.bender.extensions.facebook.impl.services.user {
	import robotlegs.bender.core.api.IContextLogger;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserGetBasicDataService;
	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;

	import com.facebook.graph.Facebook;

	import flash.events.IEventDispatcher;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookUserGetBasicDataService implements IFacebookUserGetBasicDataService {
		[Inject]
		public var logger : IContextLogger;
		[Inject]
		public var user : FacebookUser;
		[Inject]
		public var dispatcher : IEventDispatcher;

		public function getUserBasicData() : void {
			logger.info(this, 'Get User basic data...');
			Facebook.api('/me', onUserBasicData, {fields:'id,picture,name,first_name,last_name,link,username,gender,timezone,locale,updated_time,email'});
		}

		private function onUserBasicData(success : Object, fail : Object) : void {
			fail = null;

			var data : Object = success;
			logger.info(this, 'Get User basic success!');

			user.gender = data.gender;
			user.name = data.name;
			user.timezone = data.timezone;
			user.last_name = data.last_name;
			user.id = data.id;
			user.first_name = data.first_name;
			user.username = data.username;
			user.updated_time = data.updated_time;
			user.locale = data.locale;
			user.link = data.link;
			user.email = data.email;
			user.picture = data.picture;

			dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.USER_BASIC_DATA_CHANGE, user));
		}
	}
}
