<%@include file="connect.jsp"%>
<%
String id=request.getParameter("d");
int delete=Integer.parseInt(id);
try {
	Statement st = conn.createStatement();
	st.executeUpdate("DELETE FROM students WHERE id = '" + delete + "'");
	response.sendRedirect("index.jsp");
} catch(Exception e){
	e.printStackTrace();
}
%>
