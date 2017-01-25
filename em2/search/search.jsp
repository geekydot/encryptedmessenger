<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>


	
	<%
		
		
		String username = request.getParameter("username");
		boolean flag = false;
		JSONArray  values = new JSONArray();

		System.out.println("Search: "+username);
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from registration where username = '"+username+"'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				System.out.println("NO USER FOUND");
			}
			else{
				
				flag = true;
				System.out.println("USER FOUND: "+rs.getString("username"));
			}
			
			if(flag){
				JSONObject object = new JSONObject();
				object.put("username", rs.getString("username"));
				object.put("fname", rs.getString("fname"));
				object.put("lname", rs.getString("lname"));
				object.put("email", rs.getString("email"));
				
				values.put(object);
			}
			else{
				JSONObject object = new JSONObject();
				object.put("username", "user does not exists");
				
				values.put(object);
			}

					
			
			conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
		response.setContentType("application/json");
		response.getWriter().write(values.toString());
		
	%>
