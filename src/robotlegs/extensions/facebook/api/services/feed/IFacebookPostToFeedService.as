package robotlegs.extensions.facebook.api.services.feed {
/**
 * @author nahuel.scotti @ gmail.com
 */
public interface IFacebookPostToFeedService {
    /*
     var post:Object = {
        name: 'name',
        link: 'http://example.com',
        picture: 'http://example.com/image.jpg?v=1',
        caption: 'My caption',
        description: 'My Description'
     }
     */
    function post(post:Object):void;
}
}