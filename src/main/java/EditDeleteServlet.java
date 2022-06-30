import db.Comment;
import db.MongoDBComment;
import db.MongoDBTopic;
import db.Topic;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "EditDeleteServlet", value = "/EditDeleteServlet")
public class EditDeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       String tid = request.getParameter("tid");
       String cid = request.getParameter("cid");
       String mode = request.getParameter("mode");
       HttpSession session = request.getSession();

       if(mode.equalsIgnoreCase("edit")){
           if(tid.equalsIgnoreCase(cid)){
               session.setAttribute("object_type", "topic");
               Topic topic1 = MongoDBTopic.MongoGetTopic(tid);
                session.setAttribute("object_instance", topic1);
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit.jsp");
               dispatcher.forward(request,response);
           }
           else{
               session.setAttribute("object_type", "comment");
               Comment comment2 = MongoDBComment.MongoGetComment(cid);
              session.setAttribute("object_instance",comment2);
               RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/edit.jsp");
               dispatcher.forward(request,response);
           }
       }
       else if(mode.equalsIgnoreCase("delete")){
            if(tid.equalsIgnoreCase(cid)){
                MongoDBTopic.MongoDBDeleteTopic(cid);
            }
            else{
                System.out.println("this is cid: "+cid);
                Comment comment1 = MongoDBComment.MongoGetComment(cid);
                MongoDBComment.MongoDBDeleteComment(cid,tid,comment1.getReply_flag(),comment1.getReply_cid(),comment1.getTitle(),comment1.getUsername());
            }
        }
        session.setAttribute("tidCurrent", tid);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/topicitem.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
