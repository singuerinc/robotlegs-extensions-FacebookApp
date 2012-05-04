package robotlegs.extensions.facebook.impl.controller.share {
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;
import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;

/**
 * @author nahuel.scotti @ gmail.com
 */
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
