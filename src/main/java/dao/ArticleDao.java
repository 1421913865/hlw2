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
    public void updateArticleContent(@Param("arcontent") String arcontent, @Param("arid") int arid);

    @Update("update article set arcommentnum=#{arcommentnum} where arid=#{arid}")
    public void updateArticleCommentNum(@Param("arcommentnum") int arcommentnum, @Param("arid") int arid);

    @Update("update article set arbrowsenum=#{arbrowsenum} where arid=#{arid}")
    public void updateArticleBrowseNum(@Param("arbrowsenum") int arbrowsenum, @Param("arid") int arid);

    @Update("update article set arupdatetime=#{arupdatetime} where arid=#{arid}")
    public void updateArticleUpdateTime(@Param("arupdatetime") Date arupdatetime, @Param("arid") int arid);

    @Update("update article set arpriority=#{arpriority} where arid=#{arid}")
    public void updateArticlePriority(@Param("arpriority") int arpriority, @Param("arid") int arid);

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

    @Select("select * from article where uid=#{uid} and arispublic=1 and arisdraft=1 order by arbrowsenum desc")
    public List<Article> queryArticleListByUidBrowseNum(int uid);

    @Select("select * from article where uid=#{uid} and arispublic=1 and arisdraft=1 order by arupdatetime desc")
    public List<Article> queryArticleListByUidUpdateTime(int uid);

    @Select("select * from category where caid in (select distinct caid " +
            "from article where uid=#{uid})")
    public List<Category> queryCategoryListByUid(int uid);

    @Select("select * from article where uid=#{uid} and caid=#{caid} and arispublic=1 and arisdraft=1")
    public List<Article> queryArticleListByUidCaid(@Param("uid") int uid, @Param("caid") int caid);

    @Select("select * from article where  caid=#{0} limit 4")
    public List<Article> queryArticleListByCaid(int caid);

    @Select("select * FROM article GROUP BY uid ASC LIMIT 3")
    public List<Article> findtop3();

    @Select("SELECT * FROM article WHERE arispublic=1 and arisdraft=1 ORDER BY arcreatetime DESC LIMIT 4")
    public List<Article> findRecommend();

    @Select("select * from article where caid=#{caid} and arisdraft=1 and arispublic=1 limit 0,3")
    public List<Article> queryArticleListByCaidLimit3(int caid);

    @Select("SELECT * FROM article WHERE artitle LIKE CONCAT('%', #{artitle}, '%') limit 4")
    public List<Article> queryArticleList2(String artitle);



    @Select("select max(arpriority) from article where uid=#{uid}")
    public int queryPriorityByUid(int uid);

    @Select("update article set arispublic=1 where arid=#{arid}")
    public void updatePublicByArid(int arid);

    @Select("select * from article where uid=#{uid} and arisdraft=0")
    public List<Article> queryArticleListByUidDraft(int uid);

    @Select("update article set arisdraft=1 where arid=#{arid}")
    public void updateArticleDraftByArid(int arid);

    @Delete("delete from article where arid=#{arid}")
    public void deleteArticleByArid(int arid);

    @Select("select * from article where uid=#{uid} and arispublic=1 and arisdraft=1 order by arpriority desc")
    public List<Article> queryArticleListByUidPublic(int uid);

}
