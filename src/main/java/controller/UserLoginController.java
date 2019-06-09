package controller;

import client.FaceMatch;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.User;
import service.UserService;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;


import java.io.*;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserLoginController {
    @Autowired
    private UserService userService;
    @RequestMapping(value = "sc",method = RequestMethod.POST)
    public  @ResponseBody Map<String,Object> test2(@RequestBody String sj) throws Exception {

        sj=sj.replaceAll("%2B","+");
        sj=sj.replaceAll("%2F","/");
        sj=sj.replaceAll("%3D","=");
        int aa=sj.indexOf("=");
        sj=sj.substring(aa+1);

        GenerateImage(sj);
        FaceMatch faceMatch=new FaceMatch();
        Map<String,Object> map=new HashMap<>();
        double score=0;
        int indexScore=0;
        map.put("msg","失败");
        List<User> list=userService.findall();
        for (User user:list) {
            String resultMsg=faceMatch.match("F:\\1.png",user.getUimage());

            indexScore=resultMsg.indexOf("\"score\"");
            try {
                score=Double.parseDouble(resultMsg.substring(indexScore+8,indexScore+11));
            }
            catch (Exception e){
                map.put("msg","请把正脸对准");

            }

            System.out.println(score);

            if (score>=80)
            {
                map.put("msg",1);
                map.put("username",user.getUname());
                break;
            }

            else
                map.put("msg",0);
        }

        return map;
    }
 // base64字符串转化成图片
         public  boolean GenerateImage(String imgStr) throws Exception{ // 对字节数组字符串进行Base64解码并生成图片
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
             OutputStream out = new FileOutputStream("F:\\1.png");
             out.write(b);
             out.flush();
             out.close();
             return true;
         }
    public  String GetImageStr(String imgFile) {// 将图片文件转化为字节数组字符串，并对其进行Base64编码处理

        InputStream in = null;
        byte[] data = null;
        // 读取图片字节数组
        try {
            in = new FileInputStream(imgFile);
            data = new byte[in.available()];
            in.read(data);
            in.close();
        } catch (IOException e) {
            e.printStackTrace();
        }
        // 对字节数组Base64编码
        BASE64Encoder encoder = new BASE64Encoder();
        return encoder.encode(data);// 返回Base64编码过的字节数组字符串
    }

    public String index2(){
        return "success";
    }
}
