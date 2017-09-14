<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
<%--
  Created by IntelliJ IDEA.
  User: liuxiwen
  Date: 2017/9/14
  Time: 8:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后 -->
    <title>SpringMVC 博文详情</title>
    <!-- Bootstrap核心CSS文件-->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" />
</head>
<body>

<div class="container">
    <h1>SpringMVC 博文详情</h1>
    <hr/>
    <table class="table table-bordered table-striped">
        <tr>
            <th>ID</th>
            <td>${blogEntity.id}</td>
        </tr>
        <tr>
            <th>Title</th>
            <td>${blogEntity.title}</td>
        </tr>
        <tr>
            <th>Author</th>
            <td>${blogEntity.userByUserId.nickname}, ${blogEntity.userByUserId.firstName} ${blogEntity.userByUserId.lastName}</td>
        </tr>
        <tr>
            <th>Content</th>
            <td>${blogEntity.content}</td>
        </tr>
        <tr>
            <th>Publish Date</th>
            <td><fmt:formatDate value="${blogEntity.pubDate}" pattern="yyyy年MM月dd日"/></td>
        </tr>
    </table>
</div>

<!-- jQuery文件，务必在Bootstrap.min.js之前引入 -->
<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- Bootstrap核心JavaScript文件 -->
<script type="text/javascript" src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
