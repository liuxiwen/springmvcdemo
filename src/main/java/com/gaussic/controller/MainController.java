package com.gaussic.controller;

import com.gaussic.model.UserEntity;
import com.gaussic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class MainController {

    @Autowired
    private UserRepository userRepository;

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/admin/users", method = RequestMethod.GET)
    public String getUsers(ModelMap modelMap) {
        // 查询users表中所有的记录
        List<UserEntity> userList = userRepository.findAll();
        // 将所有记录传递给要返回的jsp页面，放在userList中
        modelMap.addAttribute("userList", userList);
        // 返回pages目录下的admin/users.jsp页面
        return "admin/users";
    }

    // 添加用户页面
    @RequestMapping(value = "/admin/users/add", method = RequestMethod.GET)
    public String addUser() {
        return "admin/addUser";
    }

    // 处理添加用户请求，并重定向到用户管理页面
    @RequestMapping(value = "/admin/users/addP", method = RequestMethod.POST)
    public String addUserPost(@ModelAttribute("user") UserEntity userEntity) {
        // post请求传递过来的是一个UserEntity对象，里面包含了该用户的信息，通过@ModelAttribute()注解可以获取传递过来的user，并创建这个对象

        // 数据库中添加一个用户，并立即刷新缓存
        userRepository.saveAndFlush(userEntity);
        // 重定向到用户管理页面，方法为redirect:url
        return "redirect:/admin/users";
    }

    // 查看用户详情。@PathVariable可以收集url中的变量，需匹配的变量用{}括起来。例如：访问localhost:8080/admin/users/show/1, 将匹配id=1
    @RequestMapping(value = "/admin/users/show/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer userId, ModelMap modelMap) {
        // 找到userId所表示的用户
        UserEntity userEntity = userRepository.findOne(userId);
        // 传递给请求页面
        modelMap.addAttribute("user", userEntity);
        return "admin/userDetail";
    }

}
