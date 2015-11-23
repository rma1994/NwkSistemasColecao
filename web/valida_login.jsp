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
            String usuario = request.getParameter("usuario");
            String senha = request.getParameter("senha");
            
            Connection con = new conexao().getConnection();
            try{
                String sql = "SELECT nome, senha FROM usuario "
                        + "WHERE nome='" + usuario.toUpperCase() + "' AND "
                        + "senha='" + senha + "'";
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(sql);

                //Checa se o valor ja existe
                if(rs.isBeforeFirst() || rs.isAfterLast()){
                    //EXISTE
                    String sqlId = "SELECT codigo, nome FROM usuario "
                        + "WHERE nome='" + usuario + "' AND "
                        + "senha='" + senha + "'";
                    
                    Statement stmId = con.createStatement();
                    ResultSet rsId = stmId.executeQuery(sqlId);
                    
                    while(rsId.next()){
                        //System.out.println(rsId.getString("nome"));
                        session.setAttribute("nome", rsId.getString("nome").toUpperCase());
                        session.setAttribute("codigo", rsId.getInt("codigo"));
                    }
                    
                    String redirectURL = "main.html";
                    response.sendRedirect(redirectURL);
                }else{
                    //NÃO EXISTE
                    String redirectURL = "Login.html";
                    response.sendRedirect(redirectURL);
                }
                rs.close();
                stm.close();
                con.close();
            }catch (SQLException e){
                System.out.println("Erro de Comunicação" + e.getMessage());
            }
        %>
    </body>
</html>
