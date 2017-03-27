$(document).ready(function(){
  var longitude = $('.longitude').find('.item-content').text()
  var latitude = $('.latitude').find('.item-content').text()
  var map = L.map('maps', { center: new L.LatLng(0,0), zoom: 15})
  L.tileLayer('http://{s}.tile.osm.org/{z}/{x}/{y}.png', {
    attribution: '&copy; <a href="http://osm.org/copyright">OpenStreetMap</a> contributors'
  }).addTo(map);

  L.marker([longitude, latitude]).addTo(map)
      .bindPopup($('.name').find('.item-content').text())
      .openPopup();
})
