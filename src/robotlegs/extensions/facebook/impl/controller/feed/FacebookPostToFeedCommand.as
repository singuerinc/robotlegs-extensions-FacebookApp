//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook.impl.controller.feed {
import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;
import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;

/**
 * @see https://developers.facebook.com/docs/reference/dialogs/feed/
 */
public class FacebookPostToFeedCommand {
    [Inject]
    public var event:FacebookEvent;
    [Inject]
    public var service:IFacebookPostToFeedService;

    public function execute():void {
        service.post(event.data as IFacebookPost);
    }
}
}
