import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]

  map = null;
  start = null;

  connect() {
    navigator.geolocation.getCurrentPosition((position) => {
      this.start = [position.coords.latitude,position.coords.longitude];
      console.log(this.start);
    });
  }

  initMap() {
    var directionsService = new google.maps.DirectionsService();
    var directionsRenderer = new google.maps.DirectionsRenderer();
    this.map = new google.maps.Map(document.getElementById('itinerary-map'), {
      zoom: 7,
      center: {lat: 35.7, lng: 139.73},
      disableDefaultUI: true
    });
    directionsRenderer.setMap(this.map);
    directionsRenderer.setPanel(document.getElementById('right-panel'));
    this.calculateAndDisplayRoute(directionsService, directionsRenderer);
  }

  calculateAndDisplayRoute(directionsService, directionsRenderer) {
    const data = document.getElementById('itinerary-map');
    const markers = JSON.parse(data.dataset.markers);
    const end = [markers.latitude,markers.longitude];
    var origin = {lat: 35.694307, lng: 139.7387831}
    var destination = {lat: markers.latitude, lng: markers.longitude}
    var marker = new google.maps.Marker({position: origin, map: this.map});
    var markerTwo = new google.maps.Marker({position: destination, map: this.map});
    directionsService.route(
        {
          origin,
          destination,
          travelMode: 'DRIVING'
        },
        function(response, status) {
          console.log(response);
          if (status === 'OK') {
            directionsRenderer.setDirections(response);
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
  }

  googleLink() {
    const markers = JSON.parse(event.target.dataset.markers);
    const end = [markers.latitude,markers.longitude];
    const url = `https://www.google.com/maps/dir/${this.start[0]},${this.start[1]}/${end[0]},${end[1]}/`;
    window.location.href = url;
  };

}
