<%--
  Created by IntelliJ IDEA.
  User: 75084
  Date: 2025/3/3
  Time: 下午8:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Insert title here</title>
    <script>
        var showMessage = function (input){
            var userName =input.value.trim();
            var userNameMessage = document.getElementById("userNameMessage");
            if(userName==""){
                userNameMessage.style.color="red";
                userNameMessage.innerHTML="用户名不能为空";
                return;
            }
            if(userName =="zhangsan"){
                userNameMessage.style.color="red";
                userNameMessage.innerHTML="用户名已经被占用！";
            }else{
                userNameMessage.style.color ="green";
                userNameMessage.innerHTML="用户名可以使用！";
            }
        }
        function showPicture(){
            document.getElementById("show").innerHTML=
                "<img width=200 src='<%=request.getContextPath()%>/images/JavaEE.jpg'>";
        }
    </script>
</head>
<body>
<input onblur="showMessage(this)" type="text"/><span id="userNameMessage"></span>
<br/>
<input type="submit" onclick="showPicture()" value="加载照片"/><span id="show"></span>

</body>
</html>