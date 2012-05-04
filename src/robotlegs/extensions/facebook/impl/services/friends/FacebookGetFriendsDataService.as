package robotlegs.extensions.facebook.impl.services.friends {
import com.facebook.graph.Facebook;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.ILogger;

import robotlegs.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;
import robotlegs.extensions.facebook.impl.model.FacebookUser;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookGetFriendsDataService implements IFacebookUserGetFriendsDataService {
    [Inject]
    public var user:FacebookUser;
    [Inject]
    public var context:IContext;

    private var _logger:ILogger;

    public function getFriends():void {
        _logger = context.getLogger(this);
        _logger.info('Get Facebook User friends data...');
        Facebook.api('/me/friends', handleFriendsLoad, {fields:'name,picture'});
    }

    private function handleFriendsLoad(response:Object, fail:Object):void {
        fail = null;

        _logger.info('Get Facebook User friends data sucess!');

        var friends:Array = response as Array;
        var l:uint = friends.length;

        var frds:Array = new Array();

        for (var i:uint = 0; i < l; i++) {
            var friend:Object = friends[i];
            var f:FacebookUser = new FacebookUser();
            f.id = friend['id'];
            f.name = friend['name'];
            f.picture = friend['picture'];
            frds.push(f);
        }

        (user as FacebookUser).friends = frds;
    }
}
}