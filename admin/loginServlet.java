import java.io.Exception;

@WebServlet("/login");
public class loginServlet
{
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		String userName = request.getParameter("uname");
		String passWord = request.getParameter("pword");
		HttpSession session = request.getSession();
	}
}
