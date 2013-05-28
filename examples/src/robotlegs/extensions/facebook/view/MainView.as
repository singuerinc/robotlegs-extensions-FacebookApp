//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook.view {
import com.bit101.components.Label;
import com.bit101.components.List;
import com.bit101.components.PushButton;

import flash.display.Loader;
import flash.display.Sprite;

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
		public var user_picture_is_silhouette : Label;
		public var getUserFriends_btn : PushButton;
		public var friends_list : List;
		public var sharer_btn : PushButton;
		public var post_to_feed_btn : PushButton;
        public var user_picture:Loader;

		public function MainView() {
			api_status = new Label(this, 25, 40, 'API status: User not logged. Can\'t init.');
			user_status = new Label(this, 25, 60, 'User status: not logged');

			login_btn = new PushButton(this, 25, 100, 'LOGIN');
			logout_btn = new PushButton(this, 25, 130, 'LOGOUT');
			getUserData_btn = new PushButton(this, 145, 100, 'GET USER DATA');
			logout_btn.enabled = false;
			getUserData_btn.enabled = false;

			user_id = new Label(this, 275, 100, 'id: ');
			user_name = new Label(this, 275, 120, 'name: ');
			user_first_name = new Label(this, 275, 140, 'first_name: ');
			user_last_name = new Label(this, 275, 160, 'last_name: ');
			user_username = new Label(this, 275, 180, 'username: ');
			user_gender = new Label(this, 275, 200, 'gender: ');
			user_timezone = new Label(this, 275, 220, 'timezone: ');
			user_updated_time = new Label(this, 275, 240, 'updated_time: ');
			user_locale = new Label(this, 275, 260, 'locale: ');
			user_link = new Label(this, 275, 280, 'link: ');
			user_email = new Label(this, 275, 300, 'email: ');
			user_picture_is_silhouette = new Label(this, 275, 320, 'is_silhouette: ');

            user_picture = new Loader();
            user_picture.x = 145;
            user_picture.y = 240;
            addChild(user_picture);

			getUserFriends_btn = new PushButton(this, 100, 360, 'GET FRIENDS');
			getUserFriends_btn.enabled = false;

			friends_list = new List(this, 100, 390);
			friends_list.width = 200;

			sharer_btn = new PushButton(this, 205, 360, 'SHARE URL');
			post_to_feed_btn = new PushButton(this, 310, 360, 'POST TO FEED');
		}
	}
}