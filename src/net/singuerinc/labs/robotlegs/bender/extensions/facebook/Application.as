package net.singuerinc.labs.robotlegs.bender.extensions.facebook {
	import net.singuerinc.labs.robotlegs.bender.extensions.facebook.view.MainView;

	import robotlegs.bender.bundles.classic.ClassicRobotlegsBundle;
	import robotlegs.bender.core.api.ContextBuilderEvent;
	import robotlegs.bender.core.api.IContext;
	import robotlegs.bender.core.api.IContextBuilder;
	import robotlegs.bender.core.impl.ContextBuilder;
	import robotlegs.bender.extensions.facebook.BasicFacebookAppExtension;
	import robotlegs.bender.extensions.facebook.impl.events.FacebookEvent;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	[SWF(backgroundColor="#CDCDCD", frameRate="31", width="640", height="480")]
	public class Application extends Sprite {
		public function Application() {
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;

			var builder : IContextBuilder = new ContextBuilder()
				.withContextView(this)
				.withBundle(ClassicRobotlegsBundle)
				.withExtension(BasicFacebookAppExtension)
				.withConfig(ApplicationConfig);
			builder.addEventListener(ContextBuilderEvent.CONTEXT_BUILD_COMPLETE, onContextBuildComplete);
			builder.build();
		}

		private function onContextBuildComplete(event : ContextBuilderEvent) : void {
			
			addChild(new MainView());
			
			var context : IContext = event.context;
			context.dispatcher.dispatchEvent(new FacebookEvent(FacebookEvent.API_INIT_REQUEST));
		}
	}
}