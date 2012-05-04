package robotlegs.extensions.facebook.impl.events {
import flash.events.Event;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookEvent extends Event {
    // api
    public static const API_INIT_REQUEST:String = "facebookApiInitRequest";
    public static const API_INIT:String = 'facebookApiInit';
    // status / login / logout
    public static const USER_LOGIN_REQUEST:String = "facebookUserLoginRequest";
    public static const USER_LOGOUT_REQUEST:String = "facebookUserLogoutRequest";
    public static const USER_STATUS_CHANGE:String = "facebookUserStatusChange";
    // user's basic data
    public static const USER_GET_BASIC_DATA:String = "facebookUserGetBasicData";
    public static const USER_BASIC_DATA_CHANGE:String = "facebookUserDataChange";
    // friends
    public static const USER_GET_FRIENDS_DATA:String = "facebookUserGetFriendsData";
    public static const USER_FRIENDS_DATA_CHANGE:String = "facebookUserFriendsDataChange";
    // feed
    public static const USER_POST_TO_FEED:String = "facebookUserPostToFeed";
    public static const SHARER:String = "sharer";
    public var data:Object;

    public function FacebookEvent(type:String, data:Object = null, bubbles:Boolean = false, cancelable:Boolean = false) {
        this.data = data;
        super(type, bubbles, cancelable);
    }
}
}
