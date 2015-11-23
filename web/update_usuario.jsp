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
    <body>
        <%
            int codigo = Integer.parseInt(request.getParameter("codigo"));
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            if(!senha.equals("") && senha!=null){
                Connection con = new conexao().getConnection();
                try{
                    String sql = "UPDATE usuario "
                            + "SET nome = ?,"
                            + "senha = ? "
                            + "WHERE codigo = ?";
                    PreparedStatement prepStmt = con.prepareStatement(sql);
                    prepStmt.setString(1, nome);
                    prepStmt.setString(2, senha);
                    prepStmt.setInt(3, codigo);

                    prepStmt.executeUpdate();

                    prepStmt.close();
                    
                    session.setAttribute("nome", nome);
                    System.out.println("completo");
                    String redirectURL = "ConsultaUsu.jsp";
                    response.sendRedirect(redirectURL);

                } catch (Exception e){
                    System.out.println(e);
                }
            } else {
                String redirectURL = "atualiza_usuario.jsp";
                response.sendRedirect(redirectURL);
            }
            
        %>
    </body>
</html>
