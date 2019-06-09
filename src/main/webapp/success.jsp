<%--
  Created by IntelliJ IDEA.
  User: asus
  Date: 2019/5/24
  Time: 17:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <script src="js/jquery.min.js"></script>
    <c:forEach items="${list}" var="user">
        ${user.account}
    </c:forEach>
</head>
<body>
success找到了
<br>

</body>
</html>
