//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook.impl.model.sharer {
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;

public class FacebookSharer implements IFacebookSharer {
    private var _title:String;
    private var _url:String;
    private var _windowWidth:uint;
    private var _windowHeight:uint;

    public function set title(value:String):void {
        _title = value;
    }

    public function get title():String {
        return _title;
    }

    public function set url(value:String):void {
        _url = value;
    }

    public function get url():String {
        return _url;
    }

    public function set windowWidth(value:uint):void {
        _windowWidth = value;
    }

    public function get windowWidth():uint {
        return _windowWidth;
    }

    public function set windowHeight(value:uint):void {
        _windowHeight = value;
    }

    public function get windowHeight():uint {
        return _windowHeight;
    }
}
}
