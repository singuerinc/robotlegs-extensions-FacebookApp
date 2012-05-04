package robotlegs.extensions.facebook {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

/**
 * @author nahuel.scotti @ gmail.com
 * @see http://blog.singuerinc.net/?p=217
 */
[SWF(backgroundColor="#CDCDCD", frameRate="31", width="640", height="480")]
public class Application extends Sprite {
    private var _context:IContext;

    public function Application() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        _context = new Context()
                .extend(
                MVCSBundle,
                FacebookExtension);
        _context.configure(new ApplicationConfig('App_ID_or_API_Key'), this);
    }
}
}