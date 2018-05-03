/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

public class User {
    public String email;
    public String password;
    public String type;

    public User(String email, String password, String type) {
        this.email = email;
        this.password = password;
        this.type = type;
    }

    public User() {
    }
    
    
    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public String getType() {
        return type;
    }
    
    
}
