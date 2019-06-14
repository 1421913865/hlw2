package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import pojo.Article;
import pojo.User;
import service.ArticleService;
import service.UserService;
import sun.misc.BASE64Decoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLDecoder;

import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private ArticleService articleService;
    @RequestMapping("/findall")
    public String findAll(Model model){
        System.out.println("表现层显示所有用户controller");
        List<User> list=userService.findall();
        model.addAttribute("list",list);
        return "success";
    }
    @RequestMapping("/save")
    public String save(String username,String password){
        System.out.println("保存");
        User user=new User();
        user.setUname(username);
        user.setUserimage("huge2.jpeg");
        user.setUserprofile("这个人很懒没写东西");
        user.setUpassword(password);
        int size=userService.findall().size();
        String image="F:\\"+(size+2)+".png";
        user.setUimage(image);
        userService.save(user);
        return "success";
    }

    @RequestMapping(value="/upload", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile(HttpServletRequest request,
                                          @RequestBody String touxiang) throws Exception {

        touxiang = touxiang.replaceAll("%2B", "+");
        touxiang = touxiang.replaceAll("%2F", "/");
        touxiang = touxiang.replaceAll("%3D", "=");
        System.out.println(touxiang);
        int index=touxiang.indexOf("=");
        int index2=touxiang.indexOf("&");
        String uname=touxiang.substring(index+1,index2);
        touxiang=touxiang.substring(index2+1);
        index=touxiang.indexOf("=");
        index2=touxiang.indexOf("&");
        String upassword=touxiang.substring(index+1,index2);
        touxiang=touxiang.substring(index2+1);
        index=touxiang.indexOf("=");
        index2=touxiang.indexOf("&");
        String userprofile=touxiang.substring(index+1,index2);
        userprofile = URLDecoder.decode(userprofile, "utf-8");
        touxiang=touxiang.substring(index2+1);
        System.out.println(uname+userprofile+upassword);
        index=touxiang.indexOf("%2C");
        touxiang=touxiang.substring(index+3);
        String path="F:\\ideaSource\\hlw2\\src\\main\\webapp\\userimage\\"+uname+".png";
        Map<String,Object> map=new HashMap<>();
        map.put("aa",1);
        User user=userService.ckeckexit(uname);
        if (upassword!=null&&upassword.length()>0)
        user.setUpassword(upassword);
        user.setUserimage((uname+".png"));
        user.setUserprofile(userprofile);
        userService.updateuserinfo(user);
        System.out.println("*********"+user.getUid());
        GenerateImage(touxiang,path);
        return map;
    }
    @RequestMapping(value="/upload2", method=RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> uploadFile2(HttpServletRequest request,
                                          @RequestBody String touxiang) throws Exception {

        touxiang = touxiang.replaceAll("%2B", "+");
        touxiang = touxiang.replaceAll("%2F", "/");
        touxiang = touxiang.replaceAll("%3D", "=");
        System.out.println(touxiang);
        int index=touxiang.indexOf("=");
        int index2=touxiang.indexOf("&");
        String uname=touxiang.substring(index+1,index2);
        touxiang=touxiang.substring(index2+1);
        index=touxiang.indexOf("=");
        index2=touxiang.indexOf("&");
        String upassword=touxiang.substring(index+1,index2);
        touxiang=touxiang.substring(index2+1);
        index=touxiang.indexOf("=");
        String userprofile=touxiang.substring(index+1);
        userprofile = URLDecoder.decode(userprofile, "utf-8");
        touxiang=touxiang.substring(index2+1);
        System.out.println(uname+userprofile+upassword);
        User user=userService.ckeckexit(uname);
        if (upassword!=null&&upassword.length()>0)
        user.setUpassword(upassword);
        user.setUserimage(uname);
        user.setUserprofile(userprofile);
        userService.updateuserinfo(user);
        Map<String,Object> map=new HashMap<>();
        map.put("aa",1);
        return map;
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

    @RequestMapping("/nologin")
    public String nologin( HttpServletRequest request){

        List<Article> tuijian=articleService.findRecommend();
        System.out.println(tuijian);
        int count1=1;
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        for (Article a:tuijian
                ) {
            User user1=userService.findByUid(a.getUid());
            String content = contentAlert(a.getArcontent());
            a.setArcontent(content);
            System.out.println(a);
            System.out.println(user1);
            String date=simpleDateFormat.format(a.getArcreatetime());
            request.getSession().setAttribute(("RecommendDate"+count1),date);
            request.getSession().setAttribute(("RecommendArticle"+count1),a);
            request.getSession().setAttribute(("RecommendUser"+count1),user1);
            count1++;
        }
        List<Article> top3=articleService.findtop3();

        int count=1;
        for (Article a:top3
                ) {
            User user1=userService.findByUid(a.getUid());
            System.out.println(user1);
            request.getSession().setAttribute(("top"+count),user1);
            count++;
        }
        return "main";
    }
    @RequestMapping("/login/{uname}")
    public String login(@PathVariable("uname") String uname, HttpServletRequest request){

        System.out.println("*****************************");
        User user=userService.ckeckexit(uname);
        if (user.getUserprofile()==null){
            user.setUserprofile("这个人很懒没写东西");
        }
        if(user.getUserimage()==null){
            user.setUserimage("huge2.jpeg");
        }
        System.out.println("login:  "+uname);
        List<Article> tuijian=articleService.findRecommend();
        System.out.println(tuijian);
        int count1=1;
        SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
        for (Article a:tuijian
                ) {
            User user1=userService.findByUid(a.getUid());
            String content = contentAlert(a.getArcontent());
            a.setArcontent(content);
            System.out.println(a);
            System.out.println(user1);
            String date=simpleDateFormat.format(a.getArcreatetime());
            if(a.getCaid()==1) request.getSession().setAttribute(("RecommendImg"+count1),"java.jpg");
            else if(a.getCaid()==2) request.getSession().setAttribute(("RecommendImg"+count1),"C.jpg");
            else if(a.getCaid()==3) request.getSession().setAttribute(("RecommendImg"+count1),"js.jpg");
            else if(a.getCaid()==4) request.getSession().setAttribute(("RecommendImg"+count1),"php.jpg");
            else if(a.getCaid()==5) request.getSession().setAttribute(("RecommendImg"+count1),"suanfa.jpg");
            else if(a.getCaid()==6) request.getSession().setAttribute(("RecommendImg"+count1),"sjjg.jpg");
            else if(a.getCaid()==7) request.getSession().setAttribute(("RecommendImg"+count1),"czxt.jpg");
            else if(a.getCaid()==8) request.getSession().setAttribute(("RecommendImg"+count1),"jsjwl.jpg");
            request.getSession().setAttribute(("RecommendDate"+count1),date);
            request.getSession().setAttribute(("RecommendArticle"+count1),a);
            request.getSession().setAttribute(("RecommendUser"+count1),user1);
            count1++;
        }
        List<Article> top3=articleService.findtop3();

        int count=1;
        for (Article a:top3
             ) {
            User user1=userService.findByUid(a.getUid());
            System.out.println(user1);
            request.getSession().setAttribute(("top"+count),user1);
            count++;
        }
        request.getSession().setAttribute("user",user);
        return "main";
    }
    @RequestMapping(value = "checkexit",method = RequestMethod.POST)
    public  @ResponseBody
    Map<String,Object> checkexit(@RequestBody String uname){
        System.out.println("jiancha  "+uname);
        int aa=uname.indexOf("=");
        uname=uname.substring(aa+1);
        User user=userService.ckeckexit(uname);
        Map<String,Object> map=new HashMap<>();

        if (user!=null){
            map.put("check",1);
            System.out.println("123***");
        }
        else {
            map.put("check",0);
        }
        return map;
    }
    @RequestMapping(value = "tuichu",method = RequestMethod.POST)
    public  @ResponseBody
    Map<String,Object> tuichu(HttpServletRequest request){
        System.out.println(123);
        Map<String,Object> map=new HashMap<>();
        request.getSession().removeAttribute("user");
        return map;
    }
    @RequestMapping(value = "checkpasswordexit",method = RequestMethod.POST)
    public  @ResponseBody
    Map<String,Object> checkpasswordexit(@RequestBody String uname,@RequestBody String upassword){
        System.out.println("jiancha  "+uname+"  "+upassword);
        int aa=uname.indexOf("=");
        int bb=uname.indexOf("&");
        uname=uname.substring(aa+1,bb);
        aa=upassword.lastIndexOf("=");
        upassword=upassword.substring(aa+1);
        System.out.println("jiancha222  "+uname+"  "+upassword);
        User user=userService.ckeckpasswordexit(uname,upassword);
        Map<String,Object> map=new HashMap<>();

        if (user!=null){
            map.put("check",1);

        }
        else {
            map.put("check",0);
        }
        return map;
    }
    @RequestMapping(value = "sc2",method = RequestMethod.POST)
    public  @ResponseBody Map<String,Object> zpzhuce(@RequestBody String sj) throws Exception {

        sj = sj.replaceAll("%2B", "+");
        sj = sj.replaceAll("%2F", "/");
        sj = sj.replaceAll("%3D", "=");
        int aa = sj.indexOf("=");
        sj = sj.substring(aa + 1);
       List<User> list= userService.findall();

       String path="F://"+(list.size()+2)+".png";
        System.out.println("path  "+path);
        GenerateImage(sj,path);
        Map<String,Object> map=new HashMap<>();
        map.put("aa",1);
        return map;
    }
    public  boolean GenerateImage(String imgStr,String path) throws Exception{ // 对字节数组字符串进行Base64解码并生成图片
        if (imgStr == null) // 图像数据为空
            return false;
        BASE64Decoder decoder = new BASE64Decoder();
        byte[] b = decoder.decodeBuffer(imgStr);
        // Base64解码,对字节数组字符串进行Base64解码并生成图片

        for (int i = 0; i < b.length; ++i) {
            if (b[i] < 0) {// 调整异常数据
                b[i] += 256;
            }
        }
        // 生成jpeg图片
        // String imgFilePath = "c://temp_kjbl_001_ab_010.jpg";//新生成的图片
        OutputStream out = new FileOutputStream(path);
        out.write(b);
        out.flush();
        out.close();
        return true;
    }
}
