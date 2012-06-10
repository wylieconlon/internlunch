//= require gmaps.js

$(function() {
	var map = new GMaps({
		div: '#map',
		lat: 37.7827753,
 	   	lng: -122.3931977,
		zoom: 4,
		mapTypeControl: false,
		streetViewControl: false,
	});

	infoWindow = new google.maps.InfoWindow({});

	map.loadFromKML({
		url: 'https://dl.dropbox.com/s/glfuualox4i0ag9/companies.rss?dl=1',
		suppressInfoWindows: true,
		events: {
			click: function(point){
				console.log(point, point.featureData.status);
				infoWindow.setContent(point.featureData.infoWindowHtml);
				infoWindow.setPosition(point.latLng);
				infoWindow.open(map.map);
			}
		}
	});

	$(window).on('resize', map.onResize);
});

