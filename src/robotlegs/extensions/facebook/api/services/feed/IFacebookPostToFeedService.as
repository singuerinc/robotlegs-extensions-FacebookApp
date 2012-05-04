package robotlegs.extensions.facebook.api.services.feed {
import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;

/**
 * @author nahuel.scotti @ gmail.com
 * @see https://developers.facebook.com/docs/reference/dialogs/feed/
 */
public interface IFacebookPostToFeedService {
    function post(post:IFacebookPost):void;
}
}