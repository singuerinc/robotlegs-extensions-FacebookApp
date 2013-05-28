//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook {
import com.facebook.graph.data.FacebookAuthResponse;

import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.IExtension;
import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;
import robotlegs.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;
import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;
import robotlegs.extensions.facebook.api.services.user.IFacebookUserGetBasicDataService;
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLoginService;
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLogoutService;
import robotlegs.extensions.facebook.impl.controller.feed.FacebookPostToFeedCommand;
import robotlegs.extensions.facebook.impl.controller.friends.FacebookGetFriendsDataCommand;
import robotlegs.extensions.facebook.impl.controller.init.FacebookInitAPICommand;
import robotlegs.extensions.facebook.impl.controller.share.FacebookSharerCommand;
import robotlegs.extensions.facebook.impl.controller.user.FacebookGetUserBasicDataCommand;
import robotlegs.extensions.facebook.impl.controller.user.FacebookLoginCommand;
import robotlegs.extensions.facebook.impl.controller.user.FacebookLogoutCommand;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;
import robotlegs.extensions.facebook.impl.services.feed.FacebookPostToFeedService;
import robotlegs.extensions.facebook.impl.services.friends.FacebookGetFriendsDataService;
import robotlegs.extensions.facebook.impl.services.init.FacebookInitAPIService;
import robotlegs.extensions.facebook.impl.services.share.FacebookSharerService;
import robotlegs.extensions.facebook.impl.services.user.FacebookUserGetBasicDataService;
import robotlegs.extensions.facebook.impl.services.user.FacebookUserLoginService;
import robotlegs.extensions.facebook.impl.services.user.FacebookUserLogoutService;

public class FacebookExtension implements IExtension {

    public function extend(context:IContext):void {

        // model
        context.injector.map(FacebookAuthResponse).asSingleton();
        context.injector.map(FacebookUser).asSingleton();

        // services
        context.injector.map(FacebookInitAPIService).asSingleton();
        context.injector.map(IFacebookUserLoginService).toSingleton(FacebookUserLoginService);
        context.injector.map(IFacebookUserLogoutService).toSingleton(FacebookUserLogoutService);
        context.injector.map(IFacebookUserGetBasicDataService).toSingleton(FacebookUserGetBasicDataService);
        context.injector.map(IFacebookUserGetFriendsDataService).toSingleton(FacebookGetFriendsDataService);
        context.injector.map(IFacebookPostToFeedService).toSingleton(FacebookPostToFeedService);
        context.injector.map(IFacebookSharerService).toSingleton(FacebookSharerService);

        var commandMap:IEventCommandMap = context.injector.getInstance(IEventCommandMap);

        // commands
        commandMap.map(FacebookEvent.API_INIT_REQUEST, FacebookEvent).toCommand(FacebookInitAPICommand);
        commandMap.map(FacebookEvent.USER_LOGIN_REQUEST, FacebookEvent).toCommand(FacebookLoginCommand);
        commandMap.map(FacebookEvent.USER_LOGOUT_REQUEST, FacebookEvent).toCommand(FacebookLogoutCommand);
        commandMap.map(FacebookEvent.USER_GET_BASIC_DATA, FacebookEvent).toCommand(FacebookGetUserBasicDataCommand);
        commandMap.map(FacebookEvent.USER_GET_FRIENDS_DATA, FacebookEvent).toCommand(FacebookGetFriendsDataCommand);
        commandMap.map(FacebookEvent.USER_POST_TO_FEED, FacebookEvent).toCommand(FacebookPostToFeedCommand);
        commandMap.map(FacebookEvent.SHARER, FacebookEvent).toCommand(FacebookSharerCommand);
    }
}
}