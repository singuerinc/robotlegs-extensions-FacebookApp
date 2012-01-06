package net.singuerinc.labs.robotlegs.bender.extensions.facebook {
	import net.singuerinc.labs.robotlegs.bender.extensions.facebook.view.MainView;
	import net.singuerinc.labs.robotlegs.bender.extensions.facebook.view.MainViewMediator;

	import robotlegs.bender.core.api.IContext;
	import robotlegs.bender.core.api.IContextConfig;
	import robotlegs.bender.extensions.facebook.impl.services.init.FacebookInitAPIService;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;

	import flash.display.DisplayObjectContainer;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public class ApplicationConfig implements IContextConfig {
		[Inject]
		public var contextView : DisplayObjectContainer;
		[Inject]
		public var mediatorMap : IMediatorMap;
		[Inject]
		public var service : FacebookInitAPIService;

		public function configure(context : IContext) : void {
			service.api_key = 'XXXXXXXXXXXXX';
			mediatorMap.map(MainView).toMediator(MainViewMediator);
		}
	}
}