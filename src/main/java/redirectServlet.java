import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "redirectServlet", value = "/redirectServlet")
public class redirectServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String tid = request.getParameter("tidCurrent");
       HttpSession session = request.getSession();
       session.setAttribute("tidCurrent", tid);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
        dispatcher.forward(request,response);
    }
}
