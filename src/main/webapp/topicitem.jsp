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
    <title>Topic</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<div class="message-form">
    <form action="insertServlet" method="post" enctype="multipart/form-data">
    <table>
        <tr><td>Nickname:</td><td><input type="text" name="nickname" placeholder="nickname"></td></tr>
        <tr><td>Title:</td><td><input type="text" name="title" placeholder="title"></td></tr>
        <tr><td>Password:</td><td><input type="text" name="password" placeholder="password"></td></tr>
        <tr><td>Mode:</td><td><input id="post-mode" name="post-mode" value="true" type="checkbox"><label for="post-mode"> Reply</label></td></tr>
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
        <tr><td></td><td><button type="submit">Post</button></td></tr>
    </table>
    <textarea class="post-message" name="message" cols="30" rows="10" placeholder="Write your message here..."></textarea>
    </form>
</div>
<nav class="nav-bar">Categories : General | Video Games | Football | Misc </nav>
<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: mgezici =></td></tr>
        <tr><td><img src="fb.png" alt=""><div class="smallimg">
            <img class="smallimg-item" src="fb.png" alt="">
            <img class="smallimg-item" src="fb.png" alt=""></div></td>
            <td> <span>Header</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae neque magni perferendis ullam labore totam ea voluptates aspernatur vero itaque repellat, quidem placeat repellendus laudantium sunt alias laboriosam aperiam!
                Consequuntur, ut exercitationem alias molestiae vel facere ullam cum aliquid voluptates officia culpa sit consectetur, nisi eum? Eius, minima mollitia perspiciatis harum sit veritatis assumenda expedita. Dignissimos quod dolorum iusto?
                Quae, earum alias. Magni amet sunt, aut sequi vero cumque a repellendus corporis assumenda qui architecto deleniti, ipsum necessitatibus eveniet tempore nobis doloremque nostrum blanditiis excepturi fugiat eaque hic ab! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Tempore doloremque saepe repudiandae nostrum sunt doloribus maiores temporibus voluptates natus voluptatum tenetur fuga, magni sit recusandae laboriosam ducimus corrupti, dicta voluptas.
                Corrupti hic deleniti temporibus iste modi quis omnis dignissimos! Molestiae libero veniam quaerat voluptas tempore, tenetur minus quasi iusto nulla et pariatur est aut nostrum possimus reiciendis ea quibusdam numquam.
                Et a odit excepturi nostrum? Tenetur quibusdam ut corrupti iste! Eligendi minus quidem quia, sapiente error et corrupti porro quisquam, architecto, aspernatur voluptatibus aut aliquid veniam possimus officiis voluptatem nisi?
                Recusandae, cumque, neque quasi quod amet qui quidem perferendis fuga tenetur est esse numquam nulla nihil beatae magnam, veniam autem vitae aperiam deleniti! Fugiat maxime vel voluptatum eaque. Dolorum, cum!
                Harum sint neque dolor consequuntur, rerum repellat in modi delectus perspiciatis, a nulla id iste! Beatae officia non veniam adipisci harum in dolor culpa iure asperiores fugiat, facilis modi deleniti?
                Doloribus adipisci corrupti sapiente sed velit voluptas debitis perferendis nobis totam minus quo quasi, magni sunt quibusdam, aliquam dolor id vero dolore quae itaque ut iste! Quos quam nam autem!
                Nobis, accusantium. Distinctio eaque, id vitae, recusandae omnis sunt possimus perspiciatis eveniet qui quibusdam odit fugiat dolorum. Magni aliquam nulla autem deserunt? Possimus, consectetur. Harum aliquid natus recusandae non voluptates.
                Amet dicta possimus tempora ipsam illum eveniet voluptatum suscipit temporibus tempore provident commodi dolores architecto quos corrupti inventore facilis, eum laborum? Tenetur nisi dolor et facere sunt commodi illum consectetur?
                Commodi mollitia dolorem architecto consequatur ex ea, atque laudantium adipisci modi a delectus fuga, necessitatibus veritatis ab tenetur natus, placeat sapiente saepe ratione magni repellendus tempore iure est. Quia, ut.
                Ipsum, itaque voluptates eum est hic vitae tempora consectetur laboriosam dolor atque corporis quis magnam sint nobis ducimus suscipit porro incidunt voluptatem beatae? Fugit, voluptates animi odio assumenda ratione sed.</td></tr>
        <tr><td></td><td colspan="2"><button>A</button><button>B</button><button>C</button><button>D</button></td></tr>
    </table></div>
<br>

