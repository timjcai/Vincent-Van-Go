import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="map"
export default class extends Controller {
  static values = {
    markers: Array,
    center: Array,
    apiKey: String
  }

  connect() {
    console.log(this.markersValue)
    mapboxgl.accessToken = this.apiKeyValue

    if (this.hasCenterValue) {
      this.map = new mapboxgl.Map({
        container: this.element,
        center: this.centerValue,
        zoom: 10,
        style: "mapbox://styles/georgekettle/cleow2ltz000001qp1430ze85",
        // style: 'mapbox://styles/mapbox/satellite-streets-v12',
        pitch: 80,
      })
    } else {
      this.map = new mapboxgl.Map({
        container: this.element,
        style: "mapbox://styles/georgekettle/cleow2ltz000001qp1430ze85",
        // style: 'mapbox://styles/mapbox/satellite-streets-v12',
        pitch: 80,
      })
    }

    this.map.addControl(
      new mapboxgl.NavigationControl());

    this.addMarkersToMap()
    this.#fitMapToMarkers()
  }

  addMarkersToMap() {
    this.markersValue.forEach(listing => {
      const popup = new mapboxgl.Popup({ offset: 25, closeOnMove: true })
                                .setHTML(listing.info_window_html)
      const center = [listing.lng, listing.lat]

      // Create a HTML element for your custom marker
      const customMarker = document.createElement("div")
      customMarker.innerHTML = listing.marker_html

      new mapboxgl.Marker(customMarker)
        .setLngLat(center)
        .setPopup(popup) // sets a popup on this marker
        .addTo(this.map);
    });
  }

  #fitMapToMarkers() {
    const bounds = new mapboxgl.LngLatBounds()
    this.markersValue.forEach(marker => bounds.extend([ marker.lng, marker.lat ]))
    this.map.fitBounds(bounds, { padding: 150, maxZoom: 15, duration: 0 })
  }
}
