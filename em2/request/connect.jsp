<%@ page import ="java.sql.*" %>

<html>
	<head>
	</head>
	
	<body>
	
	
	<%
		
		
		String username = request.getParameter("username");
		String uname = request.getParameter("uname");
		String status = request.getParameter("status");
		String pkey = request.getParameter("pkey");
		String sender = username;
		

		System.out.println(username);
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "select * from "+username+" where username = '"+username+"' and uname = '"+uname+"'"; 
			
			ResultSet rs = stmt.executeQuery(query);
			
			if(!rs.next()){
				//TODO entry found
			}
			else{
				//TODO entry not found
			}
			
		/*	
			String query = "insert into "+username+"(uname, status, pkey) values('"+uname+"', '"+status+"', '"+pkey+"')";
			
			int i = stmt.executeUpdate(query);
			//out.println(username + " "+email);
			String appreq = "appreq";
			//String query2 = "insert into "+appreq+"(name, status, pkey, sender) values('"+uname+"', '"+status+"', '"+pkey+"', '"++sender"') on duplicate key update name='"+uname+"', '"+sender+"'";
			
			String query2 = "insert into "+appreq+"(name, status, pkey, sender) values('"+uname+"', '"+status+"', '"+pkey+"', '"+sender+"') on duplicate key update name='"+uname+"',sender='"+sender+"'";
			
			int j = stmt.executeUpdate(query2);
		*/
			conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
	%>
	
	</body>
	
</html>