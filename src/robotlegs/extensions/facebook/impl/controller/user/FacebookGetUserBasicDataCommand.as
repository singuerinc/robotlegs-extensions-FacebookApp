package robotlegs.extensions.facebook.impl.controller.user {
import robotlegs.extensions.facebook.api.services.user.IFacebookUserGetBasicDataService;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookGetUserBasicDataCommand {
    [Inject]
    public var service:IFacebookUserGetBasicDataService;

    public function execute():void {
        service.getUserBasicData();
    }
}
}