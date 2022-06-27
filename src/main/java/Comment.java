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


    public Comment(String cid, String tid, String reply_flag, String reply_cid, String title, String message, String files, String username, String password) {
        this.cid = cid;
        this.tid = tid;
        this.reply_flag = reply_flag;
        this.reply_cid = reply_cid;
        this.title = title;
        this.message = message;
        this.files = files;
        this.username = username;
        this.password = password;
    }

    public Comment(String cid, String tid, String reply_flag, String title, String message, String files, String username, String password) {
        this.cid = cid;
        this.tid = tid;
        this.reply_flag = reply_flag;
        this.title = title;
        this.message = message;
        this.files = files;
        this.username = username;
        this.password = password;
    }
}
