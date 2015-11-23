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
            <title>Cadastro de Cartão</title>
        </head>
        
        <body background="resources/cartao.jpg">
            <!--O bloco abaixo preenche os campos com as informações do item selecionado.
            Para isso ele busca no banco as informações do produto, usando o id recebido pela tela anterior.-->
             <%
                int codigo = Integer.parseInt(request.getParameter("codigo")); 
                
                Connection con = new conexao().getConnection();
                try{
                    String sql = "SELECT nome, serie FROM cartoes WHERE codigo=" + codigo;
                    Statement stm = con.createStatement();
                    ResultSet rs = stm.executeQuery(sql);

                    while(rs.next()){
            %>
            <div>
                <form method="post" action="update_cartao.jsp">
                    <h2>Cadastro de Cartão</h2><br/><br/>
                    <!--CÃ³digo: <input type="text" name="cod" size="4"/> <br/><br/>-->
                    Código <input type="text" name="codigo" size="15" readonly="readonly" value="<%out.println(String.valueOf(codigo));%>"
                                STYLE="background-color: #E0E0E0 ;"/> <br/><br/>
                    
                    Nome da Coleção: <input type="text" name="nome" size="40" value="<%out.println(rs.getString("nome"));%>"/> <br/><br/>
                    Série: <input type="text" name="serie" size="20" value="<%out.println(rs.getString("serie"));%>"/> <br/><br/>
                    Usuário: <input type="text" name="usuario" size="15" readonly="readonly" value="<%out.println(session.getAttribute("nome"));%>"
                                STYLE="background-color: #E0E0E0 ;"/> <br/><br/>
                    
                    <input type="submit" name="botaoEviar" value ="Atualizar"/></a> 
                        
                    <a href='ConsultaCar.jsp'>
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