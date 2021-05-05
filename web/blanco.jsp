
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

        <div class="starter-template" id="tablacoches">
          <h1>practicas libres</h1>
          <ul class="list list-group-item-light" id="coches"></ul>
          <table class="table table-dark" border="1">
              <thead>
                  <tr>
                      <th>MARCA</th>
                      <th>MODELO</th>
                      <th>IMAGEN</th>
                      <th></th>
                  </tr>
              </thead>
              <tbody>
                  <td id="coches" style="background-color: blue"></td>
              </tbody>
          </table>
        </div>
    </main><!-- /.container -->
    <jsp:include page="includes/webfooter.jsp"/>
    </body>
    <script>
        $(document).ready(function() {
            console.log("1 funcion , document");
            $.ajax({
                url:"documents/coches.xml",
                type:"GET",
                dataType:"xml",
                success:function (data){
                    console.log("2 funcion ajax");
                    var coches =$(data).find("string");
                    coches.each(function() {
                        console.log("3 funcion ");
                        var marca = $(this).text();
                        var tr = $("<td>");
                        $("#coches").append(td);
                        var boton = $("<button>");
                        boton.addClass("btn btn-dark");
                        boton.text(marca);
                        boton.click(function() {
                            console.log("4 funcion boton");
                            var html="";
                             console.log(" contenido");
                        html += "<tr>";
                        
                        html += "<td id='coches'> " + $(this).attr("marca") + "</td>";
                        html += "<tr>";
                        });
                        tr.append(boton);
                         $("#tablacoches tbody").html(html);
                    });
                    
                    
                }
            });
        });
    </script>
</html>
