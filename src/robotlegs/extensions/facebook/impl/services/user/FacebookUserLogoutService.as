//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.services.user {
import com.facebook.graph.Facebook;

import flash.events.IEventDispatcher;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLogoutService;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;

public class FacebookUserLogoutService implements IFacebookUserLogoutService {
    [Inject]
    public var user:FacebookUser;
    [Inject]
    public var context:IContext;
    [Inject]
    public var dispatcher:IEventDispatcher;

    private var _logger:ILogger;

    public function logout():void {
        _logger = context.getLogger(this);
        _logger.info('User logout...');
        Facebook.logout(onFacebookLogout);
    }

    private function onFacebookLogout(success:Object):void {
        if (success) {
            user.logged = false;
            _logger.info('Facebook User logout success!');
        } else {
            _logger.info('Facebook User logout fail!');
        }
    }
}
}