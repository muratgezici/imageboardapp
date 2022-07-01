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
        if($("#post-mode").prop('checked') == true){

            $(".replycheckbox.isDeleted-false").css("visibility", "visible");
            $("#categories").css("visibility", "hidden");
        }
        else{
            $(".replycheckbox").css("visibility", "hidden");
            $(".replycheckbox").children().prop("checked", false);
            $("#categories").css("visibility", "visible");
        }
    }
    function replyThis(id){
        console.log("im here replythis!"+$("#replycid-"+id)+" "+$("#post-mode"));

        $("#replycid-"+id).prop("checked", true);
        $("#post-mode").prop('checked' ,true);
        replyVisibility();
    }
    function noImage(id){
        let image=" #image"+id;
        let video=" #video"+id;
        $(image).remove();
        $(video).css("visibility", "visible");
    }
    function noVideo(id){
        let image="#image"+id;
        let video="#video"+id;
        $(video).remove();
        $(image).css("visibility", "visible");
    }
    function openPassword(cid){
        let passzone = "#"+cid+" .modifypasswordzone";
        console.log($(passzone)+" "+passzone);
        $(passzone).css("visibility", "visible");
    }
    function openModifyButtons(cid){
        let passzone = "#"+cid+" .modifypasswordzone";
        let linkzone = "#"+cid+" .modifylinkszone";
        $(passzone).css("visibility", "hidden");
        $(linkzone).css("visibility", "visible");
    }
    function login(pass1 , cid) {
        let pass = event.target.value;
        $.ajax({
            url: "ModifyCheckServlet",
            method: 'GET',
            data: {password: pass, password1: pass1 },
            success: function(responseText){
                    let s = responseText;
                    if(s=="success"){
                        alert(s);
                        openModifyButtons(cid);
                    }
                    else{
                        alert(s);
                    }

                }
        });
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
<div class="message-form" id="top">
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
            <input id="file_1" name="file_1" type="file">
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
<div class="message-content topic-content">
    <table class="table-main" id="replied-<%=topic.getTid()%>">
        <tr class="info-reply"><td>Posted by: <%=topic.getOwner()%> => <span><%=topic.getTitle()%></span></td><td class='replycheckbox isDeleted-<%=topic.isDeleted()%>' style='visibility: hidden'><input type='radio' id='replycid-<%=topic.getTid()%>' name='replycid' value='comment:<%=topic.getTid()%>'>Reply</td></tr>
        <tr><td><img src="data:image/png;base64,<%=topic.getFile_byte()%>" id="image<%=topic.getTid()%>" onerror="this.onerror=null;noImage('<%=topic.getTid()%>');">
            <video controls id="video<%=topic.getTid()%>">
                <source type="video/webm" src="data:video/webm;base64,<%=topic.getFile_byte()%>"  onerror="this.onerror=null;noVideo('<%=topic.getTid()%>');">
            </video></td>
            <td> <%=topic.getMessage()%></td></tr>
        <tr class="isDeleted-<%=topic.isDeleted()%> " id="modifytr-<%=topic.getTid()%>"><td></td><td colspan='2'><td colspan="2"><a onclick="openPassword('modifytr-<%=topic.getTid()%>');" href="#replied-<%=topic.getTid()%>">Modify</a>
            <input class="modifypasswordzone"
                   type="text" onkeydown="return event.key != 'Enter';" style="visibility:hidden;" placeholder="password" onchange="login('<%=topic.getPassword()%>', 'modifytr-<%=topic.getTid()%>')">
            <a class="modifylinkszone" style="visibility:hidden;" href="EditDeleteServlet?tid=<%=topic.getTid()%>&cid=<%=topic.getTid()%>&mode=edit">Edit</a><a class="modifylinkszone" style="visibility:hidden;" href="EditDeleteServlet?tid=<%=topic.getTid()%>&cid=<%=topic.getTid()%>&mode=delete">Delete</a>

            <a onclick="replyThis('<%=topic.getTid()%>');" href="#top" on >Reply</a></td></tr>
    </table></div>

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
    <div class='message-content' style="background-color: rgb(156, 156, 156);">
        <table class='table-main ' id='replied-<%=comment.getCid()%>' style="background-color: rgb(156, 156, 156);">
            <tr><td colspan='2'>Posted by: <%=comment.getUsername()%> =>  <span><%=comment.getTitle()%></span> replied to:
                <a href='#replied-<%=topic.getTid()%>'> (<%=topic.getTitle()%>)</a></td><td class='replycheckbox isDeleted-<%=comment.isDeleted()%>' style='visibility: hidden'><input type='radio' id='replycid-<%=comment.getCid()%>' name='replycid' value='comment:<%=comment.getCid()%>'>Reply</td></tr>
            <tr><td><img src='data:image/png;base64,<%=comment.getFile_byte()%>' id='image<%=comment.getCid()%>' onerror="this.onerror=null;noImage('<%=comment.getCid()%>');">
                <video controls id='video<%=comment.getCid()%>'>
                    <source type='video/webm' src='data:video/webm;base64,<%=comment.getFile_byte()%>'  onerror="this.onerror=null;noVideo('<%=comment.getCid()%>');">
                </video></td><td><%=comment.getMessage()%></td></tr>
            <tr class="isDeleted-<%=comment.isDeleted()%> " id="modifytr-<%=comment.getCid()%>"><td></td><td colspan='2'><td colspan="2"><a onclick="openPassword('modifytr-<%=comment.getCid()%>');" href="#replied-<%=comment.getCid()%>">Modify</a>
                <input class="modifypasswordzone"
                    type="text" onkeydown="return event.key != 'Enter';" style="visibility:hidden;" placeholder="password" onchange="login('<%=comment.getPassword()%>', 'modifytr-<%=comment.getCid()%>')">
                <a class="modifylinkszone" style="visibility:hidden;" href="EditDeleteServlet?tid=<%=comment.getTid()%>&cid=<%=comment.getCid()%>&mode=edit">Edit</a><a class="modifylinkszone" style="visibility:hidden;" href="EditDeleteServlet?tid=<%=topic.getTid()%>&cid=<%=comment.getCid()%>&mode=delete">Delete</a>

                <a onclick="replyThis('<%=comment.getCid()%>');" href="#top" >Reply</a></td></tr>

          <% String html=  printTable(comments, "comment:"+comment.getCid(), 2, maxlevel, tidCurr, "", comment.getTitle(), comment.getCid()); %>
            <%=html%>
        </table>
    </div>
    <%}}%>
