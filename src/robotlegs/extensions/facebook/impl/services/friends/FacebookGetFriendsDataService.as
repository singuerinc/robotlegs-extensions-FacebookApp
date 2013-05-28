//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.services.friends {
import com.facebook.graph.Facebook;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;
import robotlegs.extensions.facebook.impl.model.user.FacebookUserPicture;

public class FacebookGetFriendsDataService implements IFacebookUserGetFriendsDataService {
    [Inject]
    public var user:FacebookUser;
    [Inject]
    public var context:IContext;

    private var _logger:ILogger;

    public function getFriends():void {
        _logger = context.getLogger(this);
        _logger.info('Get Facebook User friends data...');
        Facebook.api('/me/friends', handleFriendsLoad, {fields: 'name,picture'});
    }

    private function handleFriendsLoad(response:Object, fail:Object):void {
        fail = null;

        _logger.info('Get Facebook User friends data sucess!');

        var friends:Array = response as Array;
        var l:uint = friends.length;

        var f_array:Array = new Array();

        for (var i:uint = 0; i < l; i++) {
            var friend:Object = friends[i];
            var f:FacebookUser = new FacebookUser();
            f.id = friend['id'];
            f.name = friend['name'];
            f.picture = new FacebookUserPicture(friend['picture']);
            f_array.push(f);
        }

        (user as FacebookUser).friends = f_array;
    }
}
}