package net.singuerinc.labs.robotlegs.bender.extensions.facebook.view {
	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;
	import robotlegs.bender.extensions.mediatorMap.impl.Mediator;

	import com.facebook.graph.data.FacebookAuthResponse;

	import flash.events.MouseEvent;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class MainViewMediator extends Mediator {
		[Inject]
		public var view : MainView;

		override public function initialize() : void {
			addContextListener(FacebookEvent.API_INIT, onFacebookApiStatusChange, FacebookEvent);
			addContextListener(FacebookEvent.USER_STATUS_CHANGE, onUserStatusChange, FacebookEvent);
			addContextListener(FacebookEvent.USER_BASIC_DATA_CHANGE, onUserDataChange, FacebookEvent);
			addContextListener(FacebookEvent.USER_FRIENDS_DATA_CHANGE, onUserFriendsDataChange, FacebookEvent);

			view.login_btn.addEventListener(MouseEvent.CLICK, onClickOnLoginButton);
			view.logout_btn.addEventListener(MouseEvent.CLICK, onClickOnLogoutButton);

			view.getUserData_btn.addEventListener(MouseEvent.CLICK, onClickOnGetUserDataButton);

			view.getUserFriends_btn.addEventListener(MouseEvent.CLICK, onClickOnGetUserFriendsButton);

			view.sharer_btn.addEventListener(MouseEvent.CLICK, onClickOnSharerButton);

			view.post_to_feed_btn.addEventListener(MouseEvent.CLICK, onClickOnPostToFeedButton);
		}

		private function onClickOnLoginButton(event : MouseEvent) : void {
			dispatch(new FacebookEvent(FacebookEvent.USER_LOGIN_REQUEST));
		}

		private function onClickOnLogoutButton(event : MouseEvent) : void {
			dispatch(new FacebookEvent(FacebookEvent.USER_LOGOUT_REQUEST));
		}

		private function onClickOnGetUserDataButton(event : MouseEvent) : void {
			dispatch(new FacebookEvent(FacebookEvent.USER_GET_BASIC_DATA));
		}

		private function onClickOnGetUserFriendsButton(event : MouseEvent) : void {
			dispatch(new FacebookEvent(FacebookEvent.USER_GET_FRIENDS_DATA));
		}

		private function onClickOnSharerButton(event : MouseEvent) : void {
			var data : Object = {url:'http://blog.singuerinc.net/?p=56', title:'ClassicFacebookAppExtension for Robotlegs 2'};
			dispatch(new FacebookEvent(FacebookEvent.SHARER, data));
		}

		private function onClickOnPostToFeedButton(event : MouseEvent) : void {
			var data : Object = {};
			data.name = 'ClassicFacebookAppExtension for Robotlegs 2';
			data.link = 'http://blog.singuerinc.net/?p=56';
			data.picture = 'http://www.theflashstudio.net/blog/robotlegs.JPG';
			data.caption = 'caption';
			data.description = 'description';
			dispatch(new FacebookEvent(FacebookEvent.USER_POST_TO_FEED, data));
		}

		private function onUserDataChange(event : FacebookEvent) : void {
			var user : FacebookUser = event.data as FacebookUser;
			view.user_id.text = 'id: ' + user.id;
			view.user_name.text = 'name: ' + user.name;
			view.user_first_name.text = 'first_name: ' + user.first_name;
			view.user_last_name.text = 'last_name: ' + user.last_name;
			view.user_username.text = 'username: ' + user.username;
			view.user_gender.text = 'gender: ' + user.username;
			view.user_timezone.text = 'timezone: ' + user.timezone;
			view.user_updated_time.text = 'updated_time: ' + user.updated_time;
			view.user_locale.text = 'locale: ' + user.locale;
			view.user_link.text = 'link: ' + user.link;
			view.user_email.text = 'email: ' + user.email;
			view.user_picture.text = 'picture: ' + user.picture;
		}

		private function onUserFriendsDataChange(event : FacebookEvent) : void {
			var friends : Array = event.data as Array;
			for (var i : uint = 0; i < friends.length; i++) {
				var item : * = friends[i];
				view.friends_list.addItem(item);
			}
		}

		private function onFacebookApiStatusChange(event : FacebookEvent) : void {
			var authResponse : FacebookAuthResponse = event.data as FacebookAuthResponse;
			view.api_status.text = 'API status: ' + ((authResponse) ? 'OK' : 'KO, login please.');
			// t.obj(authResponse);
		}

		private function onUserStatusChange(event : FacebookEvent) : void {
			var logged : Boolean = Boolean(event.data);
			view.user_status.text = 'User status: ' + ((logged) ? 'logged' : 'not logged');
			view.login_btn.enabled = !logged;
			view.logout_btn.enabled = logged;
			view.getUserData_btn.enabled = logged;
			view.getUserFriends_btn.enabled = logged;
		}
	}
}