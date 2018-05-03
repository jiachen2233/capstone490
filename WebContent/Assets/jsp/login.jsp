<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="model.User"%>
<%@page import="controller.UserActivities"%>
<%@page import="model.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String usertype = request.getParameter("usertype");
    String password = request.getParameter("password");
    JSONObject results = new JSONObject();

    Message messsage = new UserActivities().Login(new User(usertype, password, ""));
    if (messsage.success == 1) {
        results.put("success", 1);
        results.put("message", messsage.message);
        session.setAttribute("user", usertype);
        out.println(results);
    } else {
        results.put("success", "0");
        results.put("message", messsage.message);
        out.println(results);
    }
%>