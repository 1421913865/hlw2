package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.*;
import service.ArticleService;
import service.CommentService;
import service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private UserService userService;

    @RequestMapping("/insertcomment")
    @ResponseBody
    public Map<String, Object> insertComment(HttpServletRequest request, HttpSession session){
        Map<String, Object> modelMap = new HashMap<>();
        User user = (User) session.getAttribute("user");
        if(user == null){
            modelMap.put("code", 200);
            return modelMap;
        }
        modelMap.put("code", 300);
        int uid1 = user.getUid();
        int arid = Integer.parseInt(request.getParameter("arid"));
        int uid2 = Integer.parseInt(request.getParameter("uid"));
        Article article = articleService.queryArticleById(arid);
        String content = request.getParameter("content");
        Comment comment = new Comment();
        comment.setUid1(uid1);
        comment.setUid2(uid2);
        comment.setArid(arid);
        comment.setCocontent(content);
        if(uid2 != 0){
            String tmp = content;
            content = "<strong>"+user.getUname()+"</strong>回复:"+tmp;
        }
        int commentNum = article.getArcommentnum()+1;
        articleService.updateArticleCommentNum(commentNum, arid);
        commentService.insertComment(comment);
        modelMap.put("user", user);
        modelMap.put("content", content);
        return modelMap;
    }

    @RequestMapping("/showmycomment")
    @ResponseBody
    public Map<String, Object> showMyComment(HttpServletRequest request){
        Map<String, Object> modelMap = new HashMap<>();
        int uid = ((User) request.getSession().getAttribute("user")).getUid();

        List<Comment> commentList = commentService.queryCommentListByUid1(uid);
        List<ShowMyComment> showMyCommentList = new ArrayList<>();
        for(Comment comment : commentList){
            int arid = comment.getArid();
            Article article = articleService.queryArticleById(arid);
            int uid2 = comment.getUid2();
            User user = null;
            if(uid2 == 0){
                user = userService.findByUid(article.getUid());
            }else{
                user = userService.findByUid(uid2);
            }
            ShowMyComment showMyComment = new ShowMyComment();
            showMyComment.setArticle(article);
            showMyComment.setUname(user.getUname());
            showMyComment.setComment(comment);
            showMyCommentList.add(showMyComment);
        }
        modelMap.put("showMyCommentList", showMyCommentList);
        return modelMap;
    }

    @RequestMapping("/showcommentforme")
    @ResponseBody
    public Map<String, Object> showCommentForMe(HttpServletRequest request){
        Map<String, Object> modelMap = new HashMap<>();

       int uid2 = ((User) request.getSession().getAttribute("user")).getUid();

        List<Article> articleList = articleService.queryArticleListByUId(uid2);
        List<ShowCommentForMe> showCommentForMeList = new ArrayList<>();
        for(Article article : articleList){
            int arid = article.getArid();
            List<Comment> commentList = commentService.queryCommentListByArid(arid);
            for(Comment comment : commentList){
                ShowCommentForMe showCommentForMe = new ShowCommentForMe();
                User user = userService.findByUid(comment.getUid1());
                showCommentForMe.setUser(user);
                showCommentForMe.setComment(comment);
                showCommentForMe.setArticle(article);
                showCommentForMeList.add(showCommentForMe);
            }
        }
        modelMap.put("showCommentForMeList", showCommentForMeList);
        return modelMap;
    }

    @RequestMapping("/delcomment")
    @ResponseBody
    public Map<String, Object> delComment(HttpServletRequest request){
        int coid = Integer.parseInt(request.getParameter("coid"));
        commentService.deleteComment(coid);
        return new HashMap<>();
    }

    @RequestMapping("/reply")
    @ResponseBody
    public Map<String, Object> reply(HttpServletRequest request, HttpSession session){
        int uid2 = Integer.parseInt(request.getParameter("uid"));
        String content = request.getParameter("content");
        int arid = Integer.parseInt(request.getParameter("arid"));

        int uid1 = ((User) session.getAttribute("user")).getUid();

        Comment comment = new Comment();
        comment.setUid1(uid1);
        comment.setUid2(uid2);
        comment.setCocontent(content);
        comment.setArid(arid);
        commentService.insertComment(comment);
        return new HashMap<>();
    }

}
