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
  static targets = [ "counter", "slider" ]

  map = null;
  currentMarkers = [];

  connect() {

    const mapElement = document.getElementById('map');

    // Get map data from API and fill div
    mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
    this.map = new mapboxgl.Map({
      container: 'map',
      style: 'mapbox://styles/nskibiak/ck72q78sz1kf11iot6ya2iny0',
      center: [138.4, 38.5],
      zoom: 4.5
    });

    // Declare all the objects in the map
    const markers = JSON.parse(mapElement.dataset.markers);

    this.placeMarkers(markers, 0);
    this.finalMapSetUp();

  };

  placeMarkers(markers, day) {

    // Clear any existing markers
    this.currentMarkers.forEach((marker) => {
      marker.remove();
    });

    // Placing new markers on the map
    this.currentMarkers = markers.map((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
      element.className = `marker ${marker.conditions[day]}`;

      // Pass the element as an argument to the new marker
      return new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(this.map);
    });

    // update resort counter
    this.counterTarget.textContent = `${markers.length}`;

  };

  filter() {
    const value = event.target.dataset.value;
    const url = `/resorts.json?${value}`;
    fetch(url)
      .then(response => response.json())
      .then(markers => {
        this.placeMarkers(markers, 0);
      })
  };

  select() {
    console.log("you clicked a button");
    const controls = document.getElementById('map-slider-holder');
    controls.style.display = "none";
    const buttons = document.getElementsByClassName('map-button');
    Array.from(buttons).forEach(function (element) {
            element.classList.remove('selected');
          });
    event.target.classList.add('selected');
  };

  displayDay () {
    const slider = event.target;
    const day = slider.value;
    console.log(slider.value);
    const mapElement = document.getElementById('map');
    const markers = JSON.parse(mapElement.dataset.markers);
    this.placeMarkers(markers, day);
    const days = document.getElementsByClassName('day');
    Array.from(days).forEach(function (element) {
            element.classList.remove('active');
          });
    const redDay = days[day]
    redDay.classList.add('active');
  };

  timeMachine () {
    const buttons = document.getElementsByClassName('map-button');
    const otherButtons = Array.from(buttons)
    otherButtons.slice(0, 4).forEach(function (element) {
            element.classList.remove('selected');
          });
    event.target.classList.toggle('selected');
    const controls = document.getElementById('map-slider-holder');
    controls.style.display == "flex" ? controls.style.display = "none" : controls.style.display = "flex";
  };

  finalMapSetUp () {
    // Add controls to the map
    const searchBar = new MapboxGeocoder({
      accessToken: mapboxgl.accessToken,
      mapboxgl: mapboxgl
    });
    this.map.addControl(searchBar);

    const navControls = new mapboxgl.NavigationControl()
    this.map.addControl(navControls);

    const geoLocateButton = new mapboxgl.GeolocateControl({
        positionOptions: {enableHighAccuracy: true},
        trackUserLocation: true
      });
    this.map.addControl(geoLocateButton);

    // Hiding mapbox logos and copyrights.
    const mapBoxLogo = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-left > div > a");
    const mapBoxCopyright = document.querySelector("#map > div.mapboxgl-control-container > div.mapboxgl-ctrl-bottom-right");
    mapBoxLogo.classList.add('invisible');
    mapBoxCopyright.classList.add('invisible');
  };

};









  //   // tracking user zoom level
  //   const zoomThreshold = 7;

  //   this.map.on('zoom', () => {
  //     console.log(this.map.getZoom());
  //     if (this.map.getZoom() > zoomThreshold) {
  //       console.log('Below zoom level 7');
  //     } else {
  //       console.log('Above zoom level 7');
  //     }
  //   });
  //   console.log("inside controller");
  // };





