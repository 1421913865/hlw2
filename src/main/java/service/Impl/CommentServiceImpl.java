package service.Impl;

import dao.CommentDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Comment;
import service.CommentService;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService{
    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> queryCommentListByArid(int arid) {
        return commentDao.queryCommentListByArid(arid);
    }

    @Override
    public void insertComment(Comment comment) {
        commentDao.insertComment(comment);
    }

    @Override
    public List<Comment> queryCommentListByUid1(int uid) {
        return commentDao.queryCommentListByUid1(uid);
    }

    @Override
    public List<Comment> queryCommentListByUid2(int uid2) {
        return commentDao.queryCommentListByUid2(uid2);
    }

    @Override
    public void deleteComment(int coid) {
        commentDao.deleteComment(coid);
    }

    @Override
    public void deleteCommentByArid(int arid) {
        commentDao.deleteCommentByArid(arid);
    }

}
