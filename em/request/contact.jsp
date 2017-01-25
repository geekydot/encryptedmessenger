<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>

<%
	String username = request.getParameter("username");
		
		JSONArray  values = new JSONArray();
		System.out.println("Contact for "+username);
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from "+username;
			
			if(!rs.next()){
				//TODO no entry
			}
			else{
				while(rs.next()){
					JSONObject object = new JSONObject();
				
					object.put("name", rs.getString("uname"));
					object.put("status", rs.getString("status"));
					object.put("pkey", rs.getString("pkey"));
					object.put("r_pkey", rs.getString("r_pkey"));
					object.put("flag", rs.getString("flag"));

					values.put(object);
				}
			}
			
			ResultSet rs = stmt.executeQuery(query);
			
			conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
		response.setContentType("application/json");
	    response.getWriter().write(values.toString());
		
%>