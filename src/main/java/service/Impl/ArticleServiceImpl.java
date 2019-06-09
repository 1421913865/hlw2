package service.Impl;

import dao.ArticleDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Article;
import pojo.Category;
import service.ArticleService;

import java.util.Date;
import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService{
    @Autowired
    private ArticleDao articleDao;

    @Override
    public void insertArticle(Article article) {
        articleDao.insertArticle(article);
    }
    @Override
    public List<Article> queryArticleList() {
        return articleDao.queryArticleList();
    }

    @Override
    public Article queryArticleById(int arid) {
        return articleDao.queryArticleById(arid);
    }

    @Override
    public void updateArticleContent(String arcontent, int arid) {
        articleDao.updateArticleContent(arcontent, arid);
    }

    @Override
    public void updateArticleCommentNum(int arcommentnum, int arid) {
        articleDao.updateArticleCommentNum(arcommentnum, arid);
    }

    @Override
    public void updateArticleBrowseNum(int arbrowsenum, int arid) {
        articleDao.updateArticleBrowseNum(arbrowsenum, arid);
    }

    @Override
    public void updateArticleUpdateTime(Date arupdatetime, int arid) {
        articleDao.updateArticleUpdateTime(arupdatetime, arid);
    }

    @Override
    public void updateArticlePriority(int arpriority, int arid) {
        articleDao.updateArticlePriority(arpriority, arid);
    }

    @Override
    public List<Article> queryArticleListByUId(int uid) {
        return articleDao.queryArticleListByUId(uid);
    }

    @Override
    public void deleteArticleById(int arid) {
        articleDao.deleteArticleById(arid);
    }

    @Override
    public int articleTotalByUid(int uid) {
        List<Article> articleList = articleDao.queryArticleListByUId(uid);
        return articleList.size();
    }

    @Override
    public int browseTotalByUid(int uid) {
        List<Article> articleList = articleDao.queryArticleListByUId(uid);
        int browseTotal = 0;
        for(Article article : articleList){
            browseTotal += article.getArbrowsenum();
        }
        return browseTotal;
    }

    @Override
    public Date queryLastUpdateByUid(int uid) {
        return articleDao.queryLastUpdateByUid(uid);
    }

    @Override
    public List<Article> queryArticleListByUidBrowseNum(int uid) {
        return articleDao.queryArticleListByUidBrowseNum(uid);
    }

    @Override
    public List<Article> queryArticleListByUidUpdateTime(int uid) {
        return articleDao.queryArticleListByUidUpdateTime(uid);
    }

    @Override
    public List<Category> queryCategoryListByUid(int uid) {
        return articleDao.queryCategoryListByUid(uid);
    }

    @Override
    public List<Article> queryArticleListByUidCaid(int uid, int caid) {
        return articleDao.queryArticleListByUidCaid(uid, caid);
    }

}
