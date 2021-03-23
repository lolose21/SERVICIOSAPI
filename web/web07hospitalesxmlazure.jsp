
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
          <h1>HOSPITALES AZURE</h1>
          <label>ID HOSPITAL</label>
          <input type="text" id="cajahospital"
                 class="form-control"/>
          <button type="button" class="btn btn-info" id="botonbuscarhospital">
              BUSCAR HOSPITAL
          </button>
          <table class="table table-info" id="tablahospitales">
              <thead>
                  <tr>
                      <th>NOMBRE</th>
                       <th>DIRECCION</th>
                        <th>TELEFONO</th>
                         <th>CAMAS</th>
                  </tr>
              </thead>
              <tbody>
                  
              </tbody>
          </table>
          <div id="hospital"></div>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url="https://apihospitalesxml.azurewebsites.net/";
        $(document).ready(function() {
        //las peticiones seguiran siendo mediante url
        //pero la url suele ser la miswma para todas las peticiones
        //lo que cambia es el request,es decir, los datos que
        //deseamos recuperar.
        $.ajax({
                url:url + "api/hospitales",
                type:"GET",
                dataType:"xml",
                success:function (data){
                    var hospitales = $(data).find("Hospital");
                    var html = "";
                    hospitales.each(function() {
                        var nombre = $(this).find("Nombre").text();
                        var direccion =$(this).find("Direccion").text();
                        var tlf = $(this).find("Telefono").text();
                        var camas = $(this).find("Camas").text();
                        html += "<tr>";
                        html += "<td>" + nombre + "</td>";
                        html += "<td>" + direccion + "</td>";
                        html += "<td>" + tlf + "</td>";
                        html += "<td>" + camas + "</td>";
                        html += "</tr>";
                    });
                    $("#tablahospitales tbody").html(html);
                }
            });
            $("#botonbuscarhospital").click(function() {
                var id = $("#cajahospital").val();
                //antes , hemos estado leyendo todos los datos de los 
                //elementos , buscando coincidencias.
                //eso no esta mal , pero en los servicios (si lo tienen)
                //suelen existir metodos de busqueda
                //si lo tienen , lo mejor
                var request = "api/hospitales/" + id;
                $.ajax({
                    url:url + request,
                    type:"GET",
                    dataType:"xml",
                    success:function (data){
                        var hospital = $(data).find("Hospital").first();
                        var html = "<h1 style='color:red'>"
                        + $(hospital).find("Nombre").text()
                        + " , "
                        + $(hospital).find("Direccion").text()
                        + "</h1>";
                        $("#hospital").html(html);
                    }
                    
                });
            });
        });
    </script>
    </body>
</html>
