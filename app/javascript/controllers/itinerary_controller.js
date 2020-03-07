import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ 'travelers' ]

  map = null;
  start = null;
  distance = null;

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
          window.geo = response;
          if (status === 'OK') {
            directionsRenderer.setDirections(response);
            var kmDisplay = document.getElementById('km-display');
            this.distance = `${geo.routes[0].legs[0].distance.text}`;
            kmDisplay.textContent = this.distance;
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

  formatNumber(num) {
    return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1,')
  }

  changeInput() {
    var kmDisplay = document.getElementById('km-display');
    var distanceStr = kmDisplay.textContent.slice(0, -2).replace(",", "");
    var distanceNum = parseInt(distanceStr);
    var fuelCostDisplay = document.getElementById('km-cost');
    var fuelCost = (distanceNum * 31);
    var fuelCostStr = this.formatNumber(fuelCost);

    var price = parseFloat(document.getElementById('resort-price').textContent);
    var travelers = document.getElementById('travelers');
    var days = document.getElementById('days');
    var liftCost = (price * (travelers.value * days.value));
    var liftCostStr = this.formatNumber(liftCost);

    var travelDisplay = document.getElementById('travelers-display');
    var travelDisplayTotal = document.getElementById('travelers-display-total');

    var grandTotal = (liftCost + fuelCost);
    var grandTotalStr = this.formatNumber(grandTotal);
    var perPersonCost = ( Math.round(grandTotal / travelers.value) );
    var perPersonCostStr = this.formatNumber(perPersonCost);

    var grandTotalDisplay = document.getElementById('grand-total-cost');
    var perPersonCostDisplay = document.getElementById('per-person-cost');

    ((travelers.value + days.value) > 1) ? travelDisplay.textContent = `${travelers.value * days.value}` : travelDisplay.textContent = "";
    travelDisplayTotal.textContent = `${liftCostStr}`;
    fuelCostDisplay.textContent = `${fuelCostStr}`;
    grandTotalDisplay.textContent = `${grandTotalStr}`;
    perPersonCostDisplay.textContent = `${perPersonCostStr}`;

  };
}
