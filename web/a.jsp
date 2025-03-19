<%@ page import="java.net.URLEncoder" %><%--
  Created by IntelliJ IDEA.
  User: 75084
  Date: 2025/3/17
  Time: 上午10:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
<%
    int count = Integer.parseInt(request.getParameter("count"));
    int []arr = new int[20];
    arr[0]=1;
    arr[1]=1;
    for (int i = 2;i<20;i++){
        arr[i]=arr[i-1]+arr[i-2];
    }
%>
</body>
</html>