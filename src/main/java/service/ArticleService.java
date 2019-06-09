package service;

import pojo.Article;
import pojo.Category;

import java.util.Date;
import java.util.List;

public interface ArticleService {

    void insertArticle(Article article);
    List<Article> queryArticleList();
    Article queryArticleById(int arid);
    void updateArticleContent(String arcontent, int arid);
    void updateArticleCommentNum(int arcommentnum, int arid);
    void updateArticleBrowseNum(int arbrowsenum, int arid);
    void updateArticleUpdateTime(Date arupdatetime, int arid);
    void updateArticlePriority(int arpriority, int arid);
    List<Article> queryArticleListByUId(int uid);
    void deleteArticleById(int arid);
    int articleTotalByUid(int uid);
    int browseTotalByUid(int uid);
    Date queryLastUpdateByUid(int uid);
    List<Article> queryArticleListByUidBrowseNum(int uid);
    List<Article> queryArticleListByUidUpdateTime(int uid);
    List<Category> queryCategoryListByUid(int uid);
    List<Article> queryArticleListByUidCaid(int uid, int caid);
}
