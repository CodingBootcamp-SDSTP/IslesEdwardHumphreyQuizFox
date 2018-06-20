<html>
	<head>
		<title>Session Master</title>
	</head>
	<body>
		<%
			String userName = request.getParameter("uname");
			String passWord = request.getParameter("pWord");
			out.println(userName);
			out.println(passWord);
			if((userName.equals("Edward") && passWord.equals("Isles"))) {
				session.setAttribute("Session Username: ", userName);
				session.setAttribute("Session Password: ", passWord);
				session.setMaxInterval(60);
				out.println("User" + userName + "has successfully logged in.");
				out.println("<a href='output.jsp'>This is output.jsp</a>");
			}
			else {
				out.println("Incorrect Username or Password");
			}
		%>
	</body>
</html>
