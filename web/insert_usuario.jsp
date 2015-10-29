<%-- 
    Document   : insert_usuario
    Created on : 29/10/2015, 15:12:11
    Author     : rma19_000
--%>

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
            /*Abaixo é adquirida a data atual. Como ela não vem no formato utilizado pelo banco de dados
            *É necessario formata-la com a classe SimpleDateFormat.
            *Após isso ela é impressa para conferencia dos dados.
            */
            Date date = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
            String dataFormatada = dateFormat.format(date);
            System.out.println(dataFormatada);
        %>
        
        <!--//insert on db-->
        <%
            /*
            O bloco abaixo recebe os dados inseridos pelo usuario na pagina cadastro.html.
            Após isso, ele insere esses dados no banco de dados e redireciona o usuario de volta à pagina corpo.html
            Caso algo de errado no caminho, ele imprime em linha de comando.
            */
            String nome = request.getParameter("nome");
            String senha = request.getParameter("senha");
            
            Connection con = new conexao().getConnection();
            try{
                String sql = "INSERT INTO usuario(nome, senha, dh_registro) VALUES (?,?,?)";
                PreparedStatement prepStmt = con.prepareStatement(sql);
                prepStmt.setString(1, nome);
                prepStmt.setString(2, senha);
                prepStmt.setString(3, dataFormatada);
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
