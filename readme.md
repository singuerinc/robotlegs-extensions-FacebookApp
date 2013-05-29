## BASIC

### Extend your context with FacebookExtension:

    _context = new Context()
            .install(MVCSBundle)
            .install(FacebookExtension)
            .configure(FacebookAppConfig)
            .configure(new ContextView(this));

### Configure extension:

    public class FacebookAppConfig {
        [Inject]
        public var eventDispatcher:IEventDispatcher;
        [Inject]
        public var service:FacebookInitAPIService;

        [PostConstruct]
        public function init():void {

            service.api_key = 'your_facebook_app_id';
            eventDispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
        }
    }

## DEPENDENCIES
Robotlegs Framework: https://github.com/robotlegs/robotlegs-framework
Adobe ActionScript 3 SDK for Facebook Platform: http://code.google.com/p/facebook-actionscript-api/

## TUTORIAL (spanish)
http://blog.singuerinc.com/blog/2013/05/29/robotlegs-2-facebook-app/

## TODO:
+ Unit tests