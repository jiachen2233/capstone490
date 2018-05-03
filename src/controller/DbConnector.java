package controller;

import static java.lang.System.out;
import java.sql.Connection;
import java.sql.DriverManager;

public class DbConnector {
    
    public static void main(String args[]){
        
        dbconnect();
    }
    public static Connection dbconnect(){
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            
            String DB_HOST = "localhost";
            String DB_USER = "root";
            String DB_PASSWORD = "x4QnTzGhXhfD";
            String DB_NAME = "jaychen";

            return DriverManager.getConnection("jdbc:mysql://"+DB_HOST+":3306/"+DB_NAME , DB_USER, DB_PASSWORD);
        }catch(Exception e){
            out.println("error "+e.getMessage());
            return null;
        }
    }

}
