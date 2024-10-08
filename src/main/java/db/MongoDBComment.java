package db;

import com.mongodb.client.*;
import net.amygdalum.stringsearchalgorithms.io.CharProvider;
import net.amygdalum.stringsearchalgorithms.io.StringCharProvider;
import net.amygdalum.stringsearchalgorithms.search.Horspool;
import net.amygdalum.stringsearchalgorithms.search.StringFinder;
import net.amygdalum.stringsearchalgorithms.search.StringMatch;
import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.io.File;
import java.io.IOException;
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

    public static Comment MongoGetComment(String _id) {
        MongoCollection collection = ConnectionProducts();
        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();
                String id = temp.getObjectId("_id").toString();

                if (id.equals(_id)) {
                    String tid = temp.getString("tid");
                    String replyflag = temp.getString("reply_flag");
                    String title = temp.getString("title");
                    String message = temp.getString("message");
                    String files = temp.getString("files");
                    String owner = temp.getString("username");
                    String password = temp.getString("password");
                    int level = temp.getInteger("level");
                    String add_date = temp.getString("add_date");
                    String file_byte = temp.getString("imagebase64");
                    boolean isDeleted = temp.getBoolean("isDeleted");
                    //ArrayList<String> tags = (ArrayList<String>) temp.getList("tags", String.class);
                    if (replyflag.equalsIgnoreCase("true")) {
                        String replycid = temp.getString("replycid");
                        Comment comment = new Comment(id, tid, replyflag, replycid, title, message, files, owner, password, level, file_byte, isDeleted);
                        return comment;
                    } else {
                        Comment comment = new Comment(id, tid, replyflag, title, message, files, owner, password, level, file_byte, isDeleted);
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
        List<Comment> allcomments = new ArrayList<Comment>();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();
                String id = temp.getObjectId("_id").toString();
                String tid = temp.getString("tid");
                String replyflag = temp.getString("reply_flag");
                String title = temp.getString("title");
                String message = temp.getString("message");
                String files = temp.getString("files");
                String owner = temp.getString("username");
                String password = temp.getString("password");
                String file_byte = temp.getString("imagebase64");
                boolean isDeleted = temp.getBoolean("isDeleted");
                int level = temp.getInteger("level");

                if (replyflag.equalsIgnoreCase("true")) {
                    String replycid = temp.getString("reply_cid");
                    Comment comment = new Comment(id, tid, replyflag, replycid, title, message, files, owner, password, level, file_byte, isDeleted);
                    allcomments.add(comment);
                } else {
                    Comment comment = new Comment(id, tid, replyflag, title, message, files, owner, password, level, file_byte, isDeleted);
                    allcomments.add(comment);
                }

            }

        } finally {
            cursor.close();
        }
        return allcomments;
    }

    public static String mongoInsertComment(String tid, String reply_flag, String reply_cid, String title, String message, String files, String username, String password, File file_1) {
        MongoCollection collection = ConnectionProducts();
        Timestamp timestamp = new Timestamp(System.currentTimeMillis());
        ArrayList<Comment> comments = (ArrayList<Comment>) MongoDBComment.MongoGetComments();
        int level1 = 1;
        if (comments.size() > 0) {
            for (Comment comm : comments) {
                String search = "comment:" + comm.getCid();
                if (search.equalsIgnoreCase(reply_cid)) {
                    level1 = comm.getLevel() + 1;
                }
            }
        }
        ObjectId oid = MongoDBFile.insertFile(file_1);
        byte[] fileContent = new byte[0];
        try {
            fileContent = FileUtils.readFileToByteArray(new File(file_1.getPath()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Base64 codec = new Base64();
        String encoded = codec.encodeBase64String(fileContent);
        //System.out.println("in mpngotopic inser: "+encoded);

        Document document1 = new Document().
                append("tid", tid).append("reply_flag", reply_flag).
                append("reply_cid", reply_cid).append("title", title).
                append("message", message).append("files", files).
                append("username", username).append("password", password).append("level", level1).append("imagebase64", encoded).append("isDeleted",false);

        collection.insertOne(document1);
        ObjectId id = document1.getObjectId("_id");
        String cid1 = id.toString();
        return cid1;
    }

    public static void MongoDBDeleteComment(String _id, String tid, String reply_flag, String reply_cid, String title, String username) {
        MongoCollection collection = ConnectionProducts();
        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();
                if (_id.equals(temp.getObjectId("_id").toString())) {

                    Document updatedVal = new Document().
                            append("tid", tid).append("reply_flag", reply_flag).
                            append("reply_cid", reply_cid).append("title", title).
                            append("message", "Message deleted").append("files", " ").
                            append("username", username).append("password", " ").append("imagebase64", " ").append("isDeleted", true);
                    Bson updateOp = new Document("$set", updatedVal);
                    collection.updateOne(temp, updateOp);
                }
            }
        } finally {
            cursor.close();
        }
    }

    public static void MongoDBUpdateComment(String _id, String message, File file_1) {
        MongoCollection collection = ConnectionProducts();
        byte[] fileContent = new byte[0];
        try {
            fileContent = FileUtils.readFileToByteArray(new File(file_1.getPath()));
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        Base64 codec = new Base64();
        String encoded = codec.encodeBase64String(fileContent);

        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();
                if (_id.equals(temp.getObjectId("_id").toString())) {

                    Document updatedVal = new Document().
                            append("message", message).append("imagebase64", encoded);
                    Bson updateOp = new Document("$set", updatedVal);
                    collection.updateOne(temp, updateOp);
                }
            }
        } finally {
            cursor.close();
        }
    }
}