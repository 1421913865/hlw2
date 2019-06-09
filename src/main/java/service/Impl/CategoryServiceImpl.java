package service.Impl;

import dao.CategoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Category;
import service.CategoryService;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService{
    @Autowired
    private CategoryDao categoryDao;

    @Override
    public List<Category> queryCategoryList() {
        return categoryDao.queryCategoryList();
    }
}
