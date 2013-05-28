//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.services.share {
import flash.external.ExternalInterface;
import flash.net.URLRequest;
import flash.net.navigateToURL;

import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;
import robotlegs.extensions.facebook.api.services.share.IFacebookSharerService;

public class FacebookSharerService implements IFacebookSharerService {
    public function sharer(obj:IFacebookSharer):void {

        if (obj.windowWidth == 0) obj.windowWidth = 640;
        if (obj.windowHeight == 0) obj.windowHeight = 325;

        if (ExternalInterface.available) {
            var ut:String = '//www.facebook.com/sharer.php?u=' + encodeURIComponent(obj.url) + '&t=' + encodeURIComponent(obj.title);
            var opt:String = 'toolbar=0,status=0,width=' + obj.windowWidth + ',height=' + obj.windowHeight;
            ExternalInterface.call('window.open', ut, 'sharer', opt);
        } else {
            navigateToURL(new URLRequest('//www.facebook.com/sharer.php?u=' + encodeURIComponent(obj.url) + '&t=' + encodeURIComponent(obj.title)), '_blank');
        }

    }
}
}