package service;

import pojo.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> queryCommentListByArid(int arid);
    void insertComment(Comment comment);
    List<Comment> queryCommentListByUid1(int uid);
    List<Comment> queryCommentListByUid2(int uid2);
    void deleteComment(int coid);
    void deleteCommentByArid(int arid);

}
