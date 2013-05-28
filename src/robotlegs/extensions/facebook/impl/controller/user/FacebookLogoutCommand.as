//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.controller.user {
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLogoutService;

public class FacebookLogoutCommand {
    [Inject]
    public var service:IFacebookUserLogoutService;

    public function execute():void {
        service.logout();
    }
}
}