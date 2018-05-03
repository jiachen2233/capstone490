<%@page import="org.json.simple.JSONObject"%>
<%@page import="controller.ListingActivities"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
JSONArray array = new JSONArray();

String hasBeds = request.getParameter("hasBeds");
String beds = request.getParameter("beds");
String hasBaths = request.getParameter("hasBaths");
String baths = request.getParameter("baths");
String hasPrice = request.getParameter("hasPrice");
String priceSign = request.getParameter("priceSign");
String price = request.getParameter("price");

String map = "{\"hasBeds\":\""+hasBeds+"\",\"beds\":\""+beds+"\",\"hasBaths\":\""+hasBaths+"\",\"baths\":\""+baths+"\",\"hasPrice\":\""+hasPrice+"\","
                + "\"priceSign\":\""+priceSign+"\",\"price\":\""+price+"\"}";
array = new ListingActivities().filterListings(map);
out.println(array);
%>