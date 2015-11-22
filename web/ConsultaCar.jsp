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
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    </head>
    
    <body background="fundo.png">
	<table border='0' class= "bordasimpes" cellpadding="5" width='75%'>
            <tr><font size="5" color="#FFFFFF">
            <td align = center><b>Código</b></td>
            <td align = center><b>Nome</b></td>
            <td align = center><b>Serie</b></td>
            <td align = center><b>Usuario</b></td>
            <td align = center><b>Data do Registro</b></td>
            </font></tr>

            <!--O bloco abaixo realiza uma consulta no banco de dados, trazendo todos os itens cadastrados.
            Para cada item cadastrado, o programa cria uma linha na tabela, inserindo as informações adquiridas nessa linha.-->
            <%
                Connection con = new conexao().getConnection();
                try{
                    String sql = "SELECT codigo, nome, serie, usuario, dh_registro FROM cartoes ORDER BY codigo";
                    Statement stm = con.createStatement();
                    ResultSet rs = stm.executeQuery(sql);

                    while(rs.next()){
            %>

            <tr>
                <td align = center><%out.println(rs.getString("codigo"));%></td>
                <td align = center><%out.println(rs.getString("nome"));%></td>
                <td align = center><%out.println(rs.getString("serie"));%></td>
                <td align = center><%out.println(rs.getString("usuario"));%></td>
                <td align = center><%out.println(rs.getString("dh_registro"));%></td>
                <td align = center><a href='editar.jsp?id=<%out.print(rs.getString("codigo"));%>'>
                        <input type="button" name="botaoEviar" value ="Editar"/></a> 
                </td>
                <td align = center><a href='deletecar.jsp?codigo=<%out.print(rs.getString("codigo"));%>'>
                        <input type="button" name="botaoExcluir" value ="Excluir"/></a> 
                </td>
            </tr>

            <%
                }
                rs.close();
                stm.close();
                con.close();
            }catch (SQLException e){
                System.out.println("Erro de Comunicação" + e.getMessage());
            }
            %>
	
	</table>

<center><a href="javascript:window.history.go(-1)">Voltar</a></center>
</body>
</html>