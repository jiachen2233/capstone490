<%@page import="model.Listing"%>
<%@page import="controller.ListingActivities"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.User"%>
<%@page import="controller.UserActivities"%>
<%@page import="model.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String address = request.getParameter("address");
    String unit = request.getParameter("unit");
    JSONObject results = new JSONObject();
    try{
    int beds = Integer.parseInt(request.getParameter("beds"));
    int baths = Integer.parseInt(request.getParameter("baths"));
    int price = Integer.parseInt(request.getParameter("price"));

    Message messsage = new ListingActivities().addListing(new Listing(0, address, unit, beds, baths, price));
    if (messsage.success == 1) {
        results.put("success", 1);
        results.put("message", messsage.message);
        out.println(results);
    } else {
        results.put("success", "0");
        results.put("message", messsage.message);
        out.println(results);
    }
    
    }catch(NumberFormatException e){
        results.put("success", "0");
        results.put("message", e.getMessage());
        out.println(results);
    }

%>