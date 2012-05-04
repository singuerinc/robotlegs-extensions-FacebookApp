package robotlegs.extensions.facebook.impl.services.share {
import com.facebook.graph.Facebook;

import flash.external.ExternalInterface;
import flash.net.URLRequest;
import flash.net.navigateToURL;

import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookSharerService implements IFacebookSharerService {
    public function sharer(url:String, title:String):void {

        //navigateToURL(new URLRequest('http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title)), '_blank');


        if (ExternalInterface.available) {
            var ut:String = 'http://www.facebook.com/sharer.php?u=' + encodeURIComponent(url) + '&t=' + encodeURIComponent(title);
            var opt:String = 'toolbar=0,status=0,width=640,height=325';
            ExternalInterface.call('window.open', ut, 'sharer', opt);
        }

    }
}
}