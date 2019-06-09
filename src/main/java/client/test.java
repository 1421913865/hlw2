package client;
import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import pojo.User;
import service.Impl.UserServiceImpl;
import service.UserService;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;
@Controller
public class test {

    public static void main(String[] args) {
        String encodeStr="%E5%A4%A7";
        try {
            String decodeStr = URLDecoder.decode(encodeStr, "utf-8");
            System.out.println(decodeStr);
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }


    }
}
