package robotlegs.bender.extensions.facebook {
	import robotlegs.bender.core.api.IContext;
	import robotlegs.bender.core.api.IContextExtension;
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.facebook.api.services.feed.IFacebookPostToFeedService;
	import robotlegs.bender.extensions.facebook.api.services.friends.IFacebookUserGetFriendsDataService;
	import robotlegs.bender.extensions.facebook.api.services.share.IFacebookSharerService;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserGetBasicDataService;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserLoginService;
	import robotlegs.bender.extensions.facebook.api.services.user.IFacebookUserLogoutService;
	import robotlegs.bender.extensions.facebook.impl.controller.feed.FacebookPostToFeedCommand;
	import robotlegs.bender.extensions.facebook.impl.controller.friends.FacebookGetFriendsDataCommand;
	import robotlegs.bender.extensions.facebook.impl.controller.init.FacebookInitAPICommand;
	import robotlegs.bender.extensions.facebook.impl.controller.share.FacebookSharerCommand;
	import robotlegs.bender.extensions.facebook.impl.controller.user.FacebookGetUserBasicDataCommand;
	import robotlegs.bender.extensions.facebook.impl.controller.user.FacebookLoginCommand;
	import robotlegs.bender.extensions.facebook.impl.controller.user.FacebookLogoutCommand;
	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;
	import robotlegs.bender.extensions.facebook.impl.model.FacebookUser;
	import robotlegs.bender.extensions.facebook.impl.services.feed.FacebookPostToFeedService;
	import robotlegs.bender.extensions.facebook.impl.services.friends.FacebookGetFriendsDataService;
	import robotlegs.bender.extensions.facebook.impl.services.init.FacebookInitAPIService;
	import robotlegs.bender.extensions.facebook.impl.services.share.FacebookSharerService;
	import robotlegs.bender.extensions.facebook.impl.services.user.FacebookUserGetBasicDataService;
	import robotlegs.bender.extensions.facebook.impl.services.user.FacebookUserLoginService;
	import robotlegs.bender.extensions.facebook.impl.services.user.FacebookUserLogoutService;

	import com.facebook.graph.data.FacebookAuthResponse;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class BasicFacebookAppExtension implements IContextExtension {
		private var context : IContext;

		public function install(context : IContext) : void {
			this.context = context;

			// model
			context.injector.map(FacebookAuthResponse).asSingleton();
			context.injector.map(FacebookUser).asSingleton();

			// api services
			context.injector.map(FacebookInitAPIService).asSingleton();

			// user services
			context.injector.map(IFacebookUserLoginService).toSingleton(FacebookUserLoginService);
			context.injector.map(IFacebookUserLogoutService).toSingleton(FacebookUserLogoutService);
			context.injector.map(IFacebookUserGetBasicDataService).toSingleton(FacebookUserGetBasicDataService);

			// friends services
			context.injector.map(IFacebookUserGetFriendsDataService).toSingleton(FacebookGetFriendsDataService);

			// feed services
			context.injector.map(IFacebookPostToFeedService).toSingleton(FacebookPostToFeedService);

			// share services
			context.injector.map(IFacebookSharerService).toSingleton(FacebookSharerService);
		}

		public function initialize() : void {
			var commandMap : IEventCommandMap = context.injector.getInstance(IEventCommandMap);
			commandMap.map(FacebookEvent.API_INIT_REQUEST, FacebookEvent, true).toCommand(FacebookInitAPICommand);

			// user commands
			commandMap.map(FacebookEvent.USER_LOGIN_REQUEST, FacebookEvent).toCommand(FacebookLoginCommand);
			commandMap.map(FacebookEvent.USER_LOGOUT_REQUEST, FacebookEvent).toCommand(FacebookLogoutCommand);
			commandMap.map(FacebookEvent.USER_GET_BASIC_DATA, FacebookEvent).toCommand(FacebookGetUserBasicDataCommand);

			// friends command
			commandMap.map(FacebookEvent.USER_GET_FRIENDS_DATA, FacebookEvent).toCommand(FacebookGetFriendsDataCommand);

			// feed commands
			commandMap.map(FacebookEvent.USER_POST_TO_FEED, FacebookEvent).toCommand(FacebookPostToFeedCommand);

			// share commands
			commandMap.map(FacebookEvent.SHARER, FacebookEvent).toCommand(FacebookSharerCommand);
		}

		public function uninstall() : void {
			context.injector.unmap(FacebookAuthResponse);
			context.injector.unmap(FacebookUser);
			context.injector.unmap(FacebookInitAPIService);
			context.injector.unmap(IFacebookUserLoginService);
			context.injector.unmap(IFacebookUserLogoutService);
			context.injector.unmap(IFacebookUserGetBasicDataService);
			context.injector.unmap(IFacebookUserGetFriendsDataService);
			context.injector.unmap(IFacebookPostToFeedService);
			context.injector.unmap(IFacebookSharerService);
		}
	}
}