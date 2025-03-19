<%--
  Created by IntelliJ IDEA.
  User: 75084
  Date: 2025/2/28
  Time: 下午3:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title></title>
  <%--    导入vue.js依赖  --%>
  <script src="./js/vue.js"></script>
  <%--    导入element依赖 --%>
  <script src="./js/Element.js"></script>
  <link rel="stylesheet" href="./css/Element.css">
  <link rel="stylesheet" href="./css/index.css">

</head>
<body>
<div id="app">
  <cpn1></cpn1>

</div>

<script>
  var app = new Vue({
    el: '#app',
    data: {

    },
    components: {
      cpn1: {
        template: `
        <el-container>
  <el-header>
           <el-header style="text-align: right; font-size: 12px">

          <span>
            Welcome，${sessionScope.loginUser.userName}
            Welcome，${sessionScope.loginRoot.rootName}
            <a href="${pageContext.request.contextPath}/loginOut">退出系统</a>
          </span>
          </el-header>
  <el-container>
    <el-aside width="200px">Aside</el-aside>
    <el-container>
      <el-main>Main
      <i class="el-icon-lollipop"></i>
      </el-main>
      <el-footer>Footer</el-footer>
    </el-container>
  </el-container>
</el-container>
        `,
        data() {
          const item = {
            date: '2025-02-27',
            name: '周发鸿',
            address: '泰豪动漫职业学院'
          };
          return {
            tableData: Array(20).fill(item)
          }
        }
      },
    },
    methods: {
    }
  });
</script>
</body>
</html>

