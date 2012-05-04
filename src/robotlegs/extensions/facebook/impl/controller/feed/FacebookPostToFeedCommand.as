package robotlegs.extensions.facebook.impl.controller.feed {
import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookPostToFeedCommand {
    [Inject]
    public var event:FacebookEvent;
    [Inject]
    public var service:IFacebookPostToFeedService;

    public function execute():void {
        service.post(event.data);
    }
}
}