</form>

</body>
</html>

<%!
public String printTable(ArrayList<Comment> comments,String cid, int level,int maxlevel,String tidCurr, String html, String replied_comment, String prevCid){
   String returnhtml="";
    for(Comment comment:comments){
        if(comment.getTid().equalsIgnoreCase(tidCurr)){
            System.out.println("outside inner table loop");
        if(comment.getLevel()==level && comment.getReply_cid().equalsIgnoreCase(cid)){
            System.out.println("inside inner table loop");
            int tablewidth = 950-level*50;
            int color = 161 - level*5;
        html+= "  <tr id='replied-"+comment.getCid()+"' style=' background-color: rgb("+color+","+color+", "+color+");'>  <table class='table-inner' style='width:"+tablewidth+"px; background-color: rgb("+color+","+color+", "+color+");border-collapse:collapse'>" +
                "            <tr><td colspan='2'>Posted by:"+ comment.getUsername()+" => <span>"+comment.getTitle()+"</span> <a href='#replied-"+prevCid+"'> ("+replied_comment+")</a> </td><td class='replycheckbox isDeleted-"+comment.isDeleted()+"' style='visibility: hidden'><input type='radio' id='replycid-"+comment.getCid()+"' name='replycid' value='comment:"+comment.getCid()+"'>Reply</td></tr>" +
" <tr> <td><img src='data:image/png;base64,"+comment.getFile_byte()+"' id='image"+comment.getCid()+"' onerror=\"this.onerror=null;noImage('"+comment.getCid()+"');\">" +
" <video controls id='video"+comment.getCid()+"'>" + " <source type='video/webm' src='data:video/webm;base64,"+comment.getFile_byte()+"'onerror=\"this.onerror=null;noVideo('"+comment.getCid()+"');\"> " + " </video>"+ "</td><td>"+comment.getMessage()+"</td></tr> " +
                "<tr class='isDeleted-"+comment.isDeleted()+" ' id='modifytr-"+comment.getCid()+"'><td></td><td colspan='2'><td colspan='2'><a onclick=\"openPassword('modifytr-"+comment.getCid()+"');\" href='#replied-"+comment.getCid()+"'>Modify</a>"+
"<input class='modifypasswordzone'"+
       "type='text' onkeydown=\"return event.key != 'Enter';\" style='visibility:hidden;' placeholder='password' onchange=\"login('"+comment.getPassword()+"', 'modifytr-"+comment.getCid()+"')\">"+
"<a class='modifylinkszone' style='visibility:hidden;' href='EditDeleteServlet?tid="+comment.getTid()+"&cid="+comment.getCid()+"'&mode=edit'>Edit</a><a class='modifylinkszone' style='visibility:hidden;' href='EditDeleteServlet?tid="+comment.getTid()+"&cid="+comment.getCid()+"&mode=delete'>Delete</a>"+
        "<a onclick=\"replyThis('"+comment.getCid()+"')\" href='#top'>Reply</a></td> </tr>  ";

        int level1 = level+1;
        String cid1 = "comment:"+comment.getCid();
        if(level<=maxlevel){
            System.out.println("Before return html "+returnhtml+" level: "+level1);
            html = printTable(comments,cid1, level1, maxlevel, tidCurr, html, comment.getTitle(), comment.getCid());
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



