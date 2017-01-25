<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>


<%

	String username = request.getParameter("username");
	
	System.out.println("Profile update for user: "+username);
	JSONArray  values = new JSONArray();
	
	try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from userprofile where username = '"+username+"'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				//TODO NO USER
				JSONObject object = new JSONObject();
				object.put("status", "FAILED");
				values.put(object);
			}
			else{
				//TODO FOUND USER
				JSONObject object = new JSONObject();
				object.put("username", rs.getString("username"));
				object.put("fname", rs.getString("fname"));
				object.put("lname", rs.getString("lname"));
				object.put("hobby", rs.getString("hobby"));
				object.put("email", rs.getString("email"));
				object.put("city", rs.getString("city"));
				values.put(object);
			}
			conn.close();
	}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
	}
	
	response.setContentType("application/json");
	response.getWriter().write(values.toString());
	
%>

