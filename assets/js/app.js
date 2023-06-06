$(document).foundation();

$('#coops-view-tabs').on('change.zf.tabs', function() {
      window.app.createMapMultiMarker('map-coops', 54.7, -4.2, 6, window.app.mapEntries);
});

var elem = new Foundation.Sticky($('.top-bar'));
var app = window.app || {};

var mapboxAccessToken = window.mapboxAccessToken || '';

app.apiUrl = 'https://api.mapbox.com/styles/v1/{id}/tiles/{z}/{x}/{y}?access_token=' + mapboxAccessToken;

app.tileLayerOptions = {
    maxZoom: 18,
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, ' + '<a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, ' + 'Imagery © <a href="http://mapbox.com">Mapbox</a>',
    id: 'mapbox/streets-v12',
    token: window.mapboxAccessToken
};

app.map = null;

app.createMap = function(mapId, lat, lng, zoom) {
  window.app.map = L.map(mapId).setView([lat, lng], zoom);
}

app.createMapSingleMarker = function(mapId, lat, lng, zoom, markerText) {
    if (!window.app.map) {
        window.app.createMap(mapId, lat, lng, zoom);
        var myMap = window.app.map;

        L.tileLayer(window.app.apiUrl, window.app.tileLayerOptions).addTo(myMap);

        var marker = L.marker([lat - 0.0005, lng]).addTo(myMap);
        marker.bindPopup(markerText).openPopup();
    }
    return window.app.map;
}

app.createMapMultiMarker = function(mapId, lat, lng, zoom, markersArray) {
  if (!window.app.map) {
      window.app.createMap(mapId, lat, lng, zoom);
      var myMap = window.app.map;

      L.tileLayer(window.app.apiUrl, window.app.tileLayerOptions).addTo(myMap);

      markersArray.forEach(function (markerVar) {
          var marker = L.marker([markerVar.lat, markerVar.lng]).addTo(myMap);
          marker.bindPopup(markerVar.markerText);
      });
  }
  return window.app.map;
};

//# sourceMappingURL=app.js.map
$('#client-list .column').shuffle();
window.setInterval(function(){
    /// call your function here
    $('#client-list .column').shuffle();
}, 7000);
