<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@include file="connect.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<title>Update Student Information</title>
	</head>
	<%
	Statement statement = null;
	ResultSet rs = null;
	PreparedStatement ps=null;
	%>
	<h3>Edit/Update Data</h3>
	<a href="index.jsp">Back to Home</a>
			<%
			statement = conn.createStatement();
			String u = request.getParameter("u");
			int numId = Integer.parseInt(u);
			String Data = "select * from students where id='" + numId + "'";
			rs = statement.executeQuery(Data);
			while (rs.next()) {
			%>
			<input type="hidden" name="id" value='<%=rs.getString("id")%>'/>
			<div>
				<label for="first_name">Firstname</label>
				<input type="text" name="firstName" value='<%=rs.getString("firstname")%>'>
			</div>
			<div>
				<label for="last_name">Lastname</label>
				<input type="text" name="lastName" placeholder="Isles" value='<%=rs.getString("lastname")%>'>
			</div>
			<div>
				<label for="user_name">Username</label>
				<input type="text" name="userName" value='<%=rs.getString("username")%>'>
			</div>
			<div>
				<label for="password">Password</label>
				<input type="password" name="passWord" value='<%=rs.getString("password")%>'>
			</div>
			<%   
			}
			%>
			<button type="submit">Update</button>
			<a href="index.jsp">Home</a>
			</form>
		</div>
	</div>
</html>
<%
String firstName = request.getParameter("firstName");
String lastName=request.getParameter("lastName");
String userName=request.getParameter("userName");
String passWord=request.getParameter("passWord");
int updateQuery = 0;
if(firstName != null && lastName != null && userName != null && passWord != null) {
	try{
		String query="update students set firstname=?, lastname=?, username=?, password=? WHERE id='"+ numId + "'";
		ps=conn.prepareStatement(query);
		ps.setString(1, firstName);
		ps.setString(2, lastName);
		ps.setString(3, userName);
		ps.setString(4, passWord);
		updateQuery = ps.executeUpdate();
		if(updateQuery != 0){
			response.sendRedirect("index.jsp");
		}
	}catch(Exception e){
		out.println("Your Connection: "+e);
		e.printStackTrace();
	}finally{
		ps.close();
		conn.close();
	}
}
%>
