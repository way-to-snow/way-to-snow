
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "output", "heart", "count" ]

  favorited = false;

  connect = () => {
    this.favorited = this.heartTarget.dataset.favorited === "true";
    console.log(this.favorited);
    navigator.geolocation.getCurrentPosition((position) => {
      const start = [position.coords.longitude, position.coords.latitude];
      var end = this.outputTarget.dataset.value.split(',');
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

  favorite () {
    const resortId = event.target.dataset.value;
    const url = `resorts/${resortId}/favorites${this.favorited ? '/delete' : ''}`;
    console.log(this.favorited);
    fetch(url)
        .then(response => response.json())
        .then(res => {
          this.favorited = !!res.favorite
          if (this.favorited) {
            this.heartTarget.classList.add("red");
          } else {
            this.heartTarget.classList.remove("red");
          }
            this.countTarget.textContent = res.count;
        })
  };

  // displayChoice () {
  //   const slider = document.getElementById('hours-input');
  //   const sliderDisplay = document.getElementById('hours-output');
  //   sliderDisplay.value = slider.value;
  // };


};


