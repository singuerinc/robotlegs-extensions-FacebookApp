package robotlegs.extensions.facebook.view {
	import com.bit101.components.Label;
	import com.bit101.components.List;
	import com.bit101.components.PushButton;

	import flash.display.Sprite;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class MainView extends Sprite {
		public var api_status : Label;
		public var user_status : Label;
		public var login_btn : PushButton;
		public var logout_btn : PushButton;
		public var getUserData_btn : PushButton;
		public var user_id : Label;
		public var user_name : Label;
		public var user_first_name : Label;
		public var user_last_name : Label;
		public var user_username : Label;
		public var user_gender : Label;
		public var user_timezone : Label;
		public var user_updated_time : Label;
		public var user_locale : Label;
		public var user_link : Label;
		public var user_email : Label;
		public var user_picture : Label;
		public var getUserFriends_btn : PushButton;
		public var friends_list : List;
		public var sharer_btn : PushButton;
		public var post_to_feed_btn : PushButton;

		public function MainView() {
			api_status = new Label(this, 100, 40, 'API status: User not logged. Can\'t init.');
			user_status = new Label(this, 100, 60, 'User status: not logged');

			login_btn = new PushButton(this, 100, 100, 'LOGIN');
			logout_btn = new PushButton(this, 100, 130, 'LOGOUT');
			getUserData_btn = new PushButton(this, 220, 100, 'GET USER DATA');
			logout_btn.enabled = false;
			getUserData_btn.enabled = false;

			user_id = new Label(this, 360, 100, 'id: ');
			user_name = new Label(this, 360, 120, 'name: ');
			user_first_name = new Label(this, 360, 140, 'first_name: ');
			user_last_name = new Label(this, 360, 160, 'last_name: ');
			user_username = new Label(this, 360, 180, 'username: ');
			user_gender = new Label(this, 360, 200, 'gender: ');
			user_timezone = new Label(this, 360, 220, 'timezone: ');
			user_updated_time = new Label(this, 360, 240, 'updated_time: ');
			user_locale = new Label(this, 360, 260, 'locale: ');
			user_link = new Label(this, 360, 280, 'link: ');
			user_email = new Label(this, 360, 300, 'email: ');
			user_picture = new Label(this, 360, 320, 'picture: ');

			getUserFriends_btn = new PushButton(this, 100, 360, 'GET FRIENDS');
			getUserFriends_btn.enabled = false;

			friends_list = new List(this, 100, 390);
			friends_list.width = 200;

			sharer_btn = new PushButton(this, 360, 360, 'SHARE URL');
			post_to_feed_btn = new PushButton(this, 480, 360, 'POST TO FEED');
		}
	}
}