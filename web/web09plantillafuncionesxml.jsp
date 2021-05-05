
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <jsp:include page="includes/webhead.jsp"/>
        <title>Plantilla</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>PLANTILLA FUNCIONES XML</h1>
          <ul class="list-group-item-dark" id="funciones"></ul>
          <hr/>
          <ul class="list-group-item-danger" id="plantillas"></ul>
          <div id="detallesplantilla"></div>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "https://apihospitalesxml.azurewebsites.net/";
        $(document).ready(function() {
            $.ajax({
                url: url + "api/funciones",
                type: "GET",
                dataType:"xml",
                success: function (data){
                    var funciones =  $(data).find("string");
                    funciones.each(function() {
                        var  funcion = $(this).text();
                        var li = $("<li>");
                        li.addClass("list-group-item");
                        $("#funciones").append(li);
                        var boton = $("<button>");
                        boton.addClass("btn btn-info");
                        boton.text(funcion);
                        boton.click(function() {
                            var fun = $(this).text();
                            cargarPlantillaFuncion(fun);

                        });
                        li.append(boton);
                    });
                }
            });
        });
        function cargarPlantillaFuncion(funcion) {
            $("#plantillas").html("");
            var request ="api/Plantillafuncion/" + funcion;
            $.ajax({
                url: url + request ,
                type:"GET",
                dataType:"xml",
                success: function(data) {
                    var plantillas = $(data).find("Plantilla");
                    plantillas.each(function() {
                        var ape = $(this).find("Apellido").text();
                        var idplantilla = $(this).find("IdPlantilla").text();
                        var li =$("<li>");
                        li.addClass("list-group-item list-group-item-warning");
                        $("#plantillas").append(li);
                        var boton = $("<button>");
                        boton.text("DETALLES" + ape);
                        boton.val(idplantilla);
                        boton.addClass("btn btn-danger");
                        boton.click(function() {
                            var id = $(this).val();
                            cargarDetallesPlantilla(id);
                        });
                        li.append(boton);
                    });
                }
                
            });
        }
        function cargarDetallesPlantilla(idplantilla){
            var request = "api/plantilla/" + idplantilla;
            $.ajax({
                url: url + request ,
                type: "GET",
                dataType:"xml",
                success: function(data) {
                    var ape = $(data).find("Apellido").text();
                    var funcion = $(data).find("Funcion").text();
                    var salario = $(data).find("Salario").text();
                    var turno = $(data).find("Turno").text();
                    var html = "<h1>" + ape + ", Funtion: " + funcion + "</h1>";
                     html += "<h2>Salario" + salario + "</h2>";
                     html += "<h2>Turno" + turno + "</h2>";
                    $("#detallesplantilla").html(html);
                }

            });
        }
        
        
    </script>
    </body>
</html>
