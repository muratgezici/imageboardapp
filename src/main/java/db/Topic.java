package db;

import org.bson.types.ObjectId;

public class Topic {
    private String tid;
    private String title;
    private String message;
    private ObjectId fileId;
    private String category;
    private String owner;
    private String password;
    private String file_byte;
    private boolean isDeleted=false;

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public ObjectId getFilereferences() {
        return fileId;
    }

    public void setFilereferences(ObjectId fileId) {
        this.fileId = fileId;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Topic(String title, String message, String category, String owner, String password) {
        this.title = title;
        this.message = message;
        this.category = category;
        this.owner = owner;
        this.password = password;
    }

    public ObjectId getFileId() {
        return fileId;
    }

    public void setFileId(ObjectId fileId) {
        this.fileId = fileId;
    }

    public String getFile_byte() {
        return file_byte;
    }

    public void setFile_byte(String file_byte) {
        this.file_byte = file_byte;
    }

    public Topic(String title, String message, ObjectId fileId, String category, String owner, String password) {
        this.title = title;
        this.message = message;
        this.fileId = fileId;
        this.category = category;
        this.owner = owner;
        this.password = password;
    }

    public Topic(String tid, String title, String message, ObjectId fileId, String category, String owner, String password) {
        this.tid = tid;
        this.title = title;
        this.message = message;
        this.fileId = fileId;
        this.category = category;
        this.owner = owner;
        this.password = password;
    }

    public Topic(String tid, String title, String message, ObjectId fileId, String category, String owner, String password, String file_byte, boolean isDeleted) {
        this.tid = tid;
        this.title = title;
        this.message = message;
        this.fileId = fileId;
        this.category = category;
        this.owner = owner;
        this.password = password;
        this.file_byte = file_byte;
        this.isDeleted = isDeleted;
    }
}
