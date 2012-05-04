/**
 * Created by IntelliJ IDEA.
 * User: singuerinc
 * Date: 5/4/12
 * Time: 10:30 PM
 */
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
