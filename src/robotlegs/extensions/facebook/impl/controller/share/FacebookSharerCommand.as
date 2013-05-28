//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.controller.share {
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;
import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;

public class FacebookSharerCommand {
    [Inject]
    public var event:FacebookEvent;
    [Inject]
    public var service:IFacebookSharerService;

    public function execute():void {
        service.sharer(event.data as IFacebookSharer);
    }
}
}
