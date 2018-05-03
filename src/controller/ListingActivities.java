/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Listing;
import model.Message;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ListingActivities extends PublicVariables{
    
    int buildingID = 0;
    String address = "";
    String unit = "";
    int beds = 0;
    int baths = 0;
    int price = 0;
    
    public static void main(String[] args) throws ParseException {
        ListingActivities l = new ListingActivities();

        String hasBeds = "yes";// request.getParameter("hasBeds");
        String beds = "2";
        String hasBaths = "yes";// request.getParameter("hasBaths");
        String baths = "3";
        String hasPrice = "no";// request.getParameter("hasPrice");
        String priceSign = "=";// request.getParameter("priceSign");
        String price = "";// request.getParameter("price");

        String map = "{\"hasBeds\":\"" + hasBeds + "\",\"beds\":\"" + beds + "\",\"hasBaths\":\"" + hasBaths + "\",\"baths\":\"" + baths + "\",\"hasPrice\":\"" + hasPrice + "\","
                + "\"priceSign\":\"" + priceSign + "\",\"price\":\"" + price + "\"}";
        System.err.println(new ListingActivities().filterListings(map));
    }

    public ListingActivities() {
    }
    
    
    public Message addListing(Listing listing){
        message = new Message();
        address = listing.address;
        unit = listing.unit;
        beds = listing.baths;
        baths = listing.baths;
        price = listing.price;
        
        try{
            SQL = "INSERT INTO listings (address, unit, beds, baths, price) VALUES (?, ?, ?, ?, ?)";
            pst = con.prepareStatement(SQL);
            pst.setString(1, address);
            pst.setString(2, unit);
            pst.setInt(3, beds);
            pst.setInt(4, baths);
            pst.setInt(5, price);
            pst.execute();
            message.message = "Listing added successfully";
            message.success = 1;
            
        } catch (Exception e) {
            e.printStackTrace();
            message.message = "Database error " + e.getMessage();
            message.success = 0;
        } finally {
            try {
                con.close();
                pst.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                message.message = "Database error " + ex.getMessage();
                message.success = 0;
            }

        }
        return message;
    }
    
    public JSONArray getAllListings(){
        return fetchListings("SELECT * FROM listings");
    }
    
    public JSONArray filterListings(String params) throws ParseException {
        JSONParser parse = new JSONParser();
        JSONObject map = (JSONObject) parse.parse(params);
        String hasBeds = map.get("hasBeds").toString();
        String hasBaths = map.get("hasBaths").toString();
        String hasPrice = map.get("hasPrice").toString();

        String _SQL = "";
        if (hasBeds.equals("yes")) {
            String beds = map.get("beds").toString();
            _SQL += " beds  = " + beds;
        }
        if (hasBaths.equals("yes")) {
            String baths = map.get("baths").toString();
            if (_SQL.equals("")) {
                _SQL += " baths  = " + baths;
            } else {
                _SQL += " AND baths  = " + baths;
            }
        }
        if (hasPrice.equals("yes")) {
            String priceSign = map.get("priceSign").toString();
            String price = map.get("price").toString();
            if (_SQL.equals("")) {
                _SQL += " price " + priceSign + " " + price;
            } else {
                _SQL += " AND price " + priceSign + " " + price;
            }
        }
        if (!_SQL.equals("")) {
            _SQL = "WHERE " + _SQL;
        }
        return fetchListings("SELECT * FROM listings " + _SQL);
    }
    
    public JSONArray getOneListing(int buildingID){
        return fetchListings("SELECT * FROM listings WHERE id = "+buildingID);
    }
    
    public JSONArray fetchListings(String SQL) {
        DecimalFormat formatter = new DecimalFormat("#,###");
        System.out.println(SQL);
        jArray = new JSONArray();
        try {
            rst = con.prepareStatement(SQL).executeQuery();
            while (rst.next()) {
                jObject = new JSONObject();
                jObject.put("buildingID", rst.getInt("buildingID"));
                jObject.put("link", "<a href='LeaveReview?ID=" + rst.getInt("buildingID") + "'>Leave a review</a>");
                jObject.put("address", rst.getString("address"));
                jObject.put("unit", rst.getString("unit"));
                jObject.put("beds", rst.getInt("beds"));
                jObject.put("baths", rst.getInt("baths"));
                jObject.put("price", "$ "+formatter.format(rst.getInt("price")));

                jArray.add(jObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jArray.clear();
        } finally {
            try {
                con.close();
                rst.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                jArray.clear();
            }
        }
        return jArray;
    }
}
