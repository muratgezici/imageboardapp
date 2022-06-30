import com.oreilly.servlet.MultipartRequest;
import db.MongoDBComment;
import db.MongoDBTopic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.File;
import java.io.IOException;

@WebServlet(name = "insertServlet", value = "/insertServlet")
public class insertServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        MultipartRequest m = new MultipartRequest(request, "E:\\MuratStajDosyaları\\imageboardapp\\src\\main\\webapp\\img",16777216);
        String flag = m.getParameter("post-mode");
        String tid = null;
        HttpSession session = request.getSession();

        File file_1 = m.getFile("file_1");
        System.out.println("file_1 in insert:  "+file_1.getName());
        //insert topic -------------------------------------------------------------------------------------------------
        if(flag==null){
            String title = m.getParameter("title");
            String message = m.getParameter("message");
            String files = m.getParameter("files");
            String owner = m.getParameter("nickname");
            String password = m.getParameter("password");
            String category = m.getParameter("categories");

                tid = MongoDBTopic.mongoInsertTopic(title,message,files,category,owner,password, file_1);
        }
        //insert comment --------------------------------------------------------------------------------
        else{
            String tid2 = m.getParameter("tidCurrent");
            String replyflag = "true";
            String title = m.getParameter("title");
            String message = m.getParameter("message");
            String files = m.getParameter("files");
            String owner = m.getParameter("nickname");
            String password = m.getParameter("password");
            String replycid = m.getParameter("replycid");
            String cid= "";
                cid = MongoDBComment.mongoInsertComment(tid2,replyflag,replycid,title,message,files,owner,password);
        }


        //redirect part --------------------------------------------------------------------------------------------
        String jsploc = m.getParameter("jsplocation");
        if(jsploc.equalsIgnoreCase("topics")){
            session.setAttribute("tidCurrent", tid);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
            dispatcher.forward(request,response);
        }
        else{
            if(flag != null){
                String tid1 = m.getParameter("tidCurrent");
                System.out.println("inside insert tid: "+tid1);
                session.setAttribute("tidCurrent", tid1);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
                dispatcher.forward(request,response);
            }
            else{
                session.setAttribute("tidCurrent", tid);
                RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
                dispatcher.forward(request,response);
            }

        }

    }
}
