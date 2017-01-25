<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>

<%
		String username = request.getParameter("username");
		String uname = request.getParameter("uname");
		
		JSONArray  values = new JSONArray();
		System.out.println("update for "+username);
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			String flag = "true";
			String query = "update "+username+" set flag = '"+flag+"' where uname = '"+uname+"'";
			int i = stmt.executeUpdate(query);
			
			if(i == 1){
				JSONObject object = new JSONObject();
				object.put("status", "SUCCESS");
				values.put(object);
			}
			else{
				JSONObject object = new JSONObject();
				object.put("status", "FAILED");
				values.put(object);
			}
			
			
		conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
		response.setContentType("application/json");
	    response.getWriter().write(values.toString());
%>