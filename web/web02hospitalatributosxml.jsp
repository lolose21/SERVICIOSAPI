
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/csstrono.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="includes/webhead.jsp"/>
        <title>Plantilla</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template" id="tablahospitales">
          <h1>HOSPITAL ATRIBUTOS XML</h1>
          <button type="button" id="botonhospitales" class="btn btn-success">
                CARGAR HOSPITALES
          </button>
          <table class="table table-dark" border="1">
              <thead>
                  <tr>
                      <th>NOMBRE</th>
                      <th>DIRECCION</th>
                      <th>TELEFONO</th>
                      <th>CAMAS</th>
                  </tr>
              </thead>
              <tbody style="background-color: blue">
                  
              </tbody>
          </table>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            $("#botonhospitales").click(function() {
                
                $.get("documents/hospital_atributos.xml", function(data) {
                    var hospitales = $(data).find("HOSPITAL");
                    var html = "";
                    hospitales.each(function() {
                        html += "<tr>";
                        html += "<td>" + $(this).attr("NOMBRE") + "</td>";
                        html += "<td style='color:red'>" + $(this).attr("DIRECCION") + "</td>";
                        html += "<td style='color:black'>" + $(this).attr("TELEFONO") + "</td>";
                        html += "<td>" + $(this).attr("NUM_CAMA") + "</td>";
                        html += "</tr>";
                    });
                    $("#tablahospitales tbody").html(html);
                });
            });
        });
        
    </script>
    </body>
</html>
