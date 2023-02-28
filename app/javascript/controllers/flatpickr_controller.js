import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  static values = {
    disabledDates: {
      default: [],
      type: Array
    }
  }
  connect() {
    console.log('hello')
    flatpickr(this.element, {
      mode: "range",
      minDate: "today",
      dateFormat: "Y-m-d",
      disable: this.disabledDatesValue
    });
  }
}
