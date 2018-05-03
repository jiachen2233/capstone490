/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import model.Message;
import model.User;

public class UserActivities extends PublicVariables {

    public static void main(String[] args) {
        UserActivities t = new UserActivities();
        User u = new User();
        u.email = t.email;
        u.password = t.password;
    }
    String email = "";
    String password = "";

    public UserActivities() {
    }
    

    public Message Login(User user) {
        message = new Message();
        email = user.email;
        password = user.password;

        try {
            SQL = "SELECT * FROM users WHERE emailaddress = ? and password = ?";
            pst = con.prepareStatement(SQL);
            pst.setString(1, email);
            pst.setString(2, password);
            rst = pst.executeQuery();
            if (!rst.next()) {
                message.message = "Username and Password did not match any record ";
                message.success = 0;
            } else {
                
                message.message = "Login was successful";
                message.success = 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
            message.message = "Database error " + e.getMessage();
            message.success = 0;
        } finally {
            try {
                con.close();
                pst.close();
                rst.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                message.message = "Database error " + ex.getMessage();
                message.success = 0;
            }

        }
        return message;
    }

}
