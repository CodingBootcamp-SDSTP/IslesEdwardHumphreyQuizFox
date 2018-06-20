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
		<title>Question</title>
		<link rel="stylesheet" href="../css/style.css">
		<link rel="icon" href="images/fox2.png">
	</head>
	<body>
		<div class="loginBox">
			<div>
				<form action="" method="get">
					Press Enter after providing your Input: <input type="text" name="q" placeholder="Search: e.g. anything"/>
				</form>
			</div>
		<table class="table">
			<thead>
				<tr>
					<th>ID</th>
					<th>Category</th>
					<th>Question</th>
					<th>Answer</th>
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
						data = "SELECT * FROM questions WHERE category LIKE '%" + query + "%' or question LIKE '%" + query + "%' or answer LIKE '%" + query + "%' or id LIKE '%"+ query + "%'";
					}
					else {
						data = "SELECT * FROM questions";
					}
					rs = stmt.executeQuery(data);
					while(rs.next()) {
				%>
				<tr>
					<td><%=rs.getString("id")%></td>
					<td><%=rs.getString("category")%></td>
					<td><%=rs.getString("question")%></td>
					<td><%=rs.getString("answer")%></td>
					<td>
						<a href='edit_question.jsp?u=<%=rs.getString("id")%>'>Modify</a>
						<a href='delete_question.jsp?d=<%=rs.getString("id")%>'>Delete</a>
					</td>
				</tr>
				<%
					}
				%>
			</tbody>
		</table>
		<a href="addQuestion.jsp">Add New Question</a>
		<a href="question_index.jsp">View All Questions</a>
		<a href="index.jsp">View All Users</a>
		</div>
	</body>
</html>
