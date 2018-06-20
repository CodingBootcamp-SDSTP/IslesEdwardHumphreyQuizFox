<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Add New Question</title>
	</head>
	<body>
		<h3>New Question</h3>
		<a href="dashboard.jsp">Home</a>
		<form action="" method="post">
			<div>
				<label for="qid">ID</label>
				<input type="text" name="id" placeholder="100">
			</div>
			<div>
				<label for="category">Category</label>
				<input type="text" name="category" placeholder="E.G. Land animals, Sea animals">
			</div>
			<div>
				<label for="questions">Question</label>
				<input type="text" name="question" placeholder="Man's Bestfriend">
			</div>
			<div>
				<label for="answers">Answer</label>
				<input type="text" name="answer" placeholder="Dog">
			</div>
			<button type="submit">Submit</button>
		</form>
	</body>
</html>
<%
String id = request.getParameter("id");
String category = request.getParameter("category");
String question  = request.getParameter("question");
String answer  = request.getParameter("answer");

PreparedStatement ps=null;
if(id != null && category != null && question != null && answer != null){
	try{
		String query="Insert into questions(id, category, question, answer) values(?, ?, ?, ?)";
		ps=conn.prepareStatement(query);
		ps.setString(1, id);
		ps.setString(2, category);
		ps.setString(3, question);
		ps.setString(4, answer);
		ps.executeUpdate();
		response.sendRedirect("question_index.jsp");
	} catch(Exception ex) {
		out.println("Your Connection Failed");
	}
}
%>
