
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
          <h1>DOCTORES ESPECIALIDAD</h1>
          <ul class="list-group" id="especialidades"></ul>
          <hr/>
          <ul class="list-group" id="doctores"></ul>
         </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "https://apihospitalesxml.azurewebsites.net/";
        $(document).ready(function() {
            $.ajax({
                url: url + "api/especialidades",
                type: "GET",
                dataType:"xml",
                success: function(data) {
                    var espes = $(data).find("string");
                    espes.each(function() {
                        var espe = $(this).text();
                        //creamos objetos dinamicos, no html
                        var li = $("<li>");
                        li.addClass("list-group-item");
                        //añadimos cada <li> a el <ul> de especialidades
                        $("#especialidades").append(li);
                        var boton =$("<button>");
                        boton.addClass("btn btn-info");
                        boton.text(espe);
                        //añadimos un evento al boton dinamico
                        boton.click(function() {
                           var es = $(this).text();
                           cargarDoctoresEspecialidad(es);
                        });
                        li.append(boton);
                    });
                }
            });
        });
        function cargarDoctoresEspecialidad(especialidad) {
            var request = "api/doctoresespecialidad/" + especialidad;
            $.ajax({
                url : url + request,
                type:"GET",
                dataType: "xml",
                success: function(data) {
                    var doctores = $(data).find("Doctor");
                    var html = "";
                    doctores.each(function() {
                        var ape = $(this).find("Apellido").text();
                        html += "<li class='list-group-item list-group-item-warning'>"
                        + ape + "</li>";
                    });
                    $("#doctores").html(html);
                }
            });
        } 
    </script>
    </body>
</html>

