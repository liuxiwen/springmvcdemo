<%--
  Created by IntelliJ IDEA.
  User: liuxiwen
  Date: 2017/9/13
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- 上述3个meta标签必须放在最前面，任何其他内容都必须跟随其后 -->
    <title>SpringMVC 用户管理</title>
    <!-- Bootstrap核心CSS文件-->
    <link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css" />
</head>
<body>

<div class="container">
    <h1>SpringMVC 博客系统-用户管理</h1>
    <hr/>
    <h3>所有用户<a href="/admin/users/add" type="button" class="btn btn-primary btn-sm">添加</a></h3>
    <!-- 如果用户列表为空 -->
    <c:if test="${empty userList}">
        <div class="alert alert-warning" role="alert">
            <span class="glyphicon glyphicon-info-sign" aria-hidden="true"></span>user表为空，请<a href="/admin/users/add" type="button" class="btn btn-primary btn-sm">添加</a>
        </div>
    </c:if>
    <!-- 如果用户列表非空 -->
    <c:if test="${!empty userList}">
        <table class="table table-bordered table-striped">
            <tr>
                <th>ID</th>
                <th>昵称</th>
                <th>姓名</th>
                <th>密码</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${userList}" var="user">
                <tr>
                    <td>${user.id}</td>
                    <td>${user.nickname}</td>
                    <td>${user.firstName} ${user.lastName}</td>
                    <td>${user.password}</td>
                    <td>
                        <a href="/admin/users/show/${user.id}" type="button" class="btn btn-sm btn-success">详情</a>
                        <a href="/admin/users/update/${user.id}" type="button" class="btn btn-sm btn-warning">修改</a>
                        <a href="/admin/users/delete/${user.id}" type="button" class="btn btn-sm btn-danger">删除</a>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </c:if>
</div>

<!-- jQuery文件，务必在Bootstrap.min.js之前引入 -->
<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- Bootstrap核心JavaScript文件 -->
<script type="text/javascript" src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
