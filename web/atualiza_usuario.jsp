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
        <title>Cadastro</title>
    </head>
        
    <body background="resources/usuario.jpg">
        <%
            Connection con = new conexao().getConnection();
            try{
                String sql = "SELECT codigo, nome FROM usuario WHERE codigo=" + session.getAttribute("codigo");
                Statement stm = con.createStatement();
                ResultSet rs = stm.executeQuery(sql);

                while(rs.next()){
        %>
        <h2>Usuario</h2>
        <div>
            <form method="post" action="update_usuario.jsp">
                <br/>
                <br/>    
                <br/>

                Código <input type="text" name="codigo" size="15" readonly="readonly" value="<%out.println(rs.getInt("codigo"));%>"
                                STYLE="background-color: #E0E0E0 ;"/> <br/><br/>
                
                Nome: 
                <input type="text" name="nome" size="40" maxlength="255" value="<%out.println(rs.getString("nome"));%>"/>
                <br/>
                <br/>

                
                Senha: 
                <input type="password" name="senha" size="10" maxlength="6"/>

                <br/><br/>
                <br/><br/>

                <input type="submit" name="botaoEviar" value ="Enviar"/>
                <a href='ConsultaUsu.jsp'>
                        <input type="button" name="botaoCancelar" value ="Cancelar"/></a> 
            </form>
        </div>
        <%
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