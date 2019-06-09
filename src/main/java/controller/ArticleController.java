package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Article;
import pojo.ArticleDate;
import pojo.ArticlePageNumUid;
import pojo.Category;
import service.ArticleService;
import service.CategoryService;
import utils.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class ArticleController {
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;

    @RequestMapping("/insertarticlepage")
    public String insertArticlePage(HttpServletRequest request){
        request.getSession().setAttribute("pageList",categoryService.queryCategoryList());
        return "insert";
    }

    @RequestMapping(value = "/insertarticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertArticle(HttpServletRequest request, HttpSession session){
        String html = request.getParameter("html");
        //String title = request.getParameter("title");
        String caid = request.getParameter("caid");
        String ispublic = request.getParameter("ispublic");
        String isdraft = request.getParameter("isdraft");
        if(isdraft == null){
            isdraft = "1";
        }
        int idxEnd = 0;
        int idxStart = html.indexOf("src=\"");
        String content = "";
        int count = 0;
        while(idxStart != -1)
        {
            content += html.substring(idxEnd, idxStart)+"src=\"";
            idxEnd = html.indexOf("\"", idxStart+5);
            String str = html.substring(idxStart, idxEnd);
            if(str.indexOf("http://") != -1){
                content += str.substring(5) +"\"";
            }else{
                String imgStr = str.substring(str.indexOf(",")+1);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                String Addr = sdf.format(new Date())+count+".jpg";
                String imgAddr = "D:\\java-2018\\Blog\\src\\main\\webapp\\img\\"+Addr;
                content += "/img/"+Addr;
                Base64.GenerateImage(imgStr, imgAddr);
            }
            count++;
            idxStart = html.indexOf("src=\"", idxEnd+1);
        }
        content += html.substring(idxEnd);
        Article article = new Article();
        article.setArtitle("aaaaa");
        article.setCaid(Integer.parseInt("1"));
        article.setArcontent(content);
        article.setArbrowsenum(0);
        article.setArcommentnum(0);
        article.setArcreatetime(new Date());
        article.setArupdatetime(new Date());
        article.setArpriority(0);
        article.setArispublic(1);
        article.setArisdraft(1);
        System.out.println(content);
        articleService.insertArticle(article);
        session.setAttribute("aa", content);
        Map<String, Object> modelMap = new HashMap<>();
        modelMap.put("code", 200);
        return modelMap;
    }

    @RequestMapping("/updatearticlepage")
    public String updateArticlePage(HttpServletRequest request, @RequestParam("arid")int arid){
        Article article = articleService.queryArticleById(arid);
        request.setAttribute("article", article);
        return "update";
    }

    @RequestMapping("/updatearticle")
    public String updateArticle(HttpServletRequest request, @RequestParam("arid")int arid){
        String html = request.getParameter("html");
        int idxEnd = 0;
        int idxStart = html.indexOf("src=\"");
        String content = "";
        int count = 0;
        while(idxStart != -1)
        {
            content += html.substring(idxEnd, idxStart)+"src=\"";
            idxEnd = html.indexOf("\"", idxStart+5);
            String str = html.substring(idxStart, idxEnd);
            if(str.indexOf("http://") != -1){
                content += str.substring(5) +"\"";
            }else{
                String imgStr = str.substring(str.indexOf(",")+1);
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                String Addr = sdf.format(new Date())+count+".jpg";
                String imgAddr = "D:\\java-2018\\Blog\\src\\main\\webapp\\img\\"+Addr;
                content += "/img/"+Addr;
                Base64.GenerateImage(imgStr, imgAddr);
            }
            count++;
            idxStart = html.indexOf("src=\"", idxEnd+1);
        }
        content += html.substring(idxEnd);
        articleService.updateArticleContent(content, arid);

        return "article";
    }

    @RequestMapping("/rhy_index")
    public String rhyIndex(HttpServletRequest request, HttpSession session){
        String uid = request.getParameter("uid");
        int caid = request.getParameter("caid") == null ? 0 : Integer.parseInt(request.getParameter("caid"));
        int method = Integer.parseInt(request.getParameter("method"));
        int page = Integer.parseInt(request.getParameter("page"));
        System.out.println(method);
        int articleTotal = articleService.articleTotalByUid(Integer.parseInt(uid));
        int browseTotal = articleService.browseTotalByUid(Integer.parseInt(uid));
        Date lastUpdateTimeTmp = articleService.queryLastUpdateByUid(Integer.parseInt(uid));
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String lastUpdateTime = sdf.format(lastUpdateTimeTmp);
        request.setAttribute("articleTotal",articleTotal);
        request.setAttribute("browseTotal",browseTotal);
        request.setAttribute("lastUpdateTime",lastUpdateTime);

        List<Article> articleList = null;
        if(caid == 0){
            if(method == 1){
                articleList = articleService.queryArticleListByUId(Integer.parseInt(uid));
            }else if(method == 2){
                articleList = articleService.queryArticleListByUidBrowseNum(Integer.parseInt(uid));
            }else{
                articleList = articleService.queryArticleListByUidUpdateTime(Integer.parseInt(uid));
            }
        }else{
            articleList = articleService.queryArticleListByUidCaid(Integer.parseInt(uid), caid);
        }
        int articleSize = articleList.size();
        int num = articleSize/6;
        List<ArticlePageNumUid> articlePageNumUidList = new ArrayList<>();
        for(int i = 1;i <= num+1;i++){
            ArticlePageNumUid articlePageNumUid = new ArticlePageNumUid();
            articlePageNumUid.setNum(i);
            articlePageNumUid.setUid(Integer.parseInt(uid));
            articlePageNumUid.setMethod(method);
            articlePageNumUidList.add(articlePageNumUid);
        }
        request.setAttribute("pageList", articlePageNumUidList);
        int toIndex = articleSize >= 5+(page-1)*5 ? 5+(page-1)*5 : articleSize;
        List<Article> newArticleList = articleList.subList(0+(page-1)*5, toIndex);
        List<ArticleDate> articleDateList = new ArrayList<>();
        for(Article article : newArticleList){
            String content = contentAlert(article.getArcontent());
            article.setArcontent(content);
            ArticleDate articleDate = new ArticleDate();
            articleDate.setArticle(article);
            Date updateTime = article.getArupdatetime();
            String updatetime = sdf.format(updateTime);
            articleDate.setUpdatetime(updatetime);
            articleDateList.add(articleDate);
        }
        List<Category> categoryList = articleService.queryCategoryListByUid(Integer.parseInt(uid));
        request.setAttribute("categoryList", categoryList);
        request.setAttribute("articleDateList", articleDateList);
        request.setAttribute("uid", Integer.parseInt(uid));
        return "rhy_index";
    }

    private String contentAlert(String content){
        int toIndex = content.indexOf("</p>");
        if(toIndex == -1){
            return content;
        }
        return content.substring(0, toIndex+4);
    }

    @RequestMapping("/qwx_index")
    public String qwxIndex(HttpServletRequest request){
        int arid = Integer.parseInt(request.getParameter("arid"));
        Article article = articleService.queryArticleById(arid);
        int incrbrowsenum = article.getArbrowsenum()+1;
        article.setArbrowsenum(incrbrowsenum);
        articleService.updateArticleBrowseNum(incrbrowsenum, arid);
        request.setAttribute("article", article);

        int uid = article.getUid();
        int articleTotal = articleService.articleTotalByUid(uid);
        int browseTotal = articleService.browseTotalByUid(uid);
        Date lastUpdateTimeTmp = articleService.queryLastUpdateByUid(uid);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        String lastUpdateTime = sdf.format(lastUpdateTimeTmp);
        request.setAttribute("articleTotal",articleTotal);
        request.setAttribute("browseTotal",browseTotal);
        request.setAttribute("lastUpdateTime",lastUpdateTime);


        return "qwx_index";

    }

}
