<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>图书管理系统读者端</title>
    <link rel="stylesheet" href="./css/userLogin.css">
    <script>
        <c:if test="${param.tips != null}">
        alert("${param.tips}")
        </c:if>
    </script>
</head>
<body>
  <div class="wrapper">
    <div class="from_wrapper sign_in">
        <form class="loginForm" action="${pageContext.request.contextPath}/UserLogin" method="post">
            <h2>Login</h2>
            <div class="input_group">
                <input type="text" id="user" type="text" name="userName" required>
                <label for="">Username</label>
            </div>
            <div class="input_group">
                <input id="mima" type="password" name="userPasswd" required>
                <label for="">Password</label>
            </div>
            <div class="remember">
                <label for="">
                    <input type="checkbox">
                    Remember
                </label>
            </div>
            <button type="submit">Login</button>
            <div class="signUp_link">
                <p>
                    Don`t have an account?
                    <a href="#" class="signUpBtn_link">Sign Up</a>
                </p>
                <p>
                    Switch to administrator
                    <a href="rootLogin.jsp" class="signUpBtn_link">Root Login In</a>
                </p>
            </div>
        </form>
    </div>

    <div class="from_wrapper sign_up">
        <form class="registerForm" action="${pageContext.request.contextPath}/UserRegister" method="post">
            <h2>Sign Up</h2>
            <div class="input_group">
                <input id="zcname"  name="registerUserName"  type="text" required>
                <label for="">Username</label>
            </div>
            <div class="input_group">
                <input id="zcid"  name="registerUserBookId" type="text" required>
                <label for="">ID-card</label>
            </div>
            <div class="input_group">
                <input id="zcmima"  name="registerUserPasswd"  type="password" required>
                <label for="">Password</label>
            </div>
            <div class="remember">
                <label for="">
                    <input type="checkbox">
                    I agree to the terms & conditions
                </label>
            </div>
            <button type="submit">Sign Up</button>
            <div class="signUp_link">
                <p>
                    Already have an account?
                    <a href="#" class="signInBtn_link">Sign In</a>
                </p>
            </div>
        </form>
    </div>
  </div>  


    <script src="./js/userLogin.js"></script>
</body>
</html>