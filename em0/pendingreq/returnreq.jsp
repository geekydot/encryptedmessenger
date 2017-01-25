<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>



<%
	
	String username = request.getParameter("username");

	JSONArray  values = new JSONArray();
	try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			System.out.println ("database successfully opened: "+username);
			Statement stmt = conn.createStatement();
			
			String query = "select * from appreq where name = '"+username+"'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			while(rs.next()){
				JSONObject object = new JSONObject();
				
				object.put("name", rs.getString("name"));
				object.put("sender", rs.getString("sender"));
				object.put("status", rs.getString("status"));
				object.put("pkey", rs.getString("pkey"));

				values.put(object);
			}
			conn.close();
			
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
	response.setContentType("application/json");
	response.getWriter().write(values.toString());	


%>