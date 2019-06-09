package pojo;

import java.util.Date;

public class Article {

    //编号
    private int arid;
    //用户id
    private int uid;
    //分类id
    private int caid;
    //标题
    private String artitle;
    //内容
    private String arcontent;
    //评论人数
    private int arcommentnum;
    //浏览人数
    private int arbrowsenum;
    //更新时间
    private Date arupdatetime;
    //创建时间
    private Date arcreatetime;
    //权重
    private int arpriority;
    //公开或私密 0私密 1公开
    private int arispublic;
    //草稿或发表 0草稿 1发表
    private int arisdraft;

    public int getArid() {
        return arid;
    }

    public void setArid(int arid) {
        this.arid = arid;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getCaid() {
        return caid;
    }

    public void setCaid(int caid) {
        this.caid = caid;
    }

    public String getArtitle() {
        return artitle;
    }

    public void setArtitle(String artitle) {
        this.artitle = artitle;
    }

    public String getArcontent() {
        return arcontent;
    }

    public void setArcontent(String arcontent) {
        this.arcontent = arcontent;
    }

    public int getArcommentnum() {
        return arcommentnum;
    }

    public void setArcommentnum(int arcommentnum) {
        this.arcommentnum = arcommentnum;
    }

    public Date getArupdatetime() {
        return arupdatetime;
    }

    public void setArupdatetime(Date arupdatetime) {
        this.arupdatetime = arupdatetime;
    }

    public Date getArcreatetime() {
        return arcreatetime;
    }

    public void setArcreatetime(Date arcreatetime) {
        this.arcreatetime = arcreatetime;
    }

    public int getArbrowsenum() {
        return arbrowsenum;
    }

    public void setArbrowsenum(int arbrowsenum) {
        this.arbrowsenum = arbrowsenum;
    }

    public int getArpriority() {
        return arpriority;
    }

    public void setArpriority(int arpriority) {
        this.arpriority = arpriority;
    }

    public int getArispublic() {
        return arispublic;
    }

    public void setArispublic(int arispublic) {
        this.arispublic = arispublic;
    }

    public int getArisdraft() {
        return arisdraft;
    }

    public void setArisdraft(int arisdraft) {
        this.arisdraft = arisdraft;
    }

    @Override
    public String toString() {
        return "Article{" +
                "arid=" + arid +
                ", uid=" + uid +
                ", caid=" + caid +
                ", artitle='" + artitle + '\'' +
                ", arcontent='" + arcontent + '\'' +
                ", arcommentnum=" + arcommentnum +
                ", arbrowsenum=" + arbrowsenum +
                ", arupdatetime=" + arupdatetime +
                ", arcreatetime=" + arcreatetime +
                ", arpriority=" + arpriority +
                ", arispublic=" + arispublic +
                ", arisdraft=" + arisdraft +
                '}';
    }
}
