package com.gaoyang.user.controller;


import com.gaoyang.common.pojo.User;
import com.gaoyang.user.service.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/signup")
@Slf4j
public class RegisterController {

    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    @ResponseBody
    public User signUp(@PathVariable Integer id) {
        log.info("接收注册请求");
        User user = userService.getUserById(id);
        log.info("请求common模块数据完成,数据为{}", user);
        return user;
    }
}
