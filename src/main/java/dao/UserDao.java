package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import pojo.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

@Repository
public interface UserDao {
    @Select("select * from user")
    public List<User> findall();
    @Select("select * from user where uname=#{0}")
    public User ckeckexit(String uname);
    @Select("select * from user where uname=#{uname} and upassword=#{upassword}")
    public User ckeckpasswordexit(@Param("uname") String uname, @Param("upassword")String upassword);
    @Insert("insert into user(uname,upassword,uimage,userimage,userprofile) values(#{uname},#{upassword},#{uimage},#{userimage},#{userprofile})")
    public void save(User user);
    @Update("update user SET upassword=#{upassword},uimage=#{uimage},userimage=#{userimage}," +
            "userprofile=#{userprofile} where uname=#{uname}")
    public void updateuserinfo(User user);
 }
