<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/5/26
  Time: 13:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <a href="/user/findall">测试</a>
    <a href="/user/checkexit?uname=21">测试11</a>
<form action="/user/save" method="post">
    账号<input type="text" name="uname">
    密码<input type="text" name="upassword">

    <button type="submit" >提交</button>
</form>
</body>
</html>
