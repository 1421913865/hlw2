package service.Impl;

import dao.UserDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.User;
import service.UserService;

import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;
    @Override
    public List<User> findall() {
        System.out.println("查询用户userservice");
        return userDao.findall();
    }

    @Override
    public void save(User user) {
        System.out.println("增加用户");
        userDao.save(user);
    }

    @Override
    public User ckeckexit(String uname) {
        return userDao.ckeckexit(uname);
    }

    @Override
    public User ckeckpasswordexit(String uname, String upassword) {
        return userDao.ckeckpasswordexit(uname,upassword);
    }

    @Override
    public void updateuserinfo(User user) {
        System.out.println("修改用户信息");
        userDao.updateuserinfo(user);
    }

    @Override
    public User findByUid(int uid) {
        return userDao.findByUid(uid);
    }

    @Override
    public List<User> queryUnameList2(String uname, int size) {
        return userDao.queryUnameList2(uname,size);
    }
}
