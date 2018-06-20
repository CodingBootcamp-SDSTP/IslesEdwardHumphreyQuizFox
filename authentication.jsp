
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="admin/connect.jsp"%>
<html>
	<head>
		<title>User Authentication</title>
	</head>
	<body>
		<%
			String userName = request.getParameter("uname");
			String passWord = request.getParameter("pWord");
			out.println(userName);
			out.println(passWord);
		%>
		<%
			try {
				PreparedStatement ps = conn.prepareStatement("SELECT * FROM students WHERE username=? and password=?");
				ps.setString(1, userName);
				ps.setString(2, passWord);
				ResultSet rs = ps.executeQuery();
				if(rs.next()) {
					response.sendRedirect("admin/index.jsp");
				}
				else {
					response.sendRedirect("Error.jsp");
				}
			} catch(SQLException e) {
				e.printStackeTrace();
			}
		%>
	</body>
</html>
