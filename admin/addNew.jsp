<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Insert New Record</title>
	</head>
	<body>
		<h3>Add New Data</h3>
		<a href="index.jsp">Home</a>
		<form action="" method="post">
			<div>
				<label for="id">ID</label>
				<input type="text" id="id" name="sid" placeholder="Student ID: 04939">
			</div>
			<div>
				<label for="first_name">Firstname</label>
				<input type="text" name="firstName" placeholder="Edward Humphrey">
			</div>
			<div>
				<label for="last_name">Lastname</label>
				<input type="text" name="lastName" placeholder="Isles">
			</div>
			<div>
				<label for="user_name">Username</label>
				<input type="text" name="userName" placeholder="okayNamanPala123">
			</div>
			<div>
				<label for="password">Password</label>
				<input type="password" name="passWord" placeholder="********">
			</div>
			<button type="submit">Submit</button>
		</form>
	</body>
</html>
<%
String id = request.getParameter("sid");
String firstName = request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String userName=request.getParameter("userName");
String passWord=request.getParameter("passWord");
PreparedStatement ps=null;
if(id != null && firstName != null && lastName != null && userName != null && passWord != null){
	try{
		String query="Insert into students(id,firstname,lastname,username,password) values(?, ?, ?, ?, ?)";
		ps=conn.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, firstName);
		ps.setString(3, lastName);
		ps.setString(4, userName);
		ps.setString(5, passWord);
		ps.executeUpdate();
		response.sendRedirect("index.jsp");
	}catch(Exception ex){
		out.println("Your Connection Failed");
	}
}
%>
