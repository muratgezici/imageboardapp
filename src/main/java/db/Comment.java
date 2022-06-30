package db;

public class Comment {
    private String cid;
    private String tid;
    private String reply_flag;
    private String reply_cid;
    private String title;
    private String message;
    private String files;
    private String username;
    private String password;
    private int level;
    private String file_byte;

    public String getFile_byte() {
        return file_byte;
    }

    public void setFile_byte(String file_byte) {
        this.file_byte = file_byte;
    }


    public Comment(String cid, String tid, String reply_flag, String reply_cid, String title, String message, String files, String username, String password, int level, String file_byte) {
        this.cid = cid;
        this.tid = tid;
        this.reply_flag = reply_flag;
        this.reply_cid = reply_cid;
        this.title = title;
        this.message = message;
        this.files = files;
        this.username = username;
        this.password = password;
        this.level = level;
        this.file_byte = file_byte;
    }

    public Comment(String cid, String tid, String reply_flag, String title, String message, String files, String username, String password, int level, String file_byte) {
        this.cid = cid;
        this.tid = tid;
        this.reply_flag = reply_flag;
        this.title = title;
        this.message = message;
        this.files = files;
        this.username = username;
        this.password = password;
        this.level = level;
        this.file_byte = file_byte;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getReply_flag() {
        return reply_flag;
    }

    public void setReply_flag(String reply_flag) {
        this.reply_flag = reply_flag;
    }

    public String getReply_cid() {
        return reply_cid;
    }

    public void setReply_cid(String reply_cid) {
        this.reply_cid = reply_cid;
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

    public String getFiles() {
        return files;
    }

    public void setFiles(String files) {
        this.files = files;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }
}
