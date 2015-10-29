/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package conexao;

import java.sql.*;

/**
 *
 * @author Richard Matheus
 */
public class conexao {
    public Statement stm;
    public ResultSet res = null;

    private String driver = "com.mysql.jdbc.Driver";
    private String url = "jdbc:mysql://localhost:3306/NwkColecaoDB";
    private String user = "root";
    private String pass = "";
    
    public Connection getConnection(){
        Connection conn = null;
        
        try{
            Class.forName(driver);
            conn = DriverManager.getConnection(url, user, pass);
        }catch(Exception e){
            e.printStackTrace();
            System.out.println("Problemas na conexão " + e.getMessage());
        }
        return conn;
    }
    
    public ResultSet getResultado(){
        return res;
    }
}
