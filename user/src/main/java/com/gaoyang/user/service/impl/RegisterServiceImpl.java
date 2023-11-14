package com.gaoyang.user.service.impl;

import com.gaoyang.common.pojo.User;
import com.gaoyang.user.service.RegisterService;
import com.gaoyang.user.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class RegisterServiceImpl implements RegisterService {

    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private DiscoveryClient discoveryClient;

    @Autowired
    private UserService userService;

    @Override
    public User getUserById(Integer id) {
//        nacos实现服务调用
//        List<ServiceInstance> instances = discoveryClient.getInstances("common-service");
//        ServiceInstance serviceInstance = instances.get(0);

//        User user = restTemplate.getForObject(serviceInstance.getUri()+"/user/"+id, User.class);

//        ribbon实现负载均衡
//        User user = restTemplate.getForObject("http://common-service/user/"+id, User.class);

//        Figen实现服务调用和负载均衡
        User user = userService.getUserById(id);
        return user;
    }
}
