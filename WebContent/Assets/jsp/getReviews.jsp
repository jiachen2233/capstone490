<%@page import="controller.ReviewActivities"%>
<%@page import="controller.ListingActivities"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
JSONArray array = new JSONArray();
array = new ReviewActivities().getAllReviews();
out.println(array);
%>