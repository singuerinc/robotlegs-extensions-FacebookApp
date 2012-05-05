/**
 * Created by IntelliJ IDEA.
 * User: singuerinc
 * Date: 5/4/12
 * Time: 10:38 PM
 */
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
