package pojo;

public class Category {
    //编号
    private int caid;
    //分类名称
    private String caname;
    //图片地址
    private String caimg;

    public int getCaid() {
        return caid;
    }

    public void setCaid(int caid) {
        this.caid = caid;
    }

    public String getCaname() {
        return caname;
    }

    public void setCaname(String caname) {
        this.caname = caname;
    }

    public String getCaimg() {
        return caimg;
    }

    public void setCaimg(String caimg) {
        this.caimg = caimg;
    }

    @Override
    public String toString() {
        return "Category{" +
                "caid=" + caid +
                ", caname='" + caname + '\'' +
                ", caimg='" + caimg + '\'' +
                '}';
    }


}
