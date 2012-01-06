package robotlegs.bender.extensions.facebook.impl.guards {
	import com.facebook.graph.data.FacebookAuthResponse;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookLoginGuard {
		[Inject]
		public var authResponse : FacebookAuthResponse;

		public function approve() : Boolean {
			return authResponse.uid != null && authResponse.accessToken != null;
		}
	}
}