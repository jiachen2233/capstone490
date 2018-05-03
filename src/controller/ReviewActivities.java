/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.sql.SQLException;
import model.Message;
import model.Review;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class ReviewActivities extends PublicVariables {

    int reviewID;
    int buildingID;
    String emailAddress;
    String review;
    int rating;

    public ReviewActivities() {
    }

    public static void main(String[] args) {
        ReviewActivities r = new ReviewActivities();
        Review re = new Review(0, 1, "e@g", "good", 3);
        System.out.println(r.getAllReviews());
    }

    public Message addReview(Review review) {
        message = new Message();
        buildingID = review.buildingID;
        emailAddress = review.emailAddress;
        this.review = review.review;
        rating = review.rating;
        try {
            SQL = "INSERT INTO reviews (emailaddress, buildingID, review, rating) VALUES (?, ?, ?, ?)";
            pst = con.prepareStatement(SQL);
            pst.setString(1, emailAddress);
            pst.setInt(2, buildingID);
            pst.setString(3, this.review);
            pst.setInt(4, rating);

            pst.execute();
            message.message = "Review was successful";
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

    
    public JSONArray getAllReviews(){
        return fetchListingReviews("SELECT * FROM reviews");
    }
    
    public JSONArray filterListingReviews(String stars) throws ParseException{
        return fetchListingReviews("SELECT * FROM reviews WHERE rating > "+stars);
    }
    
    public JSONArray fetchListingReviews(String SQL) {
        jArray = new JSONArray();
        try {
            pst = con.prepareStatement(SQL);
            rst = pst.executeQuery();
            while (rst.next()) {
                jObject = new JSONObject();
                jObject.put("reviewID", rst.getString("reviewID"));
                jObject.put("emailAddress", rst.getString("emailaddress"));
                jObject.put("buildingID", rst.getString("buildingID"));
                jObject.put("review", rst.getString("review"));
                jObject.put("rating", rst.getInt("rating"));

                jArray.add(jObject);
            }
        } catch (Exception e) {
            e.printStackTrace();
            jArray.clear();
        } finally {
            try {
                con.close();
                pst.close();
                rst.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
                jArray.clear();
            }
        }
        return jArray;
    }
}
