<%-- 
    Document   : insert_cartao
    Created on : 29/10/2015, 11:52:20
    Author     : rma19_000
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.sql.Connection"%>
<%@page import = "conexao.conexao"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Deletando...</title>
    </head>
    <body>
        <%
            //Abaixo, o código recebe o código enviado pela tela anterior e exclui tal item ta base de dados.
            int id = Integer.parseInt(request.getParameter("codigo"));
            
            //out.println(request.getParameter("estado"));
            
            Connection con = new conexao().getConnection();
            try{
                String sql = "DELETE FROM livro WHERE codigo = ?";
                PreparedStatement prepStmt = con.prepareStatement(sql);
                prepStmt.setInt(1, id);
                
                prepStmt.execute();
                
                prepStmt.close();
                System.out.println("completo");
                
                String redirectURL = "corpo.html";
                response.sendRedirect(redirectURL);
                
            } catch (Exception e){
                System.out.println(e);
            }
        %>
    </body>
</html>
