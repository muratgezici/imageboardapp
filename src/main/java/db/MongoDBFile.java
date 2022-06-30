package db;

import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoCollection;
import com.mongodb.client.MongoDatabase;
import com.mongodb.client.gridfs.GridFSBucket;
import com.mongodb.client.gridfs.GridFSBuckets;
import com.mongodb.client.gridfs.GridFSDownloadStream;
import com.mongodb.client.gridfs.GridFSUploadStream;
import com.mongodb.client.gridfs.model.GridFSFile;
import com.mongodb.client.gridfs.model.GridFSUploadOptions;
import com.mongodb.client.model.Filters;
import com.mongodb.client.model.Sorts;

import org.apache.commons.codec.binary.Base64;
import org.bson.Document;
import org.bson.conversions.Bson;
import org.bson.types.ObjectId;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

public class MongoDBFile {
    public static MongoDatabase ConnectionFiles() {
        MongoClient mongoClient1 = MongoClients.create("mongodb://admin_user:admin_pass@10.10.10.241:27017/");
        MongoDatabase database = mongoClient1.getDatabase("imageboard-mgezici");
        System.out.println(database);
        MongoCollection collection = database.getCollection("files");
        ArrayList<String> as = new ArrayList();
        return database;
    }
    public static ObjectId insertFile(File file_1){
        MongoDatabase database = ConnectionFiles();
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "files");
        System.out.println("File 1 in mongodbfile: "+file_1.getPath());
        try (InputStream streamToUploadFrom = new FileInputStream(file_1.getPath()) ) {
            GridFSUploadOptions options = new GridFSUploadOptions()
                    .chunkSizeBytes(1048576);
            ObjectId fileId = gridFSBucket.uploadFromStream(file_1.getName(), streamToUploadFrom, options);
            System.out.println("The file id of the uploaded file is: " + fileId.toHexString());
        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        GridFSUploadStream uploadStream = gridFSBucket.openUploadStream(file_1.getName());
        ObjectId fileid = uploadStream.getObjectId() ;
        uploadStream.close() ;
        return fileid;
    }


    public static String getFile(ObjectId fid){
        MongoDatabase database = ConnectionFiles();
        GridFSBucket gridFSBucket = GridFSBuckets.create(database, "files");

        GridFSDownloadStream downloadStream = gridFSBucket.openDownloadStream(fid);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        int data = downloadStream.read();
        while (data >= 0) {
            outputStream.write((char) data);
            data = downloadStream.read();
        }
        byte[] bytesToWriteTo = outputStream.toByteArray();
        downloadStream.close();
        System.out.println(new String(bytesToWriteTo, StandardCharsets.UTF_8));
        System.out.println("donnload stream: "+downloadStream.getGridFSFile().getId()+"   "+bytesToWriteTo);
        System.out.println("in filedb: "+bytesToWriteTo.toString());

        ;
        byte[] encodeBase64 = Base64.encodeBase64(bytesToWriteTo);
        System.out.println("ecodebase64: "+encodeBase64);
        Base64 codec = new Base64();
        String encoded = codec.encodeBase64String(encodeBase64);
        System.out.println("ecodededdd: "+encoded);
            return encoded;





    }

}

