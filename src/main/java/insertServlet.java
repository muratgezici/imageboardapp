import com.oreilly.servlet.MultipartRequest;
import db.MongoDBComment;
import db.MongoDBTopic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

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
            String tid = m.getParameter("tidCurrent");
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
        String jsploc = m.getParameter("jsplocation");
        if(jsploc.equalsIgnoreCase("topics")){
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topics.jsp");
            dispatcher.forward(request,response);
        }
        else{
            String tid1 = m.getParameter("tidCurrent");
            System.out.println("inside insert tid: "+tid1);
            HttpSession session = request.getSession();
            session.setAttribute("tidCurrent", tid1);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
            dispatcher.forward(request,response);
        }

    }
}
