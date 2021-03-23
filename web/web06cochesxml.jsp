
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
          <h1>COCHES XML</h1>
          <select class="form-control" id="selectcoches"></select>
          <button type="button" class="btn btn-info"
                  id="botonbuscar">
                      Buscar
          </button>
          <div id="cocheseleccionado"></div>
          <ul id="vistacoches" class="list-group">
              
          </ul>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            cargarCoches();
            $.ajax({
                url:"documents/coches.xml",
                type:"GET",
                dataType:"xml",
                success:function (data){
                    
                    var  coches = $(data).find("coche");
                    var html ="";
                    coches.each(function() {
                       
                        var
                    });
                    var filtro = "idcoche:contains(" + coches + ")";
                    var select = $(data).find(filtro).parent().first();
                    
                    select.each(function() {
                       var num = $(this).attr("idcoche");
                        html += "<option value='" + num + "'>"
                        + num + "</option>";
                    });
                    $("#selectcoche").html(html);
                }
            });
        });
        function cargarCoches() {
            $.ajax({
                url:"documents/coches.xml",
                type:"GET"
                dataType:"xml"
                success:function (data){
                    var coches = $(data).find("idcoche");
                    var htm = "";
                    coches.each(function() {
                         var id=$(this).find("idecoche").text();
                        var marca = $(this).find("marca").text();
                        html += "<option value='" + id  "'>"
                        + marca +  "</option>";
                });
                    
                    $("#selectcoches").html(html);
                }
            });
        }
    </script>
    </body>
</html>