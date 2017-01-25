<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>

<%
	String username = request.getParameter("username");
	String uname = request.getParameter("uname");
	String r_pkey = request.getParameter("r_pkey");
	
	System.out.println("User: "+username+" accpeting request from "+uname);
	JSONArray  values = new JSONArray();
	
	try{
		Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			String status = completed;
			
			String query = "update appreq set status = '"+status+"' where name = '"+username+"' and sender = '"+uname+"'";
			int i = stmt.executeUpdate(query);
			
			String query2 = "update "+uname+" set status = '"+status+"', r_pkey = '"+r_pkey+"' where uname = '"+username+"'";
			int j = stmt.executeUpdate(query2);
			
			if(i == 1 && j == 1){
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