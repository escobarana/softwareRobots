let map;
let marker;
let infoWindow = null;

//developers.google.com/maps/documentation/javascript/examples/map-simple#maps_map_simple-javascript

let latitudOvi = 43.354778 ;
let longitudOvi = -5.851037 ;

function initMap() {
    map =  new google.maps.Map(document.getElementById("map"), {
      center: { lat: latitudOvi, lng: longitudOvi },
      zoom: 10,
    });
  }

  function anadirMarcadorDatos(map, datos){
    marker = new google.maps.Marker({
      position: {
          lat: latitudOvi, lng: longitudOvi
      },
      map: map,
      title: 'Sensor de la EII'
  });

  infowindow = new google.maps.InfoWindow({
    content:
    '<font style="color:#000;"> Temperatura: ' + datos.temperatura + "</font><br />" +
    '<font style="color:#000;"> Humedad: ' + datos.humedad + "</font><br /><br />"
    });

  marker.addListener("click", () => {
    infowindow.open(map, marker);
  });

  return marker;

  }

  function main() {
    var ips = ["192.168.61.201"];
    ips.forEach(function(ip) {
      $.ajax("http://" + ip +"/datos", {
        method: "GET",
        success: function(data) {
          marker = anadirMarcadorDatos(map, data);
          if (data.temperatura > 20)
            console.log("Alerta de temperatura");
        },
        error: function () {
          alert("No se pueden obtener los datos");
        }
      });          
    });
  }

  $(function() { 
    initMap();
    $("#encenderLed").click(function() {
      $.ajax('http://192.168.61.201/encenderLed', {
        method: "GET",
        success: function() {
          alert("Led Encendido");
        },
        error: function () {
          alert("No se puede encender el Led");
        }
      });
    });
    $("#apagarLed").click(function() {
      $.ajax('http://192.168.61.201/apagarLed', {
        method: "GET",
        success: function() {
          alert("Led Apagado");
        },
        error: function () {
          alert("No se puede apagar el Led");
        }
      });
    });

    //Pa traer los datos y cargar el marcador
    setInterval(main, 7000);
  });