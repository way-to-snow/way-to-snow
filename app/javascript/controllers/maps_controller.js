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

  map = null;
  currentMarkers = [];

  connect() {
    const mapElement = document.getElementById('map');

    // Get map data from API and fill div
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/nskibiak/ck6kloetk2cm91impc47n19sy',
      center: [138.4, 38.0],
      // pitch: 60,
      // bearing: -45,
      zoom: 4.5
    });

    // Declare all the objects in the map
    const markers = JSON.parse(mapElement.dataset.markers);

    const searchBar = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    });

    const navControls = new mapboxgl.NavigationControl()

    const geoLocateButton = new mapboxgl.GeolocateControl({
        positionOptions: {enableHighAccuracy: true},
        trackUserLocation: true
      });

    const mapBoxLogo = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-left > div > a");

    const mapBoxCopyright = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-right");

    this.placeMarkers(markers);

    // Add controls to the map
    this.map.addControl(searchBar);
    this.map.addControl(navControls);
    this.map.addControl(geoLocateButton);

    // Hiding mapbox logos and copyrights.
    mapBoxLogo.classList.add('invisible');
    mapBoxCopyright.classList.add('invisible');
  };

  placeMarkers(markers) {
    // first clear any existing markers
    this.currentMarkers.forEach((marker) => {
      marker.remove();
    });

    // Placing new markers on the map
    this.currentMarkers = markers.map((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // add this
      // Create a HTML element for your custom marker
      const element = document.createElement('div');
      element.className = 'marker';
      // element.style.backgroundImage = `url('${marker.image_url}')`;
      // element.style.backgroundSize = 'contain';
      // element.style.width = '15px';
      // element.style.height = '15px';

      // Pass the element as an argument to the new marker
      return new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(this.map);
    });
  };

  filter() {
    const value = event.target.dataset.value;
    console.log(value);
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = () => {
      if (xhr.readyState === 4) {
        const markers = JSON.parse(xhr.responseText);
        this.placeMarkers(markers);
      };
    };
    xhr.open('GET', `/resorts.json?${value}`);
    xhr.send()
  };

}

    // Setting map boundaries to markers
    // const bounds = new mapboxgl.LngLatBounds();
    // markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
    // this.map.fitBounds(bounds, { padding: 150, maxZoom: 15, duration: 100 });

