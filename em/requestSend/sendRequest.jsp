<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>


<%

	String username = request.getParameter("username");
	
	System.out.println("send request for user: "+username);
	JSONArray  values = new JSONArray();
	
	try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from "+username;
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				//TODO NO USER
				JSONObject object = new JSONObject();
				object.put("status", "FAILED");
				values.put(object);
			}
			else{
				while(rs.next()){
					//TODO FOUND USER
					JSONObject object = new JSONObject();
					object.put("uname", rs.getString("uname"));
					object.put("status", rs.getString("status"));
					if(rs.getString("status").equals("completed")){
						object.put("pkey", rs.getString("pkey"));
					}
					else{
						object.put("pkey", "NULL");
					}
				
					values.put(object);
				}
			}
			conn.close();
	}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
	}
	
	response.setContentType("application/json");
	response.getWriter().write(values.toString());
	
%>