var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

var ip = "192.168.61.201";



function base() {
    var base_image = new Image();
    base_image.src = 'img/Plano.PNG';
    canvas.width = base_image.naturalWidth;
    canvas.height = base_image.naturalHeight;
    base_image.onload = function () {
        ctx.drawImage(base_image, 0, 0);
    }
}

function cargaDatos() {
    $.ajax('http://192.168.61.201/datos', {
        method: "GET",
        success: function (datos) {
            if ($(".elem")[0]) {
                $(".elem").empty();
            }
    $("#listaContenedores").append("<li class='elem'>Contenedor 1: Abierto " + datos.abierto + " Lleno " + datos.lleno +
        " <button class='encenderLed'>Encender</button><button class='apagarLed'>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 2: Abierto Sí Lleno No" +
        " <button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 3: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 4: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 5: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 6: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 7: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
    $("#listaContenedores").append("<li class='elem'>Contenedor 8: Abierto Sí Lleno No " +
        "<button>Encender</button><button>Apagar</button></li>");
        },
        error: function () {
            alert("Error al traer los datos");
        }
    });

}





$(function () {
    

    $('.encenderLed').click(function () {
        $.ajax('http://192.168.61.201/encenderLed', {
            method: "GET",
            success: function () {
                alert("Led Encendido");
            },
            error: function () {
                alert("No se puede encender el Led");
            }
        });
    });


    $('.apagarLed').click(function () {
        $.ajax('http://192.168.61.201/apagarLed', {
            method: "GET",
            success: function () {
                alert("Led apagado");
            },
            error: function () {
                alert("No se puede apagar el Led");
            }
        });
    });
    //Pa traer los datos de los contenedores
    setInterval(base,2000);
    setInterval(cargaDatos(), 7000);
});




