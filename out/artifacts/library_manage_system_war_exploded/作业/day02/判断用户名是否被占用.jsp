<%--
  Created by IntelliJ IDEA.
  User: 75084
  Date: 2025/3/3
  Time: 下午6:45
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script>
      var showMessage = function(input){
        var userName = input.value.trim();
        var userNameMessage = document.getElementById("userNameMessage");
        if(userName ==""){
          userNameMessage.style.color = "red";
          userNameMessage.innerHTML = "用户名不能为空";
          return;
        }
        if(userName =="dinghongyu"){
          userNameMessage.style.color = "red";
          userNameMessage.innerHTML = "用户名被占用";
        }else{
          userNameMessage.style.color = "green";
          userNameMessage.innerHTML = "用户名可以使用";
        }
      }
      function showPicture(){
        document.getElementById("show").innerHTML = "<img width='200px' src='<%= request.getContextPath()  %>/images/1.jpg' alt=''>";
      }
    </script>
</head>
<body>
    <input type="text" onblur="showMessage(this)"><span id="userNameMessage"></span>
    <br>
    <input type="submit" name="" id="" onclick="showPicture()" value="加载图片"><span id="show"></span>
</body>
</html>
