package robotlegs.extensions.facebook.impl.controller.user {
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLogoutService;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookLogoutCommand {
    [Inject]
    public var service:IFacebookUserLogoutService;

    public function execute():void {
        service.logout();
    }
}
}