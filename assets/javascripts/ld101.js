/*
Linked Data 101 Part 4. Polaris / Sparql

Leaflet map
*/
var markers = [
    {"label":"Cheshire Fields", "long":-0.038715, "lat":51.576236},
	{"label":"Chestnuts Farm", "long":-0.014994, "lat":51.592189},
	{"label":"Forest Road", "long":0.005339, "lat":51.591496},
	{"label":"Hale End Road", "long":-0.000226, "lat":51.596406},
	{"label":"Higham Hill Common", "long":-0.02978, "lat":51.593777},
	{"label":"Honeybone", "long":-0.033135, "lat":51.577039},
	{"label":"Low Hall Farm", "long":-0.033687, "lat":51.571343},
	{"label":"Low Hall Lane", "long":-0.032928, "lat":51.576619},
	{"label":"Markhouse Common", "long":-0.026112, "lat":51.576161},
	{"label":"Sinnott Road", "long":-0.041737, "lat":51.598899},
	{"label":"Trencherfield", "long":-0.040005, "lat":51.596741},
	{"label":"Willow Tree", "long":-0.018091, "lat":51.605109}
];

var map = L.map('map').setView([51.58693, -0.04], 12);

var tiles = L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
	maxZoom: 19,
	attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);

for(var i = 0; i < markers.length; i++) {
	var m = markers[i];
	var marker = L.marker([m.long, m.lat]).addTo(map);
    marker.bindPopup(m.label);
}
        