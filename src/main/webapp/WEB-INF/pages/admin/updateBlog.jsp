<%--
  Created by IntelliJ IDEA.
  User: liuxiwen
  Date: 2017/9/14
  Time: 9:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt_rt" %>
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
    <h1>SpringMVC 修改博客</h1>
    <hr/>
    <form:form action="/admin/blogs/updateP" method="post" commandName="blogP" role="form">
        <div class="form-group">
            <label for="title">Title:</label>
            <input type="text" class="form-control" id="title" name="title" placeholder="Enter Title:" value="${blogEntity.title}" />
        </div>
        <div class="form-group">
            <label for="userByUserId.id">Author:</label>
            <select class="form-control" id="userByUserId.id" name="userByUserId.id">
                <c:forEach items="${userList}" var="user">
                    <c:if test="${user.id==blogEntity.userByUserId.id}">
                        <option value="${user.id}" selected="selected">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                    </c:if>
                    <c:if test="${user.id!=blogEntity.userByUserId.id}">
                        <option value="${user.id}">${user.nickname}, ${user.firstName} ${user.lastName}</option>
                    </c:if>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="content">Content:</label>
            <textarea class="form-control" id="content" name="content" rows="3"
                      placeholder="Please Input Content:">${blogEntity.content}</textarea>
        </div>
        <div class="form-group">
            <label for="pubDate">Publish Date:</label>
            <input type="date" class="form-control" id="pubDate" name="pubDate"
                   value="<fmt:formatDate value="${blogEntity.pubDate}" pattern="yyyy-MM-dd"/>" />
        </div>
        <!-- 把 id 一并写入 blogP 中 -->
        <input type="hidden" id="id" name="id" value="${blogEntity.id}"/>
        <div class="form-group">
            <button type="submit" class="btn btn-sm btn-success">提交</button>
        </div>
    </form:form>
</div>

<!-- jQuery文件，务必在Bootstrap.min.js之前引入 -->
<script type="text/javascript" src="//cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<!-- Bootstrap核心JavaScript文件 -->
<script type="text/javascript" src="//cdn.bootcss.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>
