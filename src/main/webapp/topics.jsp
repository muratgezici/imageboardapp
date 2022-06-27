<%--
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
    <style>
        .message-content .table-main img{
            width: 100px;
            height: 100px;
            object-fit: contain;
            background-color: rgb(161, 161, 161);

        }
    </style>
</head>
<body>
<div class="message-form">
    <table>
        <tr><td>Nickname:</td><td><input type="text" placeholder="nickname"></td></tr>
        <tr><td>Title:</td><td><input type="text" placeholder="title"></td></tr>
        <tr><td>Password:</td><td><input type="text" placeholder="password"></td></tr>
        <tr><td>Mode:</td><td><input id="post-mode" type="checkbox"><label for="post-mode"> Reply</label></td></tr>
        <tr><td>Images:</td><td><div id="imgdiv">
            <input id="img1" type="file">
            <input id="img2" type="file">
            <input id="img3" type="file">
        </div></td></tr>
        <tr><td></td><td><button type="submit">Post</button></td></tr>
    </table>
    <textarea class="post-message" cols="30" rows="10" placeholder="Write your message here..."></textarea>
</div>
<nav class="nav-bar">Categories : s a s | b a s | k s a | n b g | e w s</nav>
<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: mgezici =></td></tr>
        <tr><td><img src="fb.png" alt=""></td><td> <span>Header</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae neque magni perferendis ullam labore totam ea voluptates aspernatur vero itaque repellat, quidem placeat repellendus laudantium sunt alias laboriosam aperiam!
            Consequuntur, ut exiae vel facere ullam cum aliquid voluptates officia culpa sit consectetur, nisi eum? Eius, minima mollitia perspiciatis harum sit veritatis assumenda expedita. Dignissimos quod dolorum iusto?
            Quae, earum alias. Magni amet sunt, aut sequi vero cumque a repellendus corporis assumenda qui architecto deleniti, ipsum necessitatibus eveniet tempore nobis doloremque nostrum blanditiis excepturi fugiat eaque hic ab! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Tempore doloremque saepe repudiandae nostrum sunt doloribus maiores temporibus voluptates natus voluptatum tenetur fuga, magni sit recusandae laboriosam ducimus corrupti, dicta voluptas.
            s quis magnam sint nobis ducimus suscipit porro incidunt voluptatem beatae? Fugit, voluptates animi odio assumenda ratione sed. <a href="topicitem.jsp">Continue reading..</a></td></tr>

    </table></div>
<br>
<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: mgezici1 =></td></tr>
        <tr><td><img src="bjk.png" alt=""></td><td> <span>Header</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae neque magni perferendis ullam labore totam ea voluptates aspernatur vero itaque repellat, quidem placeat repellendus laudantium sunt alias laboriosam aperiam!
            Consequuntur, ut exiae vel facere ullam cum aliquid voluptates officia culpa sit consectetur, nisi eum? Eius, minima mollitia perspiciatis harum sit veritatis assumenda expedita. Dignissimos quod dolorum iusto?
            Quae, earum alias. Magni amet sunt, aut sequi vero cumque a repellendus corporis assumenda qui architecto deleniti, ipsum necessitatibus eveniet tempore nobis doloremque nostrum blanditiis excepturi fugiat eaque hic ab! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Tempore doloremque saepe repudiandae nostrum sunt doloribus maiores temporibus voluptates natus voluptatum tenetur fuga, magni sit recusandae laboriosam ducimus corrupti, dicta voluptas.
            s quis magnam sint nobis ducimus suscipit porro incidunt voluptatem beatae? Fugit, voluptates animi odio assumenda ratione sed. <a href="index.html">Continue reading..</a></td></tr>

    </table></div>
<br>
<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: mgezici2 =></td></tr>
        <tr><td><img src="goz.png" alt=""></td><td> <span>Header</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae neque magni perferendis ullam labore totam ea voluptates aspernatur vero itaque repellat, quidem placeat repellendus laudantium sunt alias laboriosam aperiam!
            Consequuntur, ut exiae vel facere ullam cum aliquid voluptates officia culpa sit consectetur, nisi eum? Eius, minima mollitia perspiciatis harum sit veritatis assumenda expedita. Dignissimos quod dolorum iusto?
            Quae, earum alias. Magni amet sunt, aut sequi vero cumque a repellendus corporis assumenda qui architecto deleniti, ipsum necessitatibus eveniet tempore nobis doloremque nostrum blanditiis excepturi fugiat eaque hic ab! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Tempore doloremque saepe repudiandae nostrum sunt doloribus maiores temporibus voluptates natus voluptatum tenetur fuga, magni sit recusandae laboriosam ducimus corrupti, dicta voluptas.
            s quis magnam sint nobis ducimus suscipit porro incidunt voluptatem beatae? Fugit, voluptates animi odio assumenda ratione sed. <a href="index.html">Continue reading..</a></td></tr>

    </table></div>
<br>
</body>
</html>
