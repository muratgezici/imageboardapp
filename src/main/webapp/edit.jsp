<%@ page import="db.Topic" %>
<%@ page import="db.Comment" %><%--
  Created by IntelliJ IDEA.
  User: Sir_Tastical
  Date: 30.6.2022
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <link rel="stylesheet" href="style.css">
    <title>Title</title>
</head>
<body>
<form action="insertServlet" method="post" enctype="multipart/form-data">

        <%
            String type = (String) session.getAttribute("object_type");
            if(type.equalsIgnoreCase("topic")){
            Topic topic = (Topic) session.getAttribute("object_instance");%>

    <div class="message-form">
        <table>
            <tr><td>Nickname:</td><td><input type="text" name="nickname" placeholder="nickname" value="<%=topic.getOwner()%>" readonly></td></tr>
            <tr><td>Title:</td><td><input type="text" name="title" placeholder="title" value="<%=topic.getTitle()%>" readonly></td></tr>

            <tr><td>Images:</td><td><%--suppress XmlDuplicatedId --%><div id="imgdiv">
<%--suppress XmlDuplicatedId --%>
                <input id="file_1" name="file_1" type="file">
            </div></td></tr>
            <input type="text" hidden name="comingfromedit" value="topic">
            <input type="hidden" name="tidCurrent" value="<%=topic.getTid()%>">
            <input type="hidden" name="currentitem" value="<%=topic.getTid()%>">
            <tr><td></td><td><button type="submit" name="jsplocation" value="topicitem">Post</button></td></tr>
        </table>
        <textarea class="post-message" name="message" cols="30" rows="10" placeholder="<%=topic.getMessage()%>"></textarea>

    </div>

            <%}else{
            Comment comment = (Comment) session.getAttribute("object_instance");%>
    <div class="message-form">
        <table>
            <tr><td>Nickname:</td><td><input type="text" name="nickname" placeholder="nickname" value="<%=comment.getUsername()%>" readonly></td></tr>
            <tr><td>Title:</td><td><input type="text" name="title" placeholder="title" value="<%=comment.getTitle()%>" readonly></td></tr>

            <tr><td>Images:</td><td><%--suppress XmlDuplicatedId --%><div id="imgdiv">
<%--suppress XmlDuplicatedId --%>
                <input id="file_1" name="file_1" type="file">
            </div></td></tr>
            <input type="text" hidden name="comingfromedit" value="comment">
            <input type="hidden" name="tidCurrent" value="<%=comment.getTid()%>">
            <input type="hidden" name="currentitem" value="<%=comment.getCid()%>">
            <tr><td></td><td><button type="submit" name="jsplocation" value="topicitem">Post</button></td></tr>
        </table>
        <textarea class="post-message" name="message" cols="30" rows="10" placeholder="text goes here.."><%=comment.getMessage()%></textarea>

    </div>




           <% }
        %>

</form>
</body>
</html>
