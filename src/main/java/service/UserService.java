package service;


import pojo.User;


import java.util.List;

public interface UserService {

    public List<User> findall();
    public void save(User user);
    public User ckeckexit(String uname);
    public User ckeckpasswordexit(String uname,String upassword);
    public void updateuserinfo(User user);
    public User findByUid(int uid);
    public List<User> queryUnameList2( String uname,int size);
}
