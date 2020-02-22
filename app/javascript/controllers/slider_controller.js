
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output" ]

  connect = () => {
    navigator.geolocation.getCurrentPosition((position) => {
      const start = [position.coords.longitude, position.coords.latitude];
      // var end = [140.4017353, 38.1705275];
      var end = this.outputTarget.dataset.value.split(',');
      console.log(end);
      var key = 'pk.eyJ1IjoibnNraWJpYWsiLCJhIjoiY2s2a2Q5YjJvMDJ3YjNtcGI1ejAzemM3NCJ9.gSugKEHi4BDco9_-NYOmbg';
      var url = 'https://api.mapbox.com/directions/v5/mapbox/driving/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + key;
      fetch(url)
        .then(response => response.json())
        .then((data) => {
          const duration = ((data['routes'][0]['legs'][0]['duration'])/3600);
          this.outputTarget.textContent = `${duration.toFixed(2)} hours`;
        });
    });
  };

  displayChoice () {
    const slider = document.getElementById('hours-input');
    const sliderDisplay = document.getElementById('hours-output');
    sliderDisplay.value = slider.value;
  };


};

///////////////////////////////////////////////


//   getRoute(start) {
//     console.log("inside getRoute function");
//     // only the end or destination will change
//     var end = [140.4017353, 38.1705275];
//     var key = 'pk.eyJ1IjoibnNraWJpYWsiLCJhIjoiY2s2a2Q5YjJvMDJ3YjNtcGI1ejAzemM3NCJ9.gSugKEHi4BDco9_-NYOmbg';
//     var url = 'https://api.mapbox.com/directions/v5/mapbox/driving/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + key;

//     // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
//     var req = new XMLHttpRequest();
//     req.open('GET', url, true);
//     req.onload = function() {
//       var json = JSON.parse(req.response);
//       console.log(json);
//     };
//   };

// document.getElementById('submit').addEventListener('click', (event) => {
//   event.preventDefault();
//   fetch('https://api.github.com/orgs/lewagon/repos')
//     .then(response => response.json())
//     .then((data) => {
//       // Do something with the response
//     });
// });

//       // var data = json.routes[0];
//       // var route = data.geometry.coordinates;
//       // var geojson = {
//       //   type: 'Feature',
//       //   properties: {},
//       //   geometry: {
//       //     type: 'LineString',
//       //     coordinates: route
//       //   }
//       // };


//   getUserLocation = () => {
//     navigator.geolocation.getCurrentPosition((position) => {
//       console.log(position);
//       const userLocation = [position.coords.longitude, position.coords.latitude];
//       console.log(userLocation);
//       console.log(this);
//       getRoute(userLocation);
//     });
//   };

//   getRoute(start) {
//     console.log("inside getRoute function");
//     // only the end or destination will change
//     var end = [140.4017353, 38.1705275];
//     var key = 'pk.eyJ1IjoibnNraWJpYWsiLCJhIjoiY2s2a2Q5YjJvMDJ3YjNtcGI1ejAzemM3NCJ9.gSugKEHi4BDco9_-NYOmbg';
//     var url = 'https://api.mapbox.com/directions/v5/mapbox/driving/' + start[0] + ',' + start[1] + ';' + end[0] + ',' + end[1] + '?steps=true&geometries=geojson&access_token=' + key;

//     // make an XHR request https://developer.mozilla.org/en-US/docs/Web/API/XMLHttpRequest
//     var req = new XMLHttpRequest();
//     req.open('GET', url, true);
//     req.onload = function() {
//       var json = JSON.parse(req.response);
//       console.log(json);
//     };
//   };

