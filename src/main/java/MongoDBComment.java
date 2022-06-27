import com.mongodb.client.*;
import net.amygdalum.stringsearchalgorithms.io.CharProvider;
import net.amygdalum.stringsearchalgorithms.io.StringCharProvider;
import net.amygdalum.stringsearchalgorithms.search.Horspool;
import net.amygdalum.stringsearchalgorithms.search.StringFinder;
import net.amygdalum.stringsearchalgorithms.search.StringMatch;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MongoDBComment {
    public static MongoCollection ConnectionProducts() {
        MongoClient mongoClient1 = MongoClients.create("mongodb://admin_user:admin_pass@10.10.10.241:27017/");
        MongoDatabase database = mongoClient1.getDatabase("imageboard-mgezici");
        System.out.println(database);
        MongoCollection collection = database.getCollection("comments");
        ArrayList<String> as = new ArrayList();
        return collection;
    }
        public static Comment MongoGetComment (String _id){
           MongoCollection collection = ConnectionProducts();
            FindIterable<Document> fi = collection.find();
            MongoCursor<Document> cursor = fi.iterator();
            try {
                while (cursor.hasNext()) {
                    Document temp = cursor.next();
                    String id = temp.getObjectId("_id").toString();

                    if(id.equals(_id)){
                        String tid = temp.getString("tid");
                        String replyflag = temp.getString("replyflag");
                        String title = temp.getString("title");
                        String message = temp.getString("message");
                        String files = temp.getString("files");
                        String owner = temp.getString("owner");
                        String password = temp.getString("password");

                        String add_date = temp.getString("add_date");
                        Date date1=null,date2=null;
                        try {
                            date1 = new SimpleDateFormat("yyyy-mm-dd").parse(add_date);
                        } catch (ParseException e) {
                            throw new RuntimeException(e);
                        }
                        //ArrayList<String> tags = (ArrayList<String>) temp.getList("tags", String.class);
                        if(replyflag.equalsIgnoreCase("true")){
                            String replycid = temp.getString("replycid");
                            Comment comment = new Comment(id,tid,replyflag,replycid,title,message,files,owner,password);
                            return comment;
                        }
                        else{
                            Comment comment = new Comment(id,tid,replyflag,title,message,files,owner,password);
                            return comment;
                        }
                    }
                }
            } finally {
                cursor.close();
            }
            return null;
        }
    public static List<Comment> MongoGetComments() {
        MongoCollection collection = ConnectionProducts();
        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        List<Comment> allcomments= new ArrayList<Comment>();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();
                String id = temp.getObjectId("_id").toString();
                String tid = temp.getString("tid");
                String replyflag = temp.getString("replyflag");
                String title = temp.getString("title");
                String message = temp.getString("message");
                String files = temp.getString("files");
                String owner = temp.getString("owner");
                String password = temp.getString("password");

                if(replyflag.equalsIgnoreCase("true")){
                    String replycid = temp.getString("replycid");
                    Comment comment = new Comment(id,tid,replyflag,replycid,title,message,files,owner,password);
                    allcomments.add(comment);
                }
                else{
                    Comment comment = new Comment(id,tid,replyflag,title,message,files,owner,password);
                    allcomments.add(comment);
                }

                }

            }
         finally {
            cursor.close();
        }
        return allcomments;
    }
        public static String mongoInsertComment(String tid, String reply_flag, String reply_cid, String title, String message, String files, String username, String password){
            MongoCollection collection = ConnectionProducts();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());
            Document document1 = new Document().
                    append("tid",tid).append("reply_flag", reply_flag).
                    append("reply_cid",reply_cid).append("title", title).
                    append("message", message).append("files", files).
                    append("username", username).append("password", password);

            collection.insertOne(document1);
            ObjectId id = document1.getObjectId("_id");
            String cid1 = id.toString();
            return cid1;
        }

        public static boolean MongoRemoveComment(String _id){
            MongoCollection collection = ConnectionProducts();

            FindIterable<Document> fi = collection.find();
            MongoCursor<Document> cursor = fi.iterator();
            try {
                while (cursor.hasNext()) {
                    Document temp = cursor.next();
                    if(_id.equalsIgnoreCase(temp.getObjectId("_id").toString())){
                        collection.deleteOne(temp);
                        return true;
                    }
                }
            } finally {
                cursor.close();
            }
            return false;
            }

public static void MongoDBUpdateComment(String _id, String tid, String reply_flag, String reply_cid, String title, String message, String files, String username, String password){
    MongoCollection collection = ConnectionProducts();
    FindIterable<Document> fi = collection.find();
    MongoCursor<Document> cursor = fi.iterator();
    try {
        while (cursor.hasNext()) {
            Document temp = cursor.next();
            if(_id.equals(temp.getObjectId("_id").toString())){

                Document updatedVal = new Document().
                        append("tid",tid).append("reply_flag", reply_flag).
                        append("reply_cid",reply_cid).append("title", title).
                        append("message", message).append("files", files).
                        append("username", username).append("password", password);
                Bson updateOp = new Document("$set", updatedVal);
               collection.updateOne(temp,updateOp);
            }
        }
    } finally {
        cursor.close();
    }
}
}