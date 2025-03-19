<%--
  Created by IntelliJ IDEA.
  User: 75084
  Date: 2025/2/27
  Time: 下午7:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>图书管理系统</title>
    <link rel="stylesheet" href="css/style.css"/>
    <script>
        <c:if test="${param.tips != null}">
        alert("${param.tips}")
        </c:if>
    </script>
</head>
<body class="login_bg">
<section class="loginBox">
    <header class="loginHeader">
        <h1>图书管理系统</h1>
    </header>
    <section class="loginCont">
        <%--  ${pageContext.request.contextPath} == /lms 获取项目的虚拟访问路径      --%>
        <form class="loginForm" action="${pageContext.request.contextPath}/Root" method="post">
            <div class="inputbox">
                <label for="root">账号：</label>
                <input id="root" type="text" name="rootName" placeholder="请输入账号" required/>
            </div>
            <div class="inputbox">
                <label for="mima">密码：</label>
                <input id="mima" type="password" name="rootPasswd" placeholder="请输入密码" required/>
            </div>
            <div class="subBtn">
                <input type="submit" value="登录" />
                <input type="reset" value="重置"/>
            </div>

        </form>
    </section>
</section>

</body>
</html>

