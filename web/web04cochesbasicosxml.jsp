<!--
web04cochesbasicosxml.jsp
    Cargar los coches de 2 formas: (2 botones)
        Get
        Ajax
    Versión:
    Incluir una caja para buscar por Marca
-->
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
          <h1>Coches clasicos</h1>
          <label>MARCA : COCHE</label>
          <input type="text" id="cajacoche" class="form-control"/>
          <button type="button" class="btn btn-danger" id="botoncoches">
              BUSCAR COCHE
          </button>
          <hr/>
          <label>INTRODUZCA UN COCHE</label>
          <input  type="text" id="cajaclasico" class="form-control"/>
          <button type="button" class="btn btn-dark" id="botonclasicos">
              BUSCAR COCHES
          </button>
          <hr/>
          <div id="coche"></div>
          <div id="clasicos"></div>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            $("#botoncoches").click(function() {
                $.get("documents/coches_basicos.xml", 
                function(data) {
                    console.log(("muestra si estas dentro"));
                  var nombre = $("#cajacoche").val();
                  var filtro ="MARCA:contains(" + nombre + ")";
                  var coches = $(data).find(filtro);
                 
                  if(coches.length === 0){
                      $("#coche").html("<h1 style='color:red'>NO EXISTE EL COCHE</h1>");
                      
                  }else{
                      
                      $("#coche").html(html);
                  }
            });
        });
        $("#botonclasicos").click(function() {
            $.ajax({
                url:"documents/coches_basicos.xml",
                method:"GET",
                datatype:"xml",
                success:function (data){
                    var coche = $("#cajaclasico").val();
                    var filtro = "MARCA:contains(" + coche + ")";
                    var clasicos = $(data).find(filtro);
                    var html = "";
                    clasicos.each(function() {
                        html += "<h1 style='color:red'>" + $(this).text() + "</h1>";
                    });
                    $("#clasicos").html(html);
                }
            });
        });
    });
    </script>
    </body>
</html>
