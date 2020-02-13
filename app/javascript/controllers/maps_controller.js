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

      // Creating the map
      mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
      const map = new mapboxgl.Map({
        container: 'map',
        style: 'mapbox://styles/mapbox/streets-v10'
      });

      // Placing markers on the map
      const markers = JSON.parse(mapElement.dataset.markers);
      markers.forEach((marker) => {
        const popup = new mapboxgl.Popup().setHTML(marker.infoWindow); // added info window as pop up

        // Create a HTML element for your custom marker
        const element = document.createElement('div');
        element.className = 'marker';
        element.style.backgroundImage = `url('${marker.image_url}')`;
        element.style.backgroundSize = 'contain';
        element.style.width = '25px';
        element.style.height = '25px';

        new mapboxgl.Marker() // INSERT 'element' AS ARGUMENT FOR CUSTOM MARKER
          .setLngLat([ marker.lng, marker.lat ])
          .setPopup(popup) // this is added for info window pop up
          .addTo(map);
      });

      // Setting map boundaries to markers
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 150, maxZoom: 15, duration: 500 });

      // Search bar for the map
      map.addControl(new MapboxGeocoder({
        accessToken: mapboxgl.accessToken,
        mapboxgl: mapboxgl
      }));

  }
}
