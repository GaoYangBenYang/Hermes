package com.gaoyang.common.dao;


import com.gaoyang.common.pojo.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface UserDao {
    @Select("select * from code_fixer.user where user_id = #{id}")
    User getUserById(Integer id);
}
