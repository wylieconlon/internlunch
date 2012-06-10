//= require gmaps.js

$(function() {
	var map = new GMaps({
		div: '#map',
		lat: -12.043333,
		lng: -77.028333,
		zoom: 1,
		mapTypeControl: false,
		streetViewControl: false
	});

	map.loadFromKML({
		url: 'https://dl.dropbox.com/s/4kuqbbn72wxkvss/companies.kml?dl=1'
	});
});
