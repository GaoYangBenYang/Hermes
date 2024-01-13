package com.gaoyang.user.service;

import com.gaoyang.common.pojo.User;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@FeignClient(value = "service-common")//指定nacos下的哪个微服务
public interface UserService {
    @RequestMapping("/user/{id}")
    User getUserById(@PathVariable Integer id);
}
