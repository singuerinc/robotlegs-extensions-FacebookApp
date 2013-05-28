//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook {
import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;
import robotlegs.extensions.facebook.impl.services.init.FacebookInitAPIService;
import robotlegs.extensions.facebook.view.MainView;
import robotlegs.extensions.facebook.view.MainViewMediator;

public class FacebookAppConfig {
    [Inject]
    public var eventDispatcher:IEventDispatcher;
    [Inject]
    public var mediatorMap:IMediatorMap;
    [Inject]
    public var service:FacebookInitAPIService;
    [Inject]
    public var contextView:ContextView;

    [PostConstruct]
    public function init():void {

        service.api_key = '336937899651393';

        mediatorMap.map(MainView).toMediator(MainViewMediator);

        var main:MainView = new MainView();
        contextView.view.addChild(main);

        eventDispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
    }
}
}