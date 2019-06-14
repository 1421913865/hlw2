package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import pojo.Comment;

import java.util.List;

public interface CommentDao {

    @Select("select * from comment where arid=#{arid}")
    public List<Comment> queryCommentListByArid(int arid);

    @Insert("insert into comment(uid1,uid2,arid,cocontent) values (#{uid1},#{uid2}," +
            "#{arid},#{cocontent})")
    public void insertComment(Comment comment);

    @Select("select * from comment where uid1=#{uid1}")
    public List<Comment> queryCommentListByUid1(int uid1);

    @Select("select * from comment where uid2=#{uid2}")
    public List<Comment> queryCommentListByUid2(int uid2);

    @Delete("delete from comment where coid=#{coid}")
    public void deleteComment(int coid);

    @Delete("delete from comment where arid=#{arid}")
    public void deleteCommentByArid(int arid);


}
