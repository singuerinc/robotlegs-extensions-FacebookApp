//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook.api.model.sharer {
public interface IFacebookSharer {

    function set title(value:String):void;

    function get title():String

    function set url(value:String):void

    function get url():String

    function set windowWidth(value:uint):void;

    function get windowWidth():uint;

    function set windowHeight(value:uint):void;

    function get windowHeight():uint;
}
}
