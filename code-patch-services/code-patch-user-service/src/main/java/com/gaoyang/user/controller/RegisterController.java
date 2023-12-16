package com.gaoyang.user.controller;


import com.gaoyang.common.pojo.User;
import com.gaoyang.user.service.RegisterService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/signup")
@Slf4j
public class RegisterController {
    @Autowired
    private RegisterService registerService;

    @GetMapping("/{id}")
    public User signUp(@PathVariable Integer id) {
        log.info("接收注册请求");
        User user = registerService.getUserById(id);
        log.info("请求common模块数据完成,数据为{}", user);
        return user;
    }
}
