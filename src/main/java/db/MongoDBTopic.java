package db;

import com.mongodb.client.*;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.model.GridFSUploadOptions;
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
import java.io.UnsupportedEncodingException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class MongoDBTopic {
    public static MongoCollection ConnectionProducts() {
        MongoClient mongoClient1 = MongoClients.create("mongodb://admin_user:admin_pass@10.10.10.241:27017/");
        MongoDatabase database = mongoClient1.getDatabase("imageboard-mgezici");
        System.out.println(database);
        MongoCollection collection = database.getCollection("topics");

        ArrayList<String> as = new ArrayList();
        return collection;
    }
        public static Topic MongoGetTopic (String _id){
           MongoCollection collection = ConnectionProducts();
            FindIterable<Document> fi = collection.find();
            MongoCursor<Document> cursor = fi.iterator();
            try {
                while (cursor.hasNext()) {
                    Document temp = cursor.next();

                    String id = temp.getObjectId("_id").toString();

                    if(id.equals(_id)){
                        String title = temp.getString("title");
                        String message = temp.getString("message");
                        ObjectId files = temp.getObjectId("files");
                        String category = temp.getString("category");
                        String owner = temp.getString("owner");
                        String password = temp.getString("password");



                        //ArrayList<String> tags = (ArrayList<String>) temp.getList("tags", String.class);
                            Topic topic = new Topic(id,title,message,files,category,owner,password);
                        return topic;
                    }
                }
            } finally {
                cursor.close();
            }
            return null;
        }
    public static List<Topic> MongoGetTopics () {
        MongoCollection collection = ConnectionProducts();
        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        List<Topic> alltopics= new ArrayList<Topic>();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();

                String id = temp.getObjectId("_id").toString();
                String title = temp.getString("title");
                String message = temp.getString("message");
                ObjectId files = temp.getObjectId("files");
                String category = temp.getString("category");
                String owner = temp.getString("owner");
                String password = temp.getString("password");

                String file_byte = temp.getString("imagebase64");



                Topic topic = new Topic(id,title,message,files,category,owner,password, file_byte);
                alltopics.add(topic);
                }

            }
         finally {
            cursor.close();

        }
        return alltopics;
    }

    public static List<Topic> MongoGetProductsFilter (String search){
        MongoCollection collection = ConnectionProducts();
        FindIterable<Document> fi = collection.find();
        MongoCursor<Document> cursor = fi.iterator();
        List<Topic> alltopics = new ArrayList<Topic>();
        try {
            while (cursor.hasNext()) {
                Document temp = cursor.next();

                String category = temp.getString("category");
                StringMatch nextCategory = null;
                String[] searchArray = search.split(" ");

                for(String s:searchArray){
                    Horspool stringSearch = new Horspool(s.toLowerCase());
                    CharProvider textCategory = new StringCharProvider(category.toLowerCase(),0);
                    StringFinder finderCategory = stringSearch.createFinder(textCategory);
                    if(nextCategory == null)
                    nextCategory = finderCategory.findNext();
                }

                if(nextCategory!=null){
                    String id = temp.getObjectId("_id").toString();
                    String title = temp.getString("title");
                    String message = temp.getString("message");
                    ObjectId files = temp.getObjectId("files");
                    String owner = temp.getString("owner");
                    String password = temp.getString("password");

                    //ArrayList<String> tags = (ArrayList<String>) temp.getList("tags", String.class);
                    Topic topic = new Topic(id,title,message,files,category,owner,password);
                    alltopics.add(topic);
                }
            }
        } finally {
            cursor.close();
        }
        return alltopics;
    }


        public static String mongoInsertTopic(String title, String message, String files, String category, String owner, String password, File file_1){
            MongoCollection collection = ConnectionProducts();
            Timestamp timestamp = new Timestamp(System.currentTimeMillis());

         ObjectId oid =  MongoDBFile.insertFile(file_1);
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

                    append("title", title).append("message", message).
                    append("files", oid).append("category", category).
                    append("owner", owner).append("password", password).append("imagebase64", encoded);

            collection.insertOne(document1);
            ObjectId id = document1.getObjectId("_id");
            String tid = id.toString();
            return tid;
        }

        public static boolean MongoRemoveTopic(String _id){
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

public static void MongoDBUpdateTopic(String _id, String title, String message, String[] files, String category, String owner, String password){
    MongoCollection collection = ConnectionProducts();
    FindIterable<Document> fi = collection.find();
    MongoCursor<Document> cursor = fi.iterator();
    try {
        while (cursor.hasNext()) {
            Document temp = cursor.next();
            if(_id.equals(temp.getObjectId("_id").toString())){

                Document updatedVal = new Document().
                        append("title", title).
                        append("message", message).append("files", files).
                        append("price", category).append("owner", owner).
                        append("password", password);
                Bson updateOp = new Document("$set", updatedVal);
               collection.updateOne(temp,updateOp);
            }
        }
    } finally {
        cursor.close();
    }
}
}