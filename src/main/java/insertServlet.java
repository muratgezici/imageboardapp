import com.oreilly.servlet.MultipartRequest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet(name = "insertServlet", value = "/insertServlet")
public class insertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MultipartRequest m = new MultipartRequest(request, "E:\\MuratStajDosyaları\\imageboardapp\\src\\main\\webapp\\img");
        String flag = m.getParameter("post-mode");
        if(flag==null){
            String title = m.getParameter("title");
            String message = m.getParameter("message");
            String files = m.getParameter("files");
            String owner = m.getParameter("nickname");
            String password = m.getParameter("password");
            String category = m.getParameter("categories");

            String tid= "";
                tid = MongoDBTopic.mongoInsertTopic(title,message,files,category,owner,password);
        }
        else{
            String tid = m.getParameter("tid");
            String replyflag = "true";
            String title = m.getParameter("title");
            String message = m.getParameter("message");
            String files = m.getParameter("files");
            String owner = m.getParameter("nickname");
            String password = m.getParameter("password");
            String replycid = m.getParameter("replycid");
            String cid= "";
                cid = MongoDBComment.mongoInsertComment(tid,replyflag,replycid,title,message,files,owner,password);
        }

        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
        dispatcher.forward(request,response);
    }
}
