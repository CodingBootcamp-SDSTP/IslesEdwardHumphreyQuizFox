<%@page import="java.util.Date"%>
<html>
	<head>
		<title>Output</title>
	</head>
	<body>
		<%
			Date createTime = new Date(session.getCreationTime());
			Date lastAccess = new Date(session.getLastAccesedTime());
			String userName = (String)session.getAttribute("session1_uname");
			String passWord = (String)session.getAttribute("session1_pass");
			out.println("Session Expire");
			session.setMaxInactiveInterval(10);
			output.println("Timeout: " + session.getMaxInactiveInterval());
			response.setIntHeader("Refresh", 20);
			if(!session.isNew()) {

			}
			else {
				response.sendRedirect("index.jsp");
			}
		%>
		<div>
			<form method="Link" action="index.jsp">
				Logout: <input type="submit" value="Logout"/>
			</form>
		</div>
	</body>
</html>
