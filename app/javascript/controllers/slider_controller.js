
import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ ]


  connect() {
    console.log('hello again');
  };

  displayChoice () {
    const slider = document.getElementById('hours-input');
    const sliderDisplay = document.getElementById('hours-output');
    sliderDisplay.value = slider.value;
  };

};
