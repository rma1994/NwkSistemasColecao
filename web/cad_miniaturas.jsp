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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>Cadastro de Miniaturas</title>
    </head>
    
    <body leftmargin=200 background="resources/buneco.jpg">
        <div>
            <form method="post" action="insert_miniatura.jsp">
                <!--CÃ³digo: <input type="text" name="Complementar" size="4"/> <br><br>-->
                Nome da Miniatura: <input type="text" name="nome" size="40"/> <br><br>
                Usuário: <input type="text" name="usuario" size="15" readonly="readonly" value="<%out.println(session.getAttribute("nome"));%>"
                                    STYLE="background-color: #E0E0E0 ;"/> <br><br>
                <!--Data do Registro: <input type="date" name="Complementar"/> <br><br>-->

                <!--ObservaÃ§Ãµes: <br>
                        <input type="text" name="obs" size="60"/>-->
                <br/><br/>
                <input type="submit" name="botaoEviar" value ="Enviar"/>
                <input type="button" name="botaoCancelar" value ="Cancelar"/>
            </form>
        </div>
    </body>
</html>