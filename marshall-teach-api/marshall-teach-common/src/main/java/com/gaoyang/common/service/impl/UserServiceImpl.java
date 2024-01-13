package com.gaoyang.common.service.impl;

import com.gaoyang.common.dao.UserDao;
import com.gaoyang.common.pojo.User;
import com.gaoyang.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserDao userDao;

    @Override
    public User getUserById(Integer id) {
        return userDao.getUserById(id);
    }
}
