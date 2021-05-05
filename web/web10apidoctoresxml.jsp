
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
          <h1>API DOCTORES</h1>
         
          <label>Introduzca salario</label>
          <input type="text" id="cajasalario"
                 class="form-control"/>
          <button type="button" id="botonbuscar" class="btn btn-info">
              BUSCAR DOCTORES
          </button>
          <hr/>
          <table class="table table-info" id="tabladoctor"> 
              <thead>
                  <tr>
                      <th>APELLIDO</th>
                      <th>ESPECIALIDAD</th>
                      <th>SALARIO</th>
                      <th>HOSPITAL</th>
                  </tr>
              </thead>
              <tbody>
                  
              </tbody>
          </table>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        var url = "https://apidoctoresisma.azurewebsites.net/";
        $(document).ready(function(data) {
            cargarDoctores();
            $("#botonbuscar").click(function() {
                var request = "api/doctores/buscarsalario/";
                var salario = $("#cajasalario").val();
                $.ajax({
                    url: url + request + salario,
                    type: "GET" ,
                    dataType: "xml",
                    success:function (data){
                        var doctores = $(data).find("doctor");
                        var html = "";
                        doctores.each(function() {
                            html += "<tr>";
                        html += "<td>" + $(this).find("apellido").text() + "</td>";
                        html += "<td>" + $(this).find("especialidad").text() + "</td>";
                        html += "<td>" + $(this).find("salario").text() + "</td>";
                        html += "<td>" + $(this).find("hospital").text() + "</td>";
                        html += "</tr>";
                        });
                        $("#tabladoctor tbody").html(html);
                    }
                    
                });
            });
        });
        function cargarDoctores() {
            var request = "api/doctores";
        $.ajax({
                url: url + request,
                type: "GET",
                dataType:"xml",
                success:function(data){
                    var doctores = $(data).find("doctor");
                    var html = "";
                    doctores.each(function() {
                        html += "<tr>";
                        html += "<td>" + $(this).find("apellido").text() + "</td>";
                        html += "<td>" + $(this).find("especialidad").text() + "</td>";
                        html += "<td>" + $(this).find("salario").text() + "</td>";
                        html += "<td>" + $(this).find("hospital").text() + "</td>";
                        html += "</tr>";
                    });
                    $("#tabladoctor tbody").html(html);
                }
            });
        }
    </script>

    </body>
</html>
