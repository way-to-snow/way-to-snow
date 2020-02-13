import 'mapbox-gl/dist/mapbox-gl.css';
import mapboxgl from 'mapbox-gl';

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
        new mapboxgl.Marker()
          .setLngLat([ marker.lng, marker.lat ])
          .addTo(map);
      });

      // Setting map boundaries to markers
      const bounds = new mapboxgl.LngLatBounds();
      markers.forEach(marker => bounds.extend([ marker.lng, marker.lat ]));
      map.fitBounds(bounds, { padding: 150, maxZoom: 15, duration: 500 });

  }
}
