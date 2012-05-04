# BASIC

## Extend your context with FacebookExtension:

    _context = new Context();
    _context.extend(MVCSBundle, FacebookExtension);
    _context.configure(FacebookAppConfig, this);

## Configure extension:

    public class ApplicationConfig {
        [Inject]
        public var eventDispatcher:IEventDispatcher;
        [Inject]
        public var service:FacebookInitAPIService;

        [PostConstruct]
        public function init():void {
            service.api_key = 'YOUR_APP_KEY_HERE';
            eventDispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
        }
    }

# DEPENDENCIES
Adobe ActionScript 3 SDK for Facebook Platform: http://code.google.com/p/facebook-actionscript-api/

# TUTORIAL (spanish)
http://blog.singuerinc.net/?p=217

# TODO:
+ Unit tests
+ Rename github project to "robotlegs-extensions-FacebookApp"