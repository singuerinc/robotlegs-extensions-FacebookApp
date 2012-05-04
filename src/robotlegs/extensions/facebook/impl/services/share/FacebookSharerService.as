package robotlegs.extensions.facebook.impl.services.share {
import flash.external.ExternalInterface;
import flash.net.URLRequest;
import flash.net.navigateToURL;

import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;
import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookSharerService implements IFacebookSharerService {
    public function sharer(obj:IFacebookSharer):void {

        if (obj.windowWidth == 0) obj.windowWidth = 640;
        if (obj.windowHeight == 0) obj.windowHeight = 325;

        if (ExternalInterface.available) {
            var ut:String = '//www.facebook.com/sharer.php?u=' + encodeURIComponent(obj.url) + '&t=' + encodeURIComponent(obj.title);
            var opt:String = 'toolbar=0,status=0,width=' + obj.windowWidth + ',height=' + obj.windowHeight;
            ExternalInterface.call('window.open', ut, 'sharer', opt);
        } else {
            navigateToURL(new URLRequest('//www.facebook.com/sharer.php?u=' + encodeURIComponent(obj.url) + '&t=' + encodeURIComponent(obj.title)), '_blank');
        }

    }
}
}