<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Profile Update</title>
</head>
<body>
    <center>
        <h1>Profile Update</h1>
        <form method="post" action="profileUpdate.jsp" enctype="multipart/form-data">
            <table>
				 <tr>
                    <td>User Name: </td>
                    <td><input type="text" name="username" size="50"/></td>
                </tr>
                <tr>
                    <td>First Name: </td>
                    <td><input type="text" name="fname" size="50"/></td>
                </tr>
                <tr>
                    <td>Last Name: </td>
                    <td><input type="text" name="lname" size="50"/></td>
                </tr>
                <tr>
                    <td>Display Picture: </td>
                    <td><input type="file" name="photo" size="50"/></td>
                </tr>
                <tr>
                    <td><input type = "submit" value = "Save Data"/></td>
					<td><input type = "reset" value = "Reset"/></td>
                </tr>
            </table>
        </form>
    </center>
</body>
</html>