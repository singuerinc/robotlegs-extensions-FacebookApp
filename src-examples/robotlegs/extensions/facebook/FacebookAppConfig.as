package robotlegs.extensions.facebook {
import flash.display.DisplayObjectContainer;
import flash.events.IEventDispatcher;

import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
import robotlegs.extensions.facebook.impl.events.FacebookEvent;
import robotlegs.extensions.facebook.impl.services.init.FacebookInitAPIService;
import robotlegs.extensions.facebook.view.MainView;
import robotlegs.extensions.facebook.view.MainViewMediator;

/**
 * @author nahuel.scotti @ gmail.com
 */
public class FacebookAppConfig {
    [Inject]
    public var eventDispatcher:IEventDispatcher;
    [Inject]
    public var mediatorMap:IMediatorMap;
    [Inject]
    public var service:FacebookInitAPIService;
    [Inject]
    public var contextView:DisplayObjectContainer;

    [PostConstruct]
    public function init():void {

        service.api_key = 'YOUR_APP_KEY_HERE';

        mediatorMap.map(MainView).toMediator(MainViewMediator);

        var main:MainView = new MainView();
        contextView.addChild(main);

        //FIXME: ¿Por qué lo hace la mediación automática?
        mediatorMap.mediate(main);

        eventDispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
    }
}
}