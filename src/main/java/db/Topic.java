package db;

public class Topic {
    private String tid;
    private String title;
    private String message;
    private String filereferences;
    private String category;
    private String owner;
    private String password;

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

    public String getFilereferences() {
        return filereferences;
    }

    public void setFilereferences(String filereferences) {
        this.filereferences = filereferences;
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

    public Topic(String title, String message, String filereferences, String category, String owner, String password) {
        this.title = title;
        this.message = message;
        this.filereferences = filereferences;
        this.category = category;
        this.owner = owner;
        this.password = password;
    }

    public Topic(String tid, String title, String message, String filereferences, String category, String owner, String password) {
        this.tid = tid;
        this.title = title;
        this.message = message;
        this.filereferences = filereferences;
        this.category = category;
        this.owner = owner;
        this.password = password;
    }
}
