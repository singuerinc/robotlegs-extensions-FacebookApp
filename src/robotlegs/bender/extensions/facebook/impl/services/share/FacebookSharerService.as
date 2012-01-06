package robotlegs.bender.extensions.facebook.impl.services.share {
	import robotlegs.bender.extensions.facebook.api.services.share.IFacebookSharerService;

	import flash.external.ExternalInterface;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookSharerService implements IFacebookSharerService {
		public function sharer(url : String, title : String) : void {
			ExternalInterface.call('window.open', 'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title), 'sharer', 'toolbar=0,status=0,width=626,height=436');
		}
	}
}