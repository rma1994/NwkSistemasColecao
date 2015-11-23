<%-- 
    Document   : itemDuplicado
    Created on : 23/11/2015, 14:10:20
    Author     : rma19_000
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h2>
            <%
                String codigo = request.getParameter("codigo");
                out.println("Item já cadastrado sob o código " + codigo);
                
                /*String redirectURL = "corpo.html";
                response.sendRedirect(redirectURL);
                response.wait(3000);*/
            %>
        </h2>
    </body>
</html>
