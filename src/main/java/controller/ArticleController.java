package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import pojo.*;
import service.ArticleService;
import service.CategoryService;
import service.CommentService;
import service.UserService;
import utils.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.*;


@Controller
public class ArticleController {
    @Autowired
    private UserService userService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private CommentService commentService;

    @RequestMapping("/rjb_index")
    public String insertArticlePage(HttpServletRequest request){

        request.getSession().setAttribute("categoryList",categoryService.queryCategoryList());
        return "rjb_index";
    }

    @RequestMapping("/bkglindex/{uid}")
    public String rjb_articleAndComment(HttpServletRequest request,@PathVariable("uid") String uid) {
        User user=userService.findByUid(Integer.parseInt(uid));
        request.getSession().setAttribute("user",user);
    return "rjb_articleAndComment";
    }
    @RequestMapping(value = "/insertarticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> insertArticle(HttpServletRequest request, HttpSession session){
        String html = request.getParameter("html");
        String title = request.getParameter("title");
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
                String imgAddr = "F:\\ideaSource\\hlw2\\src\\main\\webapp\\img\\"+Addr;
                content += "/img/"+Addr;
                Base64.GenerateImage(imgStr, imgAddr);
            }
            count++;
            idxStart = html.indexOf("src=\"", idxEnd+1);
        }
        content += html.substring(idxEnd);
        Article article = new Article();
        User user=(User) request.getSession().getAttribute("user");
        article.setUid(user.getUid());
        article.setArtitle(title);
        article.setCaid(Integer.parseInt(caid));
        article.setArcontent(content);
        article.setArbrowsenum(0);
        article.setArcommentnum(0);
        article.setArcreatetime(new Date());
        article.setArupdatetime(new Date());
        article.setArpriority(0);
        article.setArispublic(Integer.parseInt(ispublic));
        article.setArisdraft(Integer.parseInt(isdraft));
        System.out.println(content);
        articleService.insertArticle(article);
        Map<String, Object> modelMap = new HashMap<>();
        modelMap.put("code", 200);
        return modelMap;
    }
    @RequestMapping(value = "/choose", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> chooseArticle(@RequestBody String num){
        Map<String,Object> map=new HashMap<>();
        int index=num.indexOf("=");
        num=num.substring(index+1);

        List<Article> articles=articleService.queryArticleListByCaid(Integer.parseInt(num));
        if (articles.size()>=1) {
            int count=1;
            for (Article a : articles
                    ) {

                String content = contentAlert(a.getArcontent());
                a.setArcontent(content);
                map.put(("article"+count),a);
                count++;
            }
        }

        map.put("size",articles.size());
        return map;
    }
    @RequestMapping(value = "/findArticle", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findArticle(@RequestBody String msg) throws UnsupportedEncodingException {
        Map<String, Object> map = new HashMap<>();
        int index=msg.indexOf("=");
        msg=msg.substring(index+1);
        msg = URLDecoder.decode(msg, "utf-8");
        List<Article> articles=articleService.queryArticleList2(msg);
        System.out.println(articles.size());
        map.put("size",articles.size());
        int count=1;
        if (articles.size()>=1) {

            for (Article a : articles
                    ) {

                String content = contentAlert(a.getArcontent());
                a.setArcontent(content);
                map.put(("article"+count),a);
                count++;
            }


        }
        int size2=0;
        if (count<4){
            List<User> users=userService.queryUnameList2(msg,(4-count+1));
            size2=users.size();
            map.put("size2",size2);
            for (User u:users
                    ) {
                map.put(("user"+count),u);
                count++;
                System.out.println(count);
            }

        }
        return map;
    }
    @RequestMapping("/updatearticlepage")
    public String updateArticlePage(HttpServletRequest request, @RequestParam("arid")int arid){
        Article article = articleService.queryArticleById(arid);
        request.setAttribute("article", article);
        return "rjb_index";
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
                String imgAddr = "F:\\ideaSource\\hlw2\\src\\main\\webapp\\img\\"+Addr;
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
        String userid=request.getParameter("userid");
        if (userid!=null&&!userid.equals("")){
        User loginuser=userService.findByUid(Integer.parseInt(userid));
        session.setAttribute("user",loginuser);
        }
        String uid = request.getParameter("uid");
        User otheruser=userService.findByUid(Integer.parseInt(uid));
        session.setAttribute("otheruser",otheruser);
        int caid = request.getParameter("caid") == null ? 0 : Integer.parseInt(request.getParameter("caid"));
        int method = Integer.parseInt(request.getParameter("method"));
        int page = Integer.parseInt(request.getParameter("page"));
        System.out.println(method);
        int articleTotal = articleService.articleTotalByUid(Integer.parseInt(uid));
        int browseTotal = articleService.browseTotalByUid(Integer.parseInt(uid));
        Date lastUpdateTimeTmp = articleService.queryLastUpdateByUid(Integer.parseInt(uid));
        String lastUpdateTime;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        if (lastUpdateTimeTmp!=null) {

            lastUpdateTime = sdf.format(lastUpdateTimeTmp);
        }
        else {

            lastUpdateTimeTmp=new Date();
            lastUpdateTime = sdf.format(lastUpdateTimeTmp);
        }
        request.setAttribute("articleTotal",articleTotal);
        request.setAttribute("browseTotal",browseTotal);
        request.setAttribute("lastUpdateTime",lastUpdateTime);
        List<Article> articleList = null;
        if(caid == 0){
            if(method == 1){
                articleList = articleService.queryArticleListByUidPublic(Integer.parseInt(uid));
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

    private String contentAlert(String str){
        String tagS[] = {"<h1","<h2","<h3","<h4","<h5"};
        String tagE[] = {"</h1>","</h2>","</h3>","</h4>","</h5>"};
        int i = 0;
        for(;i < tagS.length;i++){
            int indexS = str.indexOf(tagS[i]);
            if(indexS == 0){
                int indexE = str.indexOf(tagE[i]);
                str = str.substring(0, indexE+5);
                break;
            }
        }
        if(i == tagS.length){
            int idx = str.indexOf("</p>");
            str = str.substring(0, idx+4);
        }
        String newstr = "";
        newstr = str.replaceAll("<[.[^>]]*>","");
        newstr = newstr.replaceAll(" ", "");
        if(newstr.length() == 0){
            newstr="亲，点击文章阅读详细信息...";
        }
        return newstr;
    }


    @RequestMapping("qwx_index")
    public String qwxIndex(HttpServletRequest request){

        int arid = Integer.parseInt(request.getParameter("arid"));
        System.out.println("*******************"+arid);
        Article article = articleService.queryArticleById(arid);
        User user=userService.findByUid(article.getUid());
        System.out.println("***************"+"          "+user);
        String userid=request.getParameter("userid");

        if (userid!=null&&userid.length()>=1)
        {
            System.out.println("000000000");
            User loginuser=userService.findByUid(Integer.parseInt(userid));
            request.getSession().setAttribute("user",loginuser);
        }
        request.setAttribute("qwxuser",user);
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

        System.out.println("############################");
        List<Comment> commentList = commentService.queryCommentListByArid(arid);
        List<UserComment> userCommentList = new ArrayList<>();
        for(Comment comment : commentList){
            UserComment userComment = new UserComment();
            if(comment.getUid2() == 0){
                User user1 = userService.findByUid(comment.getUid1());
                userComment.setUser(user1);
                userComment.setComment(comment);
                userCommentList.add(userComment);
            }else{
                int uid2 = comment.getUid2();
                int uid1 = comment.getUid1();
                for(UserComment userComment1 : userCommentList){
                    if(userComment1.getUser().getUid() == uid2){
                        User user2 = userService.findByUid(uid1);
                        userComment1.getComment().setCocontent(userComment1.getComment().getCocontent()+"<p><strong>"+user2.getUname()+"</strong>回复: "+comment.getCocontent()+"</p>");
                    }
                }
            }
        }
        System.out.println(userCommentList);
        int caid = article.getCaid();
        List<Article> articleList = articleService.queryArticleListByCaidLimit3(caid);
        for(Article article1 : articleList){
            article1.setArcontent(contentAlert(article1.getArcontent()));

        }
        request.setAttribute("articleList", articleList);

        request.setAttribute("userCommentList", userCommentList);

        return "qwx_index";

    }

    @RequestMapping("/showall")
    @ResponseBody
    public Map<String, Object> showAll(HttpServletRequest request, HttpSession session){
        Map<String, Object> modelMap = new HashMap<>();

        int uid = ((User) session.getAttribute("user")).getUid();

        List<Article> newArticleList = articleService.queryArticleListByUId(uid);
        List<ArticleDate> articleDateList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Article article : newArticleList){
            ArticleDate articleDate = new ArticleDate();
            articleDate.setArticle(article);
            Date updateTime = article.getArupdatetime();
            String updatetime = sdf.format(updateTime);
            articleDate.setUpdatetime(updatetime);
            articleDateList.add(articleDate);
        }

        modelMap.put("articleDateList", articleDateList);
        return modelMap;
    }

    @RequestMapping("/showpublic")
    @ResponseBody
    public Map<String, Object> showPublic(HttpServletRequest request){
        Map<String, Object> modelMap = new HashMap<>();
        //User user = (User) session.getAttribute("user");
        //int uid = user.getUid();
        int uid = ((User) request.getSession().getAttribute("user")).getUid();
        List<Article> newArticleList = articleService.queryArticleListByUidPublic(uid);
        List<ArticleDate> articleDateList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Article article : newArticleList){
            ArticleDate articleDate = new ArticleDate();
            articleDate.setArticle(article);
            Date updateTime = article.getArupdatetime();
            String updatetime = sdf.format(updateTime);
            articleDate.setUpdatetime(updatetime);
            articleDateList.add(articleDate);
        }
        modelMap.put("articleDateList", articleDateList);
        return modelMap;
    }

    @RequestMapping("/showprivate")
    @ResponseBody
    public Map<String, Object> showPrivate(HttpServletRequest request){
        Map<String, Object> modelMap = new HashMap<>();
        //User user = (User) session.getAttribute("user");
        //int uid = user.getUid();
        int uid = ((User) request.getSession().getAttribute("user")).getUid();
        List<Article> newArticleList = articleService.queryArticleListByUidPrivate(uid);
        List<ArticleDate> articleDateList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Article article : newArticleList){
            ArticleDate articleDate = new ArticleDate();
            articleDate.setArticle(article);
            Date updateTime = article.getArupdatetime();
            String updatetime = sdf.format(updateTime);
            articleDate.setUpdatetime(updatetime);
            articleDateList.add(articleDate);
        }
        modelMap.put("articleDateList", articleDateList);
        return modelMap;
    }

    @RequestMapping("/top")
    @ResponseBody
    public Map<String, Object> top(HttpServletRequest request, int arid){
        Map<String, Object> modelMap = new HashMap<>();
        int uid=((User)request.getSession().getAttribute("user")).getUid();
        int priority = articleService.queryPriorityByUid(uid);
        int newPriority = priority+1;
        articleService.updateArticlePriority(newPriority, arid);
        return modelMap;
    }

    @RequestMapping("/setpublic")
    @ResponseBody
    public Map<String, Object> setPublic(int arid){
        Map<String, Object> modelMap = new HashMap<>();
        articleService.updatePublicByArid(arid);
        return modelMap;
    }

    @RequestMapping("/showdraft")
    @ResponseBody
    public Map<String, Object> showDraft(HttpServletRequest request){
        Map<String, Object> modelMap = new HashMap<>();
        //User user = (User) session.getAttribute("user");
        //int uid = user.getUid();
        int uid = ((User) request.getSession().getAttribute("user")).getUid();
        List<Article> newArticleList = articleService.queryArticleListByUidDraft(uid);
        List<ArticleDate> articleDateList = new ArrayList<>();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        for(Article article : newArticleList){
            ArticleDate articleDate = new ArticleDate();
            articleDate.setArticle(article);
            Date updateTime = article.getArupdatetime();
            String updatetime = sdf.format(updateTime);
            articleDate.setUpdatetime(updatetime);
            articleDateList.add(articleDate);
        }
        modelMap.put("articleDateList", articleDateList);

        return modelMap;
    }

    @RequestMapping("/public")
    @ResponseBody
    public Map<String, Object> publicArid(int arid){
        Map<String, Object> modelMap = new HashMap<>();
        articleService.updateArticleDraftByArid(arid);
        return modelMap;
    }

    @RequestMapping("/del")
    @ResponseBody
    public Map<String, Object> del(int arid){
        Map<String, Object> modelMap = new HashMap<>();
        articleService.deleteArticleByArid(arid);
        commentService.deleteCommentByArid(arid);
        return modelMap;
    }

    @RequestMapping("/rjb_indexx")
    public String rjbIndex2(HttpServletRequest request, int arid){
        //User user = (User) session.getAttribute("user");
        //int uid = user.getUid();
        int uid= ((User) request.getSession().getAttribute("user")).getUid();
        Article article = articleService.queryArticleById(arid);
        request.setAttribute("article", article);
        return "rjb_index2";
    }

}
