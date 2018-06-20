<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Update Question and Answer</title>
	</head>
	<%
	Statement statement = null;
	ResultSet rs = null;
	PreparedStatement ps=null;
	%>
	<h3>Edit/Update Data</h3>
	<a href="question_index.jsp">Back to Home</a>
	<div>
		<div>
			<%
			statement = conn.createStatement();
			String u = request.getParameter("u");
			int numId = Integer.parseInt(u);
			String Data = "select * from questions where id='" + numId + "'";
			rs = statement.executeQuery(Data);
			while (rs.next()) {
			%>
			<form>
			<input type="hidden" name="id" value='<%=rs.getString("id")%>'/>
			<div>
				<label for="Category">Category</label>
				<input type="text" name="category" value='<%=rs.getString("category")%>'>
			</div>
			<div>
				<label for="question">Question</label>
				<input type="text" name="question" value='<%=rs.getString("question")%>'>
			</div>
			<div>
				<label for="answer">answer</label>
				<input type="text" name="answer" value='<%=rs.getString("answer")%>'>
			</div>
			<%
			}
			%>
			<button type="submit">Update</button>
			<a href="question_index.jsp">Home</a>
			</form>
		</div>
	</div>
</html>
<%
String category = request.getParameter("category");
String question = request.getParameter("question");
String answer = request.getParameter("answer");
int updateQuery = 0;
if(category != null && question != null && answer != null) {
	try{
		String query="update questions set category=?, question=?, answer=? WHERE id='"+ numId + "'";
		ps=conn.prepareStatement(query);
		ps.setString(1, category);
		ps.setString(2, question);
		ps.setString(3, answer);
		updateQuery = ps.executeUpdate();
		if(updateQuery != 0) {
			response.sendRedirect("question_index.jsp");
		}
	} catch(Exception e) {
		out.println("Your Connection: " + e);
		e.printStackTrace();
	}finally{
		ps.close();
		conn.close();
	}
}
%>
