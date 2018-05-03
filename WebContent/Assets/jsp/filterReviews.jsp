<%@page import="controller.ReviewActivities"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="controller.ListingActivities"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
JSONArray array = new JSONArray();
String stars = request.getParameter("stars");
array = new ReviewActivities().filterListingReviews(stars);
out.println(array);
%>