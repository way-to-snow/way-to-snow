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
  resortCounter = 0;

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

    this.placeMarkers(markers, 0, ['great', 'good', 'average', 'bad']);
    this.finalMapSetUp();

  };

  placeMarkers(markers, day, conditions) {
// you're getting 0,1,2,3 -- but you also want an array of conditions...
    // Clear any existing markers
    this.currentMarkers.forEach((marker) => {
      marker.remove();
    });

    this.resortCounter = 0;

    // Placing new markers on the map
    this.currentMarkers = markers.map((marker) => {
      const popup = new mapboxgl.Popup().setHTML(marker.infoWindow);
      const element = document.createElement('div');
      const dailyCondition = marker.conditions[day];
      const visibility = conditions.includes(dailyCondition) ? '' : 'invisible'
      element.className = `marker ${dailyCondition} ${visibility}`;
      if (visibility == "") { this.resortCounter += 1 };
      // Resort.conditons returns an array like this --> ["great", "bad", "average", "bad"]
      // Pass the element as an argument to the new marker
      return new mapboxgl.Marker(element)
        .setLngLat([ marker.lng, marker.lat ])
        .setPopup(popup) // add this
        .addTo(this.map);
    });

    // update resort counter
    this.counterTarget.textContent = `${this.resortCounter}`;

  };

  filter() {
    const value = event.target.dataset.value;
    const url = `/resorts.json?${value}`;
    fetch(url)
      .then(response => response.json())
      .then(markers => {
        this.placeMarkers(markers, 0, ['great', 'good', 'average', 'bad']);
      })
  };

  select() {
    console.log("you clicked a button");
    const controls = document.getElementById('map-slider-holder');
    controls.style.display = "none";
    const buttons = document.getElementsByClassName('map-button');
    this.resetSlider();
    Array.from(buttons).forEach(function (element) {
            element.classList.remove('selected');
          });
    event.target.classList.add('selected');
  };

  resetSlider() {
    const slider = document.getElementById('slider');
    slider.value = 0;
    const daysOnSlider = document.getElementsByClassName('day');
    Array.from(daysOnSlider).forEach(function (element) {
            element.classList.remove('active');
          });
    daysOnSlider[0].classList.add('active');
    const checkBoxes = document.getElementsByClassName('form-check-input');
    for(var i=0; i<checkBoxes.length; i++){
      checkBoxes[i].checked=false;
    };
  }

  changeDay () {
    const slider = event.target;
    const day = slider.value;
    console.log(slider.value);
    const mapElement = document.getElementById('map');
    const markers = JSON.parse(mapElement.dataset.markers);
    this.placeMarkers(markers, day, ['great', 'good', 'average', 'bad']);
    const dayRange = document.getElementsByClassName('day');
    Array.from(dayRange).forEach(function (element) {
            element.classList.remove('active');
          });
    const selectedDay = dayRange[day]
    selectedDay.classList.add('active');
    var checkBoxes = document.getElementsByClassName('form-check-input');
    for(var i=0; i<checkBoxes.length; i++){
      checkBoxes[i].checked = false;
    };
  };

  exposeSlider () {
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

  newFilter () {
    const checkBoxes = document.getElementsByClassName('form-check-input');
    var selectedConditions = [];
    for(var i=0; i<checkBoxes.length; i++){
      if(checkBoxes[i].type=='checkbox' && checkBoxes[i].checked==true)
        selectedConditions.push(checkBoxes[i].value);
    };
    const selectedDay = document.getElementById('slider').value;
    const mapElement = document.getElementById('map');
    const markers = JSON.parse(mapElement.dataset.markers);
    this.placeMarkers(markers, selectedDay, selectedConditions);
  }

};



