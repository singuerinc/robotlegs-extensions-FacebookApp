package robotlegs.extensions.facebook.api.services.share {
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;

/**
 * @author nahuel.scotti @ gmail.com
 */
public interface IFacebookSharerService {
    function sharer(obj:IFacebookSharer):void;
}
}
