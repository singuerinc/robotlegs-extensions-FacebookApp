/**
 * Created by IntelliJ IDEA.
 * User: singuerinc
 * Date: 5/4/12
 * Time: 7:25 PM
 */
package robotlegs.extensions.facebook.impl.model.feed {
import robotlegs.extensions.facebook.api.model.feed.IFacebookPost;

public class FacebookPost extends Object implements IFacebookPost{

    private var _display:String;
    private var _from:String;
    private var _to:String;
    private var _link:String;
    private var _picture:String;
    private var _source:String;
    private var _name:String;
    private var _caption:String;
    private var _description:String;
    private var _properties:Object;
    private var _actions:Object;
    private var _ref:String;

    public function set display(value:String):void {
        _display = value;
    }

    public function get display():String {
        return _display;
    }

    public function set from(value:String):void {
        _from = value;
    }

    public function get from():String {
        return _from;
    }

    public function set to(value:String):void {
        _to = value;
    }

    public function get to():String {
        return _to;
    }

    public function set link(value:String):void {
        _link = value;
    }

    public function get link():String {
        return _link;
    }

    public function set picture(value:String):void {
        _picture = value;
    }

    public function get picture():String {
        return _picture;
    }

    public function set source(value:String):void {
        _source = value;
    }

    public function get source():String {
        return _source;
    }

    public function set name(value:String):void {
        _name = value;
    }

    public function get name():String {
        return _name;
    }

    public function set caption(value:String):void {
        _caption = value;
    }

    public function get caption():String {
        return _caption;
    }

    public function set description(value:String):void {
        _description = value;
    }

    public function get description():String {
        return _description;
    }

    public function set properties(value:Object):void {
        _properties = value;
    }

    public function get properties():Object {
        return _properties;
    }

    public function set actions(value:Object):void {
        _actions = value;
    }

    public function get actions():Object {
        return _actions;
    }

    public function set ref(value:String):void {
        _ref = value;
    }

    public function get ref():String {
        return _ref;
    }
}
}
