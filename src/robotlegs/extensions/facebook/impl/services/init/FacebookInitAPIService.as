//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.services.init {
import com.facebook.graph.Facebook;
import com.facebook.graph.data.FacebookAuthResponse;

import flash.events.IEventDispatcher;

import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.api.ILogger;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;

public class FacebookInitAPIService {
    [Inject]
    public var authResponse:FacebookAuthResponse;
    [Inject]
    public var dispatcher:IEventDispatcher;
    [Inject]
    public var user:FacebookUser;
    [Inject]
    public var context:IContext;
    public var api_key:String;

    private var _logger:ILogger;

    public function init():void {
        _logger = context.getLogger(this);
        Facebook.init(api_key, onFacebookInit, {oauth: true, status: true});
    }

    private function onFacebookInit(success:Object, fail:Object):void {

        fail = null;

        authResponse = success as FacebookAuthResponse;
        user.logged = authResponse != null;

        _logger.info('Facebook User is logged? {0} / authResponse: {1}', [user.logged, authResponse]);

        dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT, authResponse));
    }
}
}