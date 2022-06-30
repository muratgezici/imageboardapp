<%@ page import="java.util.ArrayList" %>
<%@ page import="db.MongoDBTopic" %>
<%@ page import="db.Topic" %><%--
  Created by IntelliJ IDEA.
  User: Sir_Tastical
  Date: 24.6.2022
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Topics</title>
    <link rel="stylesheet" href="style.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <style>
        .message-content .table-main img{
            width: 100px;
            height: 100px;
            object-fit: contain;
            background-color: rgb(161, 161, 161);

        }
    </style>
    <script>
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
    </script>
</head>
<body>
<form action="insertServlet" method="post" enctype="multipart/form-data">
<div class="message-form">
    <%
    ArrayList<Topic> topics = (ArrayList<Topic>) MongoDBTopic.MongoGetTopics();
    %>
        <table>
            <tr><td>Nickname:</td><td><input type="text" name="nickname" placeholder="nickname"></td></tr>
            <tr><td>Title:</td><td><input type="text" name="title" placeholder="title"></td></tr>
            <tr><td>Password:</td><td><input type="text" name="password" placeholder="password"></td></tr>
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
            <tr><td></td><td><button type="submit" name="jsplocation" value="topics">Post</button></td></tr>
        </table>
        <textarea class="post-message" name="message" cols="30" rows="10" placeholder="Write your message here..."></textarea>

</div>
</form>
<nav class="nav-bar">Categories : s a s | b a s | k s a | n b g | e w s</nav>

<%for(Topic topic:topics){%>
<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: <%=topic.getOwner()%> => <span><%=topic.getTitle()%></span></td></tr>
        <tr><td><img src="data:image/png;base64,<%=topic.getFile_byte()%>" id="image<%=topic.getTid()%>" onerror="this.onerror=null;noImage('<%=topic.getTid()%>');">
            <video controls id="video<%=topic.getTid()%>">
            <source type="video/webm" src="data:video/webm;base64,<%=topic.getFile_byte()%>"  onerror="this.onerror=null;noVideo('<%=topic.getTid()%>');">
            </video>
        </td><td>  <%=topic.getMessage()%>
            <form action="redirectServlet" method="post"> <button type="submit" style="background-color:rgb(161, 161, 161);" name="tidCurrent" value="<%=topic.getTid()%>">Continue reading..</button></form></td></tr>
    </table></div>
<br>
<%}%>
</body>
</html>
