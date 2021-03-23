
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
          <h1>DEPARTAMENTOS XML</h1>
          <select class="form-control" id="selectdepartamentos"></select>
          <button type="button" class="btn btn-info"
                  id="botonbuscar">
                      BUSCAR DEPARTAMENTO
          </button>
          <div id="departamento"></div>
                  
          <ul class="list-group" id="departamentos">
              
          </ul>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    </body>
    <script>
        $(document).ready(function() {
            cargarDepartamentos();
            $.ajax({
                url: "documents/departamentosatributos.xml",
                type: "GET",
                dataType:"xml",
                success:function (data){
                    
                    var departamentos = $(data).find("DEPT");
                    var html ="";
                    departamentos.each(function() {
                        var num = $(this).attr("DEPT_NO");
                        html += "<option value='" + num
                        + "'>" + num + "</option>";
                        
                    });
                    $("#selectdepartamentos").html(html);
                    
                }
                
            });
            $("#botonbuscar").click(function() {
                var numero =$("#selectdepartamentos").val();
                var filtro = "DEPT[DEPT_NO=" + numero + "]";
                console.log(("muestra si estas dentro"));
                $.ajax({
                    url:"documents/departamentosatributos.xml",
                    type: "GET",
                    dataType:"xml",
                    success: function(data) {
                        var departamento = $(data).find(filtro).first();
                        var nombre = $(departamento).find("DNOMBRE").text();
                        var localidad = $(departamento).find("LOC").text();
                        $("#departamento").html("<h1 style='color:blue'>"
                                + nombre + " , " + localidad + "</h1>");
                    }
                });
            });
        });
        
        function cargarDepartamentos() {
            $.ajax({
                url:"documents/departamentosatributos.xml",
                type: "GET",
                dataType:"xml",
                success:function (data){
                    console.log("dentro se success");
                    var departamentos = $(data).find("DEPT");
                    var html = "";
                    departamentos.each(function() {
                        var nombre = $(this).find("DNOMBRE").text();
                        var localidad = $(this).find("LOC").text();
                        html += "<li class='list-group-item'>"
                        + nombre + " , " + localidad + "</li>";
                    });
                    $("#departamentos").html(html);
                }
                
            });
    }
    </script>
</html>