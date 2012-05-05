package robotlegs.extensions.facebook.impl.services.user {
import com.facebook.graph.Facebook;
import com.facebook.graph.data.FacebookAuthResponse;

import flash.events.IEventDispatcher;

import robotlegs.bender.framework.api.IContext;

import robotlegs.bender.framework.api.ILogger;
import robotlegs.extensions.facebook.api.services.user.IFacebookUserLoginService;
import robotlegs.extensions.facebook.impl.model.user.FacebookUser;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookUserLoginService implements IFacebookUserLoginService {
    [Inject]
    public var user:FacebookUser;
    [Inject]
    public var authResponse:FacebookAuthResponse;
    [Inject]
    public var context:IContext;
    [Inject]
    public var dispatcher:IEventDispatcher;

    private var _logger:ILogger;

    public function login():void {
        _logger = context.getLogger(this);
        _logger.info('User Login...');
        Facebook.login(onFacebookLogin, {scope:'email,read_stream'});
    }

    private function onFacebookLogin(success:Object, fail:Object):void {
        fail = null;

        var response:FacebookAuthResponse = success as FacebookAuthResponse;
        if (response != null && response is FacebookAuthResponse) {
            _logger.info('Facebook User login success.');
            authResponse = response;
        } else {
            _logger.info('Facebook User login fail!');
            authResponse = null;
        }
        user.id = authResponse.uid;
        user.logged = (authResponse.uid is String) && (authResponse.accessToken is String);
    }
}
}
