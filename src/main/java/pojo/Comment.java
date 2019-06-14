package pojo;

public class Comment {
    private int coid;
    private int uid1;
    private int uid2;
    private int arid;
    private String cocontent;

    public int getArid() {
        return arid;
    }

    public void setArid(int arid) {
        this.arid = arid;
    }

    public int getCoid() {
        return coid;
    }

    public void setCoid(int coid) {
        this.coid = coid;
    }

    public int getUid1() {
        return uid1;
    }

    public void setUid1(int uid1) {
        this.uid1 = uid1;
    }

    public int getUid2() {
        return uid2;
    }

    public void setUid2(int uid2) {
        this.uid2 = uid2;
    }

    public String getCocontent() {
        return cocontent;
    }

    public void setCocontent(String cocontent) {
        this.cocontent = cocontent;
    }
}
