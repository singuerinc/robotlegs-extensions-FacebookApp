//------------------------------------------------------------------------------
//  Copyright (c) 2012-2013 the original author or authors. All Rights Reserved.
//
//  NOTICE: You are permitted to use, modify, and distribute this file
//  in accordance with the terms of the license agreement accompanying it.
//------------------------------------------------------------------------------
package robotlegs.extensions.facebook.impl.model.user {
public class FacebookUserPicture {

    public var url:String;
    public var is_silhouette:Boolean;

    public function FacebookUserPicture(data:Object) {
        this.url = data.url;
        this.is_silhouette = data.is_silhouette;
    }
}
}
