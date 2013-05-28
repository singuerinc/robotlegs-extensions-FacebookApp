//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.controller.init {
import flash.events.IEventDispatcher;

import robotlegs.extensions.facebook.impl.services.init.FacebookInitAPIService;

public class FacebookInitAPICommand {
    [Inject]
    public var dispatcher:IEventDispatcher;
    [Inject]
    public var service:FacebookInitAPIService;

    public function execute():void {
        service.init();
    }
}
}