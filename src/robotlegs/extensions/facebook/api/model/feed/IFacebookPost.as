//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.api.model.feed {
public interface IFacebookPost {

    /**
     * @see https://developers.facebook.com/docs/reference/dialogs/feed/
     */

    function set display(value:String):void;

    function get display():String;

    function set from(value:String):void;

    function get from():String;

    function set to(value:String):void;

    function get to():String;

    function set link(value:String):void;

    function get link():String;

    function set picture(value:String):void;

    function get picture():String;

    function set source(value:String):void;

    function get source():String;

    function set name(value:String):void;

    function get name():String;

    function set caption(value:String):void;

    function get caption():String;

    function set description(value:String):void;

    function get description():String;

    function set properties(value:Object):void;

    function get properties():Object;

    function set actions(value:Object):void;

    function get actions():Object;

    function set ref(value:String):void;

    function get ref():String;
}
}
