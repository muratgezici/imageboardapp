<%@ page import="db.MongoDBTopic" %>
<%@ page import="db.Topic" %>
<%@ page import="db.MongoDBComment" %>
<%@ page import="db.Comment" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.lang.reflect.Array" %><%--
  Created by IntelliJ IDEA.
  User: Sir_Tastical
  Date: 24.6.2022
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Topic</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
</head>
<body>
<script>
    function replyVisibility(){
        console.log("babaa");
        if($("#post-mode").prop('checked') == true){
            console.log("adada");
            $(".replycheckbox").css("visibility", "visible");
            $("#categories").css("visibility", "hidden");
        }
        else{
            $(".replycheckbox").css("visibility", "hidden");
            $("#categories").css("visibility", "visible");
        }
    }


</script>
<%
    String tidCurr = request.getParameter("tidCurrent");
    if(tidCurr==null){
        tidCurr = (String) session.getAttribute("tidCurrent");
    }
    System.out.println("this is test value"+request.getParameter("tidCurrent1"));
%>
<form action="insertServlet" method="post" enctype="multipart/form-data">
<div class="message-form">
    <table>
        <tr><td>Nickname:</td><td><input type="text" name="nickname" placeholder="nickname"></td></tr>
        <tr><td>Title:</td><td><input type="text" name="title" placeholder="title"></td></tr>
        <tr><td>Password:</td><td><input type="text" name="password" placeholder="password"></td></tr>
        <tr><td>Mode:</td><td><input id="post-mode" name="post-mode" value="true" onclick="replyVisibility()" type="checkbox"><label for="post-mode"> Reply</label></td></tr>
        <tr>
            <td>Category:</td>
            <td>
                <select id="categories" name="categories" size="1">
                    <option value="general">General</option>
                    <option value="videogames">Videogames</option>
                    <option value="football">Football</option>
                    <option value="misc">Misc</option>
                </select>
            </td>
        </tr>
        <tr><td>Images:</td><td><div id="imgdiv">
            <input id="img1" type="file">
            <input id="img2" type="file">
            <input id="img3" type="file">
        </div></td></tr>
        <input type="hidden" name="tidCurrent" value="<%=tidCurr%>">
        <tr><td></td><td><button type="submit" name="jsplocation" value="topicitem">Post</button></td></tr>
    </table>
    <textarea class="post-message" name="message" cols="30" rows="10" placeholder="Write your message here..."></textarea>

</div>
<nav class="nav-bar">Categories : General | Video Games | Football | Misc </nav>

    <%
        System.out.println("this is tid: "+tidCurr);
    Topic topic = MongoDBTopic.MongoGetTopic(tidCurr);
    ArrayList<Comment> comments = (ArrayList<Comment>) MongoDBComment.MongoGetComments();
    %>
<div class="message-content">
    <table class="table-main">
        <tr class="info-reply"><td>Posted by: <%=topic.getOwner()%> => <span><%=topic.getTitle()%></span></td><td class="replycheckbox" style="visibility: hidden"><input type="checkbox" name="replycid" value="topic:<%=topic.getTid()%>">Reply</td></tr>
        <tr><td><img src="fb.png" alt=""><div class="smallimg">
            <img class="smallimg-item" src="fb.png" alt="">
            <img class="smallimg-item" src="fb.png" alt=""></div></td>
            <td> <%=topic.getMessage()%></td></tr>
        <tr><td></td><td colspan="2"><button>Edit</button><button>Delete</button></td></tr>
    </table></div>
<br>
<%
    int maxlevel=0;
    for(Comment commentlength:comments){
        if(maxlevel<commentlength.getLevel()){
            maxlevel=commentlength.getLevel();
        }
    }
for(Comment comment:comments){
    if(comment.getTid().equalsIgnoreCase(tidCurr) && comment.getLevel()==1){
       %>
    <div class='message-content'>
        <table class='table-main'>
            <tr><td>Posted by: <%=comment.getUsername()%> =>  <span><%=comment.getTitle()%></span></td><td class='replycheckbox' style='visibility: hidden'><input type='checkbox' name='replycid' value='comment:<%=comment.getCid()%>'>Reply</td></tr>
            <tr><td><img src='fb.png' alt=""><div class="smallimg">
                <img class="smallimg-item" src="fb.png" alt="">
                <img class="smallimg-item" src="fb.png" alt=""></div></td><td><%=comment.getMessage()%></td></tr>
            <tr><td></td><td colspan='2'><button>Edit</button><button>Delete</button></td></tr>

          <% String html=  printTable(comments, "comment:"+comment.getCid(), 2, maxlevel, tidCurr, "", comment.getTitle()); %>
            <%=html%>
        </table>
    </div>
    <br>
    <%}}%>
</form>

</body>
</html>

<%!
public String printTable(ArrayList<Comment> comments,String cid, int level,int maxlevel,String tidCurr, String html, String replied_comment){
   String returnhtml="";
    for(Comment comment:comments){
        if(comment.getTid().equalsIgnoreCase(tidCurr)){
            System.out.println("outside inner table loop");
        if(comment.getLevel()==level && comment.getReply_cid().equalsIgnoreCase(cid)){
            System.out.println("inside inner table loop");
            int tablewidth = 1030-level*50;
        html+= "  <tr>  <table class='table-inner' style='width:"+tablewidth+"px'>" +
                "            <tr><td>Posted by:"+ comment.getUsername()+" => <span>"+comment.getTitle()+"</span> replied to: ("+replied_comment+") </td><td class='replycheckbox' style='visibility: hidden'><input type='checkbox' name='replycid' value='comment:"+comment.getCid()+"'>Reply</td></tr>" +
" <tr> <td><img src='fb.png' alt=\"\"><div class=\"smallimg\">\n" +
                "            <img class=\"smallimg-item\" src=\"fb.png\" alt=\"\">" +
                "            <img class=\"smallimg-item\" src=\"fb.png\" alt=\"\"></div></td> <td>"+comment.getMessage()+"</td></tr> " +
" <tr> <td></td> <td colspan='2'> <button>Edit</button> <button>Delete</button> </td> </tr>  ";

        int level1 = level+1;
        String cid1 = "comment:"+comment.getCid();
        if(level<=maxlevel){
            System.out.println("Before return html "+returnhtml+" level: "+level1);
            html = printTable(comments,cid1, level1, maxlevel, tidCurr, html, comment.getTitle());
            level1=level;
            System.out.println("After return html "+returnhtml+" level: "+level1);
        }
        else{
            System.out.println("Before html "+returnhtml+" level: "+level1);
            html+="</table></tr>";
            System.out.println("After html "+returnhtml+" level: "+level1);
        }

        }
        }
    }
    System.out.println("last return html "+returnhtml+" level: "+level);
        return html;
    }%>



