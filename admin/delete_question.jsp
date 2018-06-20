<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@include file="connect.jsp"%>
<%
String id=request.getParameter("d");
int delete=Integer.parseInt(id);
try {
	Statement st = conn.createStatement();
	st.executeUpdate("DELETE FROM questions WHERE id = '" + delete + "'");
	response.sendRedirect("question_index.jsp");
} catch(Exception e){
	e.printStackTrace();
}
%>
