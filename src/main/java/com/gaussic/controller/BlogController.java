package com.gaussic.controller;

import com.gaussic.model.BlogEntity;
import com.gaussic.model.UserEntity;
import com.gaussic.repository.BlogRepository;
import com.gaussic.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

@Controller
public class BlogController {

    @Autowired
    private BlogRepository blogRepository;

    @Autowired
    private UserRepository userRepository;

    // 查看所有博文
    @RequestMapping(value = "/admin/blogs", method = RequestMethod.GET)
    public String showBlogs(ModelMap modelMap) {
        List<BlogEntity> blogList = blogRepository.findAll();
        modelMap.addAttribute("blogList", blogList);
        return "admin/blogs";
    }

    // 添加博文
    @RequestMapping(value = "/admin/blogs/add", method = RequestMethod.GET)
    public String addBlog(ModelMap modelMap) {
        List<UserEntity> userList = userRepository.findAll();
        // 向jsp页面注入用户列表
        modelMap.addAttribute("userList", userList);
        return "admin/addBlog";
    }

    // 添加博文，POST请求，重定向为查看博客页面
    @RequestMapping(value = "/admin/blogs/addP", method = RequestMethod.POST)
    public String addBlogPost(@ModelAttribute("blog") BlogEntity blogEntity) {
        blogRepository.saveAndFlush(blogEntity);
        return "redirect:/admin/blogs";
    }

    // 查看博文详情
    @RequestMapping(value = "/admin/blogs/show/{id}", method = RequestMethod.GET)
    public String showBlog(@PathVariable("id") Integer id, ModelMap modelMap) {
        BlogEntity blogEntity = blogRepository.findOne(id);
        modelMap.addAttribute("blogEntity", blogEntity);
        return "admin/blogDetail";
    }

    // 更新博文内容页面
    @RequestMapping(value = "/admin/blogs/update/{id}", method = RequestMethod.GET)
    public String updateBlog(@PathVariable("id") Integer id, ModelMap modelMap) {
        BlogEntity blogEntity = blogRepository.findOne(id);
        List<UserEntity> userList = userRepository.findAll();
        modelMap.addAttribute("blogEntity", blogEntity);
        modelMap.addAttribute("userList", userList);
        return "admin/updateBlog";
    }

    // 修改博文内容，POST请求
    @RequestMapping(value = "/admin/blogs/updateP", method = RequestMethod.POST)
    public String updateBlogP(@ModelAttribute("blogP") BlogEntity blogEntity) {
        // 更新博文内容
        blogRepository.updateBlog(blogEntity.getTitle(), blogEntity.getUserByUserId().getId(),
                blogEntity.getContent(), blogEntity.getPubDate(), blogEntity.getId());
        blogRepository.flush();
        return "redirect:/admin/blogs";
    }

    // 删除博文
    @RequestMapping(value = "/admin/blogs/delete/{id}", method = RequestMethod.GET)
    public String deleteBlog(@PathVariable("id") Integer id) {
        blogRepository.delete(id);
        blogRepository.flush();
        return "redirect:/admin/blogs";
    }
}
