//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook {
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;

import robotlegs.bender.bundles.mvcs.MVCSBundle;
import robotlegs.bender.extensions.contextView.ContextView;
import robotlegs.bender.framework.api.IContext;
import robotlegs.bender.framework.impl.Context;

/**
 * @see http://blog.singuerinc.com/blog/2012/01/09/robotlegs-2-beta-facebook-app/
 */
[SWF(backgroundColor="#CDCDCD", frameRate="31", width="500", height="600")]
public class Application extends Sprite {

    private var _context:IContext;

    public function Application() {

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        _context = new Context()
                .install(MVCSBundle)
                .install(FacebookExtension)
                .configure(FacebookAppConfig)
                .configure(new ContextView(this));
    }
}
}