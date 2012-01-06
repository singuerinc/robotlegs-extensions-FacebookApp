package robotlegs.bender.extensions.facebook.impl.controller.init {
	import flash.events.IEventDispatcher;
	import robotlegs.bender.extensions.facebook.impl.services.init.FacebookInitAPIService;


	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class FacebookInitAPICommand {
		[Inject]
		public var dispatcher : IEventDispatcher;
		[Inject]
		public var service : FacebookInitAPIService;

		public function execute() : void {
			service.init();
		}
	}
}