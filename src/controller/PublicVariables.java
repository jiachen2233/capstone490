/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.Message;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

public class PublicVariables {
    
    public Message message;
    public JSONObject jObject = new JSONObject();
    public JSONArray jArray = new JSONArray();

    public Connection con = DbConnector.dbconnect();
    public ResultSet rst = null;
    public PreparedStatement pst = null;
    public String SQL = "";
}
