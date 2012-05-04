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
public class ApplicationConfig {
    private var _api_key:String;
    [Inject]
    public var eventDispatcher:IEventDispatcher;
    [Inject]
    public var mediatorMap:IMediatorMap;
    [Inject]
    public var service:FacebookInitAPIService;
    [Inject]
    public var contextView:DisplayObjectContainer;

    public function ApplicationConfig(api_key:String) {
        _api_key = api_key;
    }

    [PostConstruct]
    public function init():void {

        service.api_key = _api_key;

        mediatorMap.map(MainView).toMediator(MainViewMediator);

        var main:MainView = new MainView();
        contextView.addChild(main);

        //TODO: ¿Por qué lo hace la mediación automática?
        mediatorMap.mediate(main);

        eventDispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
    }
}
}