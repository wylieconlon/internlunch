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
		url: 'http://internlunch.herokuapp.com/geofeed/6',
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
	
	function sendToUser(username) {
		FB.ui({
			'method': 'send',
			'to': username,
			'name': "Let's get lunch",
			'link': 'http://internlunch.herokuapp.com'
		});
	}
	$('#map').on('click', '.send', function() {
		var username = $(this).attr('data-username');
		console.log("username:", username);
		sendToUser(username);
	});
	$('#map').on('click', 'a', function() {
		var username = $(this).parent().children('img').attr('src').match("com/([^/]+)/picture")[1];

		if (username) {	
			sendToUser(username);
		}
	});
});

