package robotlegs.extensions.facebook.impl.services.feed {
import com.facebook.graph.Facebook;

import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookPostToFeedService implements IFacebookPostToFeedService {
    public function post(post:Object):void {
        /*
         var post:Object = {
         name: 'name',
         link: 'http://example.com',
         picture: 'http://example.com/image.jpg?v=1',
         caption: 'My caption',
         description: 'My Description'
         }
         */
        Facebook.ui('feed', post);
    }
}
}
