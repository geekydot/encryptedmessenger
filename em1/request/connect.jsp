<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
    import="org.json.JSONObject,org.json.JSONArray,org.json.JSONException,java.util.*"%>

<%@ page import ="java.sql.*" %>


	
	<%
		
		
		String username = request.getParameter("username");
		String uname = request.getParameter("uname");
		String status = request.getParameter("status");
		String pkey = request.getParameter("pkey");
		String sender = username;
		
		JSONArray  values = new JSONArray();
		System.out.println(username);
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from appreq where name = '"+username+"' and sender = '"+uname+"'";
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				//TODO entry not found; need to insert or check duplicate entry
				System.out.println(" need to insert or check duplicate entry");
				
				String q2 = "select * from appreq where name = '"+uname+"' and sender = '"+username+"'";
				ResultSet rs2 = stmt.executeQuery(q2);
				
				if(!rs2.next()){
					//TODO entry not found; need to insert
					System.out.println(" need to insert");
					
					String query1 = "insert into "+username+"(uname, status, pkey) values('"+uname+"', '"+status+"', '"+pkey+"')";
			
					int i = stmt.executeUpdate(query1);
					//out.println(username + " "+email);
					String appreq = "appreq";
					
					String query2 = "insert into "+appreq+"(name, status, pkey, sender) values('"+uname+"', '"+status+"', '"+pkey+"', '"+sender+"') on duplicate key update name='"+uname+"',sender='"+sender+"'";
					
					int j = stmt.executeUpdate(query2);
					
					JSONObject object = new JSONObject();
				
					object.put("status", "ACK");
		
					values.put(object);
				}
				else{
					//TODO duplicate entry
					System.out.println("duplicate entry");
					
					JSONObject object = new JSONObject();
				
					object.put("status", "NAK_2");
		
					values.put(object);
				}
				
				
			}
			else{
				//TODO entry found; generate flag
				System.out.println("reverse entry found");
				
				JSONObject object = new JSONObject();
				
				//if(rs.getString("status").equals("pending"))
					object.put("status", "NAK_1");
		
				values.put(object);
			}
			
			conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
		response.setContentType("application/json");
	    response.getWriter().write(values.toString());
		
	%>
