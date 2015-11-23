<%-- 
    Document   : insert_usuario
    Created on : 29/10/2015, 15:12:11
    Author     : rma19_000
--%>

<%@page import="java.sql.ResultSet"%>
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
            O bloco abaixo recebe os dados inseridos pelo usuario na pagina cadastro.html e
            Verifica se estes dados não estão duplicados no banco de dados
            Após isso, ele insere esses dados no banco de dados e redireciona o usuario de volta à pagina corpo.html
            Caso algo de errado no caminho, ele imprime em linha de comando.
            */
            String nome = request.getParameter("nome").trim();
            String senha = request.getParameter("senha").trim();
            
            Connection con = new conexao().getConnection();
            try{
                String sqlValida = "SELECT codigo, nome FROM usuario "
                        + "WHERE nome = ? ";
                
                PreparedStatement prepStmtValida = con.prepareStatement(sqlValida);
                prepStmtValida.setString(1, nome.toUpperCase());
                ResultSet rs = prepStmtValida.executeQuery();
                if(rs.isBeforeFirst() || rs.isAfterLast()){
                    //EXISTE
                    while(rs.next()){
                        String redirectURL = "itemDuplicado.jsp?codigo='X'";
                        response.sendRedirect(redirectURL);
                    }
                } else {
                    //NÃO EXISTE
                    String sql = "INSERT INTO usuario(nome, senha, dh_registro) VALUES (?,?,?)";
                    PreparedStatement prepStmt = con.prepareStatement(sql);
                    prepStmt.setString(1, nome.toUpperCase());
                    prepStmt.setString(2, senha);
                    prepStmt.setString(3, dataFormatada);
                    prepStmt.execute();
                    prepStmt.close();
                    System.out.println("completo");

                    String redirectURL = "ConsultaUsu.jsp";
                    response.sendRedirect(redirectURL);
                }
            } catch (Exception e){
                System.out.println(e);
            }
        %>
    </body>
</html>
