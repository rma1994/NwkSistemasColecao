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
        <title>JSP Page</title>
    </head>
    <!--Este bloco atualiza as informações do item selecionado, tendo como parametro o id recebido.
    Todas as informações necessarias para realizar esta atualização, devem ser enviadas pela tela anterior-->
    <body>
        <%
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome").trim();
            String usuario = request.getParameter("usuario").trim();
            
            //out.println(request.getParameter("estado"));
            
            Connection con = new conexao().getConnection();
            try{
                String sql = "UPDATE miniaturas "
                        + "SET nome = ?,"
                        + "usuario = ? "
                        + "WHERE codigo = ?";
                PreparedStatement prepStmt = con.prepareStatement(sql);
                prepStmt.setString(1, nome.toUpperCase());
                prepStmt.setString(2, usuario.toUpperCase());
                prepStmt.setInt(3, codigo);
                
                prepStmt.executeUpdate();
                
                prepStmt.close();
                System.out.println("completo");
                String redirectURL = "ConsultaMin.jsp";
                response.sendRedirect(redirectURL);
                
            } catch (Exception e){
                System.out.println(e);
            }
        %>
    </body>
</html>
