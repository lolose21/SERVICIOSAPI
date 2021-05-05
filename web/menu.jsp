<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
      
    <head>
        <link href="css/detallesmandalorian.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="includes/webhead.jsp"/>
        <title>Plantilla</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template" id="tabla">
          <h1>TABLA PERSONAS</h1>
          
          <button type="button" id="botontabla" class="btn btn-outline-warning">
              MOSTRAR TABLA
          </button>
         <table class="table table-dark" border="1">
              <thead>
                  <tr>
                      <th>EDAD</th>
                      <th>EMAIL</th>
                      <th>IDPERSONA</th>
                      <th>NOMBRE</th>
                      
                  </tr>
              </thead>
              <tbody style="background-color: blue">
                  
              </tbody>
              
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    </body>
    <script>
        $(document).ready(function() {

            $.ajax({
                url: "http://localhost:8084/ApiPersonas/api/personas",
                type:"GET",
                dataType:"xml",
                success: function(data) {
                     $("#botontabla").click(function() {
                    var  personas =$(data).find("persona");
                    
                    var html ="";
                    personas.each(function() {
                        var edad = $(this).find("edad").text();
                        var email = $(this).find("email").text();
                        var idpersona = $(this).find("idPersona").text();
                        var nombre = $(this).find("nombre").text();
                         html += "<tr>";
                        
                        html += "<td>" + edad + "</td>";
                        html += "<td>" + email + "</td>";
                        html += "<td>" + idpersona + "</td>";
                        html += "<td>" + nombre + "</td>";
                        
                         html += "</tr>";
                    });
                    
                    $("#tabla tbody").html(html);
                    });
                }
            });
            
        });
    </script>
</html>