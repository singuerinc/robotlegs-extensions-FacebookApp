package robotlegs.extensions.facebook.impl.services.feed {
import com.facebook.graph.Facebook;

import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;
import robotlegs.extensions.facebook.api.services.feed.IFacebookPostToFeedService;

/**
 * @author nahuel.scotti @ gmail.com
 * @see https://developers.facebook.com/docs/reference/dialogs/feed/
 */
public class FacebookPostToFeedService implements IFacebookPostToFeedService {
    public function post(post:IFacebookPost):void {

        var obj:Object = {};

        if (post.display) obj.display = post.display;
        if (post.from) obj.from = post.from;
        if (post.to) obj.to = post.to;
        if (post.link) obj.link = post.link;
        if (post.picture) obj.picture = post.picture;
        if (post.source) obj.source = post.source;
        if (post.name) obj.name = post.name;
        if (post.caption) obj.caption = post.caption;
        if (post.description) obj.description = post.description;
        if (post.properties) obj.properties = post.properties;
        if (post.actions) obj.actions = post.actions;
        if (post.ref) obj.ref = post.ref;

        if (obj.source && obj.picture) {
            delete obj.picture;
        }

        if (!obj.display) obj.display = 'iframe';

        Facebook.ui('feed', obj);
    }
}
}
