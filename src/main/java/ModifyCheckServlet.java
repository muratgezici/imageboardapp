import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ModifyCheckServlet", value = "/ModifyCheckServlet")
public class ModifyCheckServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pass = request.getParameter("password");
        String pass1 = request.getParameter("password1");

        if(pass.equals(pass1)){
            response.setContentType("text/plain");
            response.getWriter().write("success");
        }
        else{
            response.setContentType("text/plain");
            response.getWriter().write("fail");
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
