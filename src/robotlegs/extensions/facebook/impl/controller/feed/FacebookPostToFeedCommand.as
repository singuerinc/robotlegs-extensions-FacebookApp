package robotlegs.extensions.facebook.impl.controller.feed {
import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;
import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;

/**
 * @author nahuel.scotti @ gmail.com
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
