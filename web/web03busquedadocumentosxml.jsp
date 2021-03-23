
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link href="css/StrangerThings.css" rel="stylesheet" type="text/css"/>
        <jsp:include page="includes/webhead.jsp"/>
        <title>Plantilla</title>
    </head>
    <body>
        <jsp:include page="includes/webmenu.jsp"/>
    <main role="main" class="container">

        <div class="starter-template">
          <h1>BUSQUEDA DOCUMENTOS XML</h1>
          <label>INTRODUZCA CADIGO HOSPITAL</label>
          <input type="text" id="cajacodigo"
                 class="form-control"/>
          <button type="button" class="btn btn-info" id="botonhospitales">
              BUSCAR HOSPITALES
          </button>
          <hr/>
          <label>INTRODUZCA APELLIDO</label>
          <input type="text" id="cajaapellido"
                 class="form-control"/>
          <button type="button" class="btn btn-danger" id="botonempleados">
              BUSCAR EMPLEADOS TAG
          </button>
          <hr/>
          <div id="hospital"></div>
          <div id="empleados"></div>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    <script>
        $(document).ready(function() {
            $("#botonhospitales").click(function() {
                $.get("documents/hospital_atributos.xml" , function(data) {
                    //dentro de estos datos, queremos extraer lo que
                    //sean de un determinado hospital
                    var codigo = $("#cajacodigo").val();
                    var filtro = "HOSPITAL[HOSPITAL_COD=" + codigo + "]";
                    //debemos buscar dentro de data cos find()
                    //recordemos que siempre que buscamos , aunque sea
                    //solo 1, devuelve un conjunto
                    var hospitales = $(data).find(filtro);
                    if(hospitales.length === 0){
                        $("#hospital").html("<h1 style='color:red'> NO EXISTEN HOSPITALES</h1>");
                    }else{
                        var hospital = hospitales.first();
                        $("#hospital").html("<h1 style='color:blue'>Nombre:"
                                + hospital.attr("NOMBRE")
                                + ", Direccion: "
                                + hospital.attr("DIRECCION")
                                + "</h1>");
                    }
                });
            });
            $("#botonempleados").click(function() {
                //nueva teoria  :ajax
                $.ajax({
                   url:"documents/empleados.xml",
                   method:"GET",
                   datatype:"xml", 
                   success:function (data){
                       var ape = $("#cajaapellido").val();
                       var filtro = "APELLIDO:contains(" + ape + ")";
                       var empleados = $(data).find(filtro);
                       var html = "";
                       empleados.each(function() {
                           html += "<h1 style='color:red'>" + $(this).text() + "</h1>";
                    });
                    $("#empleados").html(html);
                   }
                });
            });
        });
    </script>
    </body>
</html>
