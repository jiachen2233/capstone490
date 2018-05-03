<%@page import="controller.ReviewActivities"%>
<%@page import="model.Review"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.User"%>
<%@page import="controller.UserActivities"%>
<%@page import="model.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String stars = request.getParameter("stars");
    String email = request.getParameter("email");
    String review = request.getParameter("review");
    String listing = request.getParameter("listing");
    JSONObject results = new JSONObject();
    int listId = Integer.parseInt(listing);
    int rating = Integer.parseInt(stars);
    Message messsage = new ReviewActivities().addReview(new Review(0, listId, email, review, rating));
    if (messsage.success == 1) {
        results.put("success", 1);
        results.put("message", messsage.message);
        out.println(results);
    } else {
        results.put("success", "0");
        results.put("message", messsage.message);
        out.println(results);
    }
%>