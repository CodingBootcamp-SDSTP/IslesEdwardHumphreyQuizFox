<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@include file="connect.jsp"%>
	<head>
		<meta charset="utf-8">
		<title>Quiz Fox</title>
		<link rel="stylesheet" href="../css/style.css">
		<link rel="icon" href="images/fox2.png">
	</head>
	<body>
		<div class="loginBox">
			<div>
				<form action="" method="get">
					Press Enter after providing your Input: <input type="text" name="q" placeholder="Search: e.g. edward"/>
				</form>
			</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Firstname</th>
					<th>Lastname</th>
					<th>Username</th>
					<th>Password</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<%
					Statement stmt = null;
					ResultSet rs = null;
					stmt = conn.createStatement();
					String query = request.getParameter("q");
					String data;
					if(query != null) {
						data = "SELECT * FROM students WHERE firstname LIKE '%" + query + "%' or lastname LIKE '%" + query + "%' or username LIKE '%" + query + "%' or id LIKE '%"+ query + "%'";
					}
					else {
						data = "SELECT * FROM students";
					}
					rs = stmt.executeQuery(data);
					while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("firstname")%></td>
					<td><%=rs.getString("lastname")%></td>
					<td><%=rs.getString("username")%></td>
					<td><%=rs.getString("password")%></td>
					<td>
						<a href='edit.jsp?u=<%=rs.getString("id")%>'>Modify</a>
						<a href='delete.jsp?d=<%=rs.getString("id")%>'>Delete</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href="addNew.jsp">Add New Record</a>
		<a href="index.jsp">View All Records</a>
		<a href="question_index.jsp">View All Questions</a>
		</div>
	</body>
</html>
