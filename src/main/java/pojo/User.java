package pojo;

import java.io.Serializable;

public class User implements Serializable{
    private int uid;

    @Override
    public String toString() {
        return "User{" +
                "uid=" + uid +
                ", uname='" + uname + '\'' +
                ", upassword='" + upassword + '\'' +
                ", uimage='" + uimage + '\'' +
                ", userimage='" + userimage + '\'' +
                ", userprofile='" + userprofile + '\'' +
                '}';
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    private String uname;
    private String upassword;
    private String uimage;
    private String userimage;
    private String userprofile;

    public String getUserimage() {
        return userimage;
    }

    public void setUserimage(String userimage) {
        this.userimage = userimage;
    }

    public String getUserprofile() {
        return userprofile;
    }

    public void setUserprofile(String userprofile) {
        this.userprofile = userprofile;
    }

    public String getUimage() {
        return uimage;
    }

    public void setUimage(String uimage) {
        this.uimage = uimage;
    }

    public String getUname() {
        return uname;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public String getUpassword() {
        return upassword;
    }

    public void setUpassword(String upassword) {
        this.upassword = upassword;
    }
}
