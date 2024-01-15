package com.gaoyang.common.controller;

import com.gaoyang.common.pojo.User;
import com.gaoyang.common.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired
    private UserService userService;

    @GetMapping("/{id}")
    @ResponseBody
    public User getUserById(@PathVariable Integer id) {
        return userService.getUserById(id);
    }
}
