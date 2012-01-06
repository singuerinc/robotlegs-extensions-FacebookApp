package robotlegs.bender.extensions.facebook.api.services.feed {
	/**
	 * @author nahuel.scotti @ gmail.com
	 */
	public interface IFacebookPostToFeedService {
		/*
		var post:Object = {
		name: '¿Qué crees que se siente al pilotar un Audi en el Circuito del Jarama?',
		link: 'https://apps.facebook.com/audi_ade_jarama/',
		picture: 'http://apps.doubleyou.com/ade/ADE_share.jpg?v=1',
		caption: '{phrase.phrase}',
		description: '¿Me ayudáis a ganar una de las 5 experiencias de conducción de Audi en el Circuito del Jarama? Solo tenéis que votar mi respuesta.'
		}
		signals.postOnFacebook.dispatch(post);
		 */
		function post(post : Object) : void;
	}
}