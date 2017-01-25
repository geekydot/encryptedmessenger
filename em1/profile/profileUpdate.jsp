<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>


<%

	String username = request.getParameter("username");
	String fname = request.getParameter("fname");
	String lname = request.getParameter("lname");
	String email = request.getParameter("email");
	String hobby = request.getParameter("hobby");
	String city = request.getParameter("city");
	
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
				//TODO Insert QUERY
				System.out.println("NO USER FOUND");
				String i_query = "insert into userprofile(username, fname, lname, hobby, email, city) values('"+username+"', '"+fname+"', '"+lname+"', '"+hobby+"', '"+email+"', '"+city+"')";
				int i = stmt.executeUpdate(i_query);
				
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
				
			}
			else{
				//TODO Update QUERY
				
				String u_query = "update userprofile set fname = '"+fname+"', lname = '"+lname+"', hobby = '"+hobby+"', email = '"+email+"', city = '"+city+"' where username = '"+username+"'";
				int i = stmt.executeUpdate(u_query);
				
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
				
			}
			conn.close();
	}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
	}
	
	response.setContentType("application/json");
	response.getWriter().write(values.toString());
	
%>

