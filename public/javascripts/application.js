// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults

$(document).ready(function() {

  if ($('#map').length > 0) {
    var myLatlng = new google.maps.LatLng(-34.397, 150.644);
    var myOptions = {
      zoom: 6,
      center: myLatlng,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    }
    var map = new google.maps.Map($("#map")[0], myOptions);

    var infowindow = new google.maps.InfoWindow();

    marker_data = [
      new google.maps.LatLng(-34.397, 150.644),
      new google.maps.LatLng(-34.397, 151.644),
      new google.maps.LatLng(53.334153,-6.229248)
    ];

    var markers = [];
    $.each(marker_data, function(i, position) {
      marker = new google.maps.Marker({map: map, position: position});
      marker.infoWindowContent = $('#info' + i).html();
      google.maps.event.addListener(marker, 'click', function(e) {
        infowindow.content = this.infoWindowContent;
        infowindow.open(map, this);
      });

      markers.push(marker)
    });


    var travelMarker;

    function moveTravelMarker(latlng, panMap) {
      if (typeof(travelMarker) == 'undefined') {
        plane_image = new google.maps.MarkerImage("/images/plane_icon.png",
        new google.maps.Size(50, 37),
        new google.maps.Point(0, 0),
        new google.maps.Point(25, 19));
        travelMarker = new google.maps.Marker({map: map, position: latlng, icon: plane_image});
      } else {
        travelMarker.setPosition(latlng);
      }

      if (typeof(panMap) != 'undefined' && panMap == true) {
        map.panTo(latlng);
      }

    }

    $('a.next').live('click', function(e) {
      try {
        this_marker = markers[parseInt($(this).attr('href'))-1];

        next_marker = markers[parseInt($(this).attr('href'))];

        start_point = this_marker.getPosition();
        console.log(start_point);
        end_point = next_marker.getPosition();
        console.log(end_point);
        num_stops = 100;
        stops = [start_point];
        for(var i = 1; i < num_stops; i++) {
          console.log(i);
          stops[i] = new google.maps.LatLng(
              start_point.lat() + (((end_point.lat() - start_point.lat())*parseFloat(i))/parseFloat(num_stops)),
              start_point.lng() + (((end_point.lng() - start_point.lng())*parseFloat(i))/parseFloat(num_stops))
            );
        }
        stops[num_stops] = end_point;
        console.log(stops);

        frame_rate = 15;
        $.each(stops, function(i, stop) {
          setTimeout(moveTravelMarker, frame_rate*i, stop, true);
        });

        function openWindow(marker) {
          infowindow.content = marker.infoWindowContent;
          infowindow.open(map, marker);
        }
        setTimeout(openWindow, frame_rate*num_stops, next_marker);

      } catch(e) {
        console.log(e);
      }
      return false;
    });

    var path = new google.maps.Polyline({
      path: marker_data,
      strokeColor: "#FF0000",
      strokeOpacity: 1.0,
      strokeWeight: 2
    });

    path.setMap(map);
  }

});
