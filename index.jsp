<%@include file="admin/connect.jsp"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Quiz Fox</title>
		<link rel="stylesheet" href="css/admin.css">
		<link rel="icon" href="images/fox2.png">
		<meta http-equiv="refresh" content="${pageContext.session.maxInactiveInterval};url=index.jsp">
	</head>
	<body>
		<div class="loginBox">
			<img src="images/cat.png" class="user">
			<h2>Log In</h2>
			<form id="loginForm" action="authentication.jsp" method="post">
				<p>Username</p>
				<input type="text" name="uname" placeholder="Islessian0409" class="light" id="uname" autocomplete="off">
				<p>Password</p>
				<input type="password" name="pword" placeholder="passWord123" class="light" id="password" autocomplete="off">
				<input type="submit" value="Sign In"  id="submit">
			</form>
		</div>
		<script src="functionality.js"></script>
	</body>
</html>
