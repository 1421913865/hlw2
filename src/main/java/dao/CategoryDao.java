package dao;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import pojo.Category;

import java.util.List;

@Repository
public interface CategoryDao {

    @Select("select * from category")
    List<Category> queryCategoryList();

}
