package dao;

import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;
import pojo.Article;
import pojo.Category;

import java.util.Date;
import java.util.List;

@Repository
public interface ArticleDao {

    @Insert("insert into article(uid,caid,artitle,arcontent,arcommentnum," +
            "arbrowsenum,arupdatetime,arcreatetime,arpriority,arispublic," +
            "arisdraft) values" +
            "(#{uid},#{caid},#{artitle},#{arcontent},#{arcommentnum}," +
            "#{arbrowsenum},#{arupdatetime},#{arcreatetime},#{arpriority}," +
            "#{arispublic},#{arisdraft})")
    public void insertArticle(Article article);

    @Update("update article set arcontent=#{arcontent} where arid=#{arid} ")
    public void updateArticleContent(String arcontent, int arid);

    @Update("update article set arcommentnum=#{arcommentnum} where arid=#{arid}")
    public void updateArticleCommentNum(int arcommentnum, int arid);

    @Update("update article set arbrowsenum=#{arbrowsenum} where arid=#{arid}")
    public void updateArticleBrowseNum(int arbrowsenum, int arid);

    @Update("update article set arupdatetime=#{arupdatetime} where arid=#{arid}")
    public void updateArticleUpdateTime(Date arupdatetime, int arid);

    @Update("update article set arpriority=#{arpriority} where arid=#{arid}")
    public void updateArticlePriority(int arpriority, int arid);

    @Select("select * from article")
    public List<Article> queryArticleList();

    @Select("select * from article where arid=#{arid}")
    public Article queryArticleById(int arid);

    @Select("select * from article where uid=#{uid} order by arpriority desc")
    public List<Article> queryArticleListByUId(int uid);

    @Delete("delete from article where arid=#{arid}")
    public void deleteArticleById(int arid);

    @Select("select arupdatetime from article where uid=#{uid} " +
            "order by arupdatetime desc limit 0, 1")
    public Date queryLastUpdateByUid(int uid);

    @Select("select * from article where uid=#{uid} order by arbrowsenum desc")
    public List<Article> queryArticleListByUidBrowseNum(int uid);

    @Select("select * from article where uid=#{uid} order by arupdatetime desc")
    public List<Article> queryArticleListByUidUpdateTime(int uid);

    @Select("select * from category where caid in (select distinct caid " +
            "from article where uid=#{uid})")
    public List<Category> queryCategoryListByUid(int uid);

    @Select("select * from article where uid=#{uid} and caid=#{caid} and arispublic")
    public List<Article> queryArticleListByUidCaid(@Param("uid") int uid, @Param("caid") int caid);
/*
    @Select("select uid FROM article GROUP BY uid ASC LIMIT 3")
    public List<String> findtop3();*/
}
