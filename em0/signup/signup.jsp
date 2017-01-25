<%@ page import ="java.sql.*" %>

<html>
	<head>
	</head>
	
	<body>
	
	
	<%
		
		
		String username = request.getParameter("username");
		String passwd = request.getParameter("password");
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String email = request.getParameter("email");
		String city = request.getParameter("city");
		String dob = request.getParameter("dob");
		
		try{
			Connection conn;
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://192.168.33.77:3306/em", "munawar", "root");
			//out.println ("database successfully opened.");
			Statement stmt = conn.createStatement();
			
			String query = "insert into registration(username, fname, lname, email, city, password) values('"+username+"', '"+fname+"', '"+lname+"', '"+email+"', '"+city+"', '"+passwd+"')";
			
			int i = stmt.executeUpdate(query);
			
			if(i == 1){
				String cTable = "create table "+username+"(id not null auto_increment, uname varchar(50), status varchar(20), pkey varchar(250))";
				
				String sql = "create table "+username+"(id int not null auto_increment primary key,uname varchar(50) not null,status varchar(20) not null, pkey varchar(500) not null)";
				
				stmt.executeUpdate(sql);
				System.out.println("Table created successfully: "+username);
			}
			conn.close();
		}catch(SQLException e) {
			out.println("SQLException caught: " +e.getMessage());
		}
		
	%>
	
	</body>
	
</html>