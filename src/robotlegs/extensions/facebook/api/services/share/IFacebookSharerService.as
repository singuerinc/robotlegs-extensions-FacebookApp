//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------

package robotlegs.extensions.facebook.api.services.share {
import robotlegs.extensions.facebook.api.model.sharer.IFacebookSharer;

public interface IFacebookSharerService {
    function sharer(obj:IFacebookSharer):void;
}
}
