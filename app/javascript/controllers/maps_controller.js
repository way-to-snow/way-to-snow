// Map stylesheet (needed to place markers)
import 'mapbox-gl/dist/mapbox-gl.css';
// Search bar stylesheet
import '@mapbox/mapbox-gl-geocoder/dist/mapbox-gl-geocoder.css';
// JS to create map
import mapboxgl from 'mapbox-gl';
// JS to search map
import MapboxGeocoder from '@mapbox/mapbox-gl-geocoder';

import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]

  connect() {
    console.log("Hello from the maps controller");

    const mapElement = document.getElementById('map');
    const markers = JSON.parse(mapElement.dataset.markers);

    // Get map data from API and fill div
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    const map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/nskibiak/ck6kloetk2cm91impc47n19sy',
      // center: [138.5, 37.674],
      // pitch: 60,
      // bearing: -45,
      // zoom: 5
    });

    // Placing markers on the map
    markers.forEach((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this

      // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      // // element.style.backgroundImage = `url('${marker.image_url}')`;
      // // element.style.backgroundSize = 'contain';
      // element.style.width = '15px';
      // element.style.height = '15px';

      // Pass the element as an argument to the new marker
      new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(map);
    });

    // Setting map boundaries to markers
    const bounds = new mapboxgl.LngLatBounds();
    markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    map.fitBounds(bounds, { padding: 150, maxZoom: 15, duration: 100 });

    // Add address search field to the map
    map.addControl(new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    }));

    // Add zoom and rotation controls to the map.
    map.addControl(new mapboxgl.NavigationControl());

    // Add geolocate control to the map.
    map.addControl(
      new mapboxgl.GeolocateControl({
        positionOptions: {enableHighAccuracy: true},
        trackUserLocation: true
      })
    );

    // Hiding mapbox logos and copyrights.
    const logo = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-left > div > a");
    logo.classList.add('invisible');
    const copyrights = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-right");
    copyrights.classList.add('invisible');

  }
}

