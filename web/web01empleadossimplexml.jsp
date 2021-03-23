

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
          <h1>Acceso a objetos JQUERY</h1>
          <button type="button" class="btn btn-info" id="botoncargar">
              CARGR EMPLEADOS
          </button>
          <ul class="list-group" id="listaempleados">
              
          </ul>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            $("#botoncargar").click(function() {
                //comenzamos la lectura del documento
                $.get("documents/empleados.xml" , function(data) {
                    //data es el documento xml
                    var apellidos = $(data).find("APELLIDO");
                    //para recorrer todos los apellidos , se utilizan bucles each
                    var html = "";
                    apellidos.each(function() {
                        //this hace referencia a cada etiqueta xml
                        //del documento , debemos recuperar su contenido con text()
                        var apellido = $(this).text();
                        html += "<li class='list-group-item'>" + apellido + "</li>";
                    });
                    $("#listaempleados").html(html);
                });
            });
        });
    </script>
    </body>
</html>
