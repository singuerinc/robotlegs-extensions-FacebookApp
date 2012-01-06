package robotlegs.bender.extensions.facebook.impl.services.feed {
	import robotlegs.bender.extensions.facebook.api.services.feed.IFacebookPostToFeedService;

	import com.facebook.graph.Facebook;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookPostToFeedService implements IFacebookPostToFeedService {
		public function post(post : Object) : void {
			Facebook.ui('feed', post);
		}
	}
}