<div class="message-content">
    <table class="table-main">
        <tr><td>Posted by: mgezici =></td></tr>
        <tr><td><img src="fb.png" alt=""></td><td> <span>Header</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Nemo vitae neque magni perferendis ullam labore totam ea voluptates aspernatur vero itaque repellat, quidem placeat repellendus laudantium sunt alias laboriosam aperiam!
            Consequuntur, ut exercitationem alias molestiae vel facere ullam cum aliquid voluptates officia culpa sit consectetur, nisi eum? Eius, minima mollitia perspiciatis harum sit veritatis assumenda expedita. Dignissimos quod dolorum iusto?
            Quae, earum alias. Magni amet sunt, aut sequi vero cumque a repellendus corporis assumenda qui architecto deleniti, ipsum necessitatibus eveniet tempore nobis doloremque nostrum blanditiis excepturi fugiat eaque hic ab! Lorem ipsum, dolor sit amet consectetur adipisicing elit. Tempore doloremque saepe repudiandae nostrum sunt doloribus maiores temporibus voluptates natus voluptatum tenetur fuga, magni sit recusandae laboriosam ducimus corrupti, dicta voluptas.
            Corrupti hic deleniti temporibus iste modi quis omnis dignissimos! Molestiae libero veniam quaerat voluptas tempore, tenetur minus quasi iusto nulla et pariatur est aut nostrum possimus reiciendis ea quibusdam numquam.
            Et a odit excepturi nostrum? Tenetur quibusdam ut corrupti iste! Eligendi minus quidem quia, sapiente error et corrupti porro quisquam, architecto, aspernatur voluptatibus aut aliquid veniam possimus officiis voluptatem nisi?
            Recusandae, cumque, neque quasi quod amet qui quidem perferendis fuga tenetur est esse numquam nulla nihil beatae magnam, veniam autem vitae aperiam deleniti! Fugiat maxime vel voluptatum eaque. Dolorum, cum!
            Harum sint neque dolor consequuntur, rerum repellat in modi delectus perspiciatis, a nulla id iste! Beatae officia non veniam adipisci harum in dolor culpa iure asperiores fugiat, facilis modi deleniti?
            Doloribus adipisci corrupti sapiente sed velit voluptas debitis perferendis nobis totam minus quo quasi, magni sunt quibusdam, aliquam dolor id vero dolore quae itaque ut iste! Quos quam nam autem!
            Nobis, accusantium. Distinctio eaque, id vitae, recusandae omnis sunt possimus perspiciatis eveniet qui quibusdam odit fugiat dolorum. Magni aliquam nulla autem deserunt? Possimus, consectetur. Harum aliquid natus recusandae non voluptates.
            Amet dicta possimus tempora ipsam illum eveniet voluptatum suscipit temporibus tempore provident commodi dolores architecto quos corrupti inventore facilis, eum laborum? Tenetur nisi dolor et facere sunt commodi illum consectetur?
            Commodi mollitia dolorem architecto consequatur ex ea, atque laudantium adipisci modi a delectus fuga, necessitatibus veritatis ab tenetur natus, placeat sapiente saepe ratione magni repellendus tempore iure est. Quia, ut.
            Ipsum, itaque voluptates eum est hic vitae tempora consectetur laboriosam dolor atque corporis quis magnam sint nobis ducimus suscipit porro incidunt voluptatem beatae? Fugit, voluptates animi odio assumenda ratione sed.</td></tr>
        <tr><td></td><td colspan="2"><button>A</button><button>B</button><button>C</button><button>D</button></td></tr>
        <tr><table class="table-inner">
            <tr> <td>Posted by: replier34 =></td> </tr>
            <tr><td><img src="fb.png" alt=""></td><td> <span>Header</span> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Unde commodi nostrum doloremque voluptatem neque, praesentium molestiae, molestias aliquid officia voluptates et dolore quibusdam architecto optio rerum culpa libero sunt? Quod.
                Excepturi reiciendis mollitia ducimus fuga. Quis magni ipsa quibusdam numquam exercitationem eveniet, quia accusantium reiciendis voluptatem quas sed hic sint. Facilis porro consequatur asperiores dolorem deleniti tenetur vitae aspernatur dicta?
                Provident vel molestiae nesciunt excepturi vero rerum ipsa fuga inventore assumenda suscipit? Ad enim, autem possimus, iste ducimus dignissimos perferendis quasi est inventore repudiandae iusto, recusandae blanditiis modi excepturi maiores.
                Dolorum, rem! Voluptatem accusantium reprehenderit minus minima est amet voluptatum deserunt odio quibusdam. Atque, accusantium saepe nemo praesentium quam suscipit ab error amet tempore sed cupiditate repellat soluta dolorem voluptatum?
                Porro totam neque cum. Accusamus ratione fugit inventore dolorum maiores itaque nesciunt exercitationem, animi placeat odio aliquid tempore, qui sunt voluptas ducimus assumenda architecto doloribus facilis fugiat non sapiente. Harum.
                Repellendus, molestias esse nesciunt accusantium impedit quibusdam laborum doloremque praesentium eligendi animi vitae ducimus consectetur illo cupiditate. Et iste amet ullam accusamus, deleniti ipsam inventore repellat nulla, omnis sint exercitationem.
                Doloremque velit earum atque neque quaerat quod minima exercitationem iusto perferendis omnis commodi deserunt dolore et quae consequatur illum repellat quidem aut nihil, eligendi delectus eos? Voluptate beatae eos vitae!
                Libero obcaecati possimus suscipit itaque, quod sit. Quos, atque. Explicabo sequi corrupti qui ut totam eos id laboriosam, beatae ipsum sunt facilis. Perspiciatis repellendus, veritatis esse totam similique ea quidem!
                Ducimus autem sapiente est culpa cupiditate, molestiae quos quasi ipsam officia dicta similique, pariatur voluptatibus ea, accusantium vitae reiciendis. Laborum error, culpa ea vero explicabo officiis at maxime aliquid numquam!
                Debitis fuga voluptatem nam officiis iusto eum quis nisi adipisci perferendis nemo error qui, possimus dolores commodi quisquam harum aperiam esse repudiandae. Laborum enim deserunt fugit porro, harum inventore ad!
                Et perspiciatis vitae repudiandae maxime voluptas veritatis sequi, provident ea voluptatem magnam! Dolores numquam eius consequatur, doloribus ex consectetur eligendi error blanditiis quam, dolore, labore facere reiciendis sit praesentium nisi!
                Nihil illo labore exercitationem est harum quidem facilis optio, dolorem, ducimus odit nesciunt in voluptate quibusdam dignissimos hic sit non numquam cupiditate enim omnis sunt? Saepe velit assumenda in id.</td></tr>
            <tr><td></td><td colspan="2"><button>A</button><button>B</button><button>C</button><button>D</button></td></tr>
        </table></tr>

    </table>
</div>

</body>
</html>
