//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.view {
import com.bit101.components.List;
import com.facebook.graph.data.FacebookAuthResponse;

import flash.events.Event;
import flash.events.MouseEvent;
import flash.net.URLRequest;

import robotlegs.bender.bundles.mvcs.Mediator;
import robotlegs.bender.framework.api.IContext;
import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;
import robotlegs.extensions.facebook.impl.model.feed.FacebookPost;
import robotlegs.extensions.facebook.impl.model.sharer.FacebookSharer;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;

public class MainViewMediator extends Mediator {
    [Inject]
    public var view:MainView;
    [Inject]
    public var context:IContext;

    override public function initialize():void {

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

        view.friends_list.addEventListener(Event.SELECT, onFriendsListItemSelected);
    }

    private function onClickOnLoginButton(event:MouseEvent):void {
        dispatch(new FacebookEvent(FacebookEvent.USER_LOGIN_REQUEST));
    }

    private function onClickOnLogoutButton(event:MouseEvent):void {
        dispatch(new FacebookEvent(FacebookEvent.USER_LOGOUT_REQUEST));
    }

    private function onClickOnGetUserDataButton(event:MouseEvent):void {
        dispatch(new FacebookEvent(FacebookEvent.USER_GET_BASIC_DATA, 'me'));
    }

    private function onClickOnGetUserFriendsButton(event:MouseEvent):void {
        dispatch(new FacebookEvent(FacebookEvent.USER_GET_FRIENDS_DATA));
    }

    private function onClickOnSharerButton(event:MouseEvent):void {
        var data:IFacebookSharer = new FacebookSharer();
        data.url = 'https://github.com/singuerinc/robotlegs-extensions-FacebookApp';
        data.title = 'Robotlegs Facebook Extension';
        dispatch(new FacebookEvent(FacebookEvent.SHARER, data));
    }

    private function onClickOnPostToFeedButton(event:MouseEvent):void {
        var data:IFacebookPost = new FacebookPost();
        data.name = 'Robotlegs Facebook App Extension';
        data.link = 'https://github.com/singuerinc/robotlegs-extensions-FacebookApp';
        data.picture = '';
        data.caption = 'Robotlegs extensions.';
        data.description = 'The Best Robotlegs extension ever! Build a Facebook App in minutes with this extension.';
        dispatch(new FacebookEvent(FacebookEvent.USER_POST_TO_FEED, data));
    }

    private function onUserDataChange(event:FacebookEvent):void {
        var user:FacebookUser = event.data as FacebookUser;
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
        view.user_picture_is_silhouette.text = 'picture is_silhouette: ' + user.picture.is_silhouette;

        view.user_picture.load(new URLRequest(user.picture.url));
    }

    private function onUserFriendsDataChange(event:FacebookEvent):void {
        var friends:Array = event.data as Array;
        for (var i:uint = 0; i < friends.length; i++) {
            var item:* = friends[i];
            view.friends_list.addItem(item);
        }
    }

    private function onFacebookApiStatusChange(event:FacebookEvent):void {
        var authResponse:FacebookAuthResponse = event.data as FacebookAuthResponse;
        view.api_status.text = 'API status: ' + ((authResponse) ? 'OK' : 'KO, login please.');
    }

    private function onUserStatusChange(event:FacebookEvent):void {
        var logged:Boolean = Boolean(event.data);
        view.user_status.text = 'User status: ' + ((logged) ? 'logged' : 'not logged');
        view.login_btn.enabled = !logged;
        view.logout_btn.enabled = logged;
        view.getUserData_btn.enabled = logged;
        view.getUserFriends_btn.enabled = logged;
    }

    private function onFriendsListItemSelected(event:Event):void {
        var friend:FacebookUser = List(event.currentTarget).selectedItem as FacebookUser;
        if (friend) {
            dispatch(new FacebookEvent(FacebookEvent.USER_GET_BASIC_DATA, friend.id));
        }
    }
}
}