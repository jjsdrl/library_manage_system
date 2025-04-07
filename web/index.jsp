<%@ page import="org.apache.ibatis.jdbc.Null" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.lms.pojo.User" %><%--
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
<script src="js/lib/axios/dist/axios.min.js" ></script>
<script type="module">
  // import axios from 'axios';
  var app = new Vue({
    el: '#app',
    data: {},
    components: {
      cpn1: {
        template: `
        <el-container style="height: 500px; border: 1px solid #eee">
  <el-aside width="200px" style="background-color: rgb(238, 241, 246)">
    <el-menu :default-openeds="['1', '3']">
      <el-submenu index="1">
        <template slot="title"><i class="el-icon-message"></i>导航一</template>
        <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="1-1">选项1</el-menu-item>
          <el-menu-item index="1-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="1-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="1-4">
          <template slot="title">选项4</template>
          <el-menu-item index="1-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-submenu index="2">
        <template slot="title"><i class="el-icon-menu"></i>导航二</template>
        <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="2-1">选项1</el-menu-item>
          <el-menu-item index="2-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="2-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="2-4">
          <template slot="title">选项4</template>
          <el-menu-item index="2-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
      <el-submenu index="3">
        <template slot="title"><i class="el-icon-setting"></i>导航三</template>
        <el-menu-item-group>
          <template slot="title">分组一</template>
          <el-menu-item index="3-1">选项1</el-menu-item>
          <el-menu-item index="3-2">选项2</el-menu-item>
        </el-menu-item-group>
        <el-menu-item-group title="分组2">
          <el-menu-item index="3-3">选项3</el-menu-item>
        </el-menu-item-group>
        <el-submenu index="3-4">
          <template slot="title">选项4</template>
          <el-menu-item index="3-4-1">选项4-1</el-menu-item>
        </el-submenu>
      </el-submenu>
    </el-menu>
  </el-aside>

  <el-container>
    <el-header style="text-align: right; font-size: 12px">
      <el-dropdown>
        <i class="el-icon-setting" style="margin-right: 15px"></i>
        <el-dropdown-menu slot="dropdown">
          <el-dropdown-item>查看</el-dropdown-item>
          <el-dropdown-item>新增</el-dropdown-item>
          <el-dropdown-item>删除</el-dropdown-item>
        </el-dropdown-menu>
      </el-dropdown>
      <span>王小虎</span>
    </el-header>

    <el-main>
      <el-table :data="tableData">
        <el-table-column prop="userName" label="用户名" width="140">
        </el-table-column>
        <el-table-column prop="userPasswd" label="密码" width="120">
        </el-table-column>


      </el-table>
    </el-main>
  </el-container>
</el-container>`,
        data() {
          return {
            tableData: [],
          }
        },
        created(){
          axios.get('/library_manage_system/AllUser')
                  .then(response => {
                    // 假设服务器返回了一个用户数组
                    this.tableData = response.data;
                    console.log(this.tableData);
                  })
                  .catch(error => {
                    console.error('There was an error fetching the users!', error);
                  });
        },
        methods:{

        }
      }
    },
  });
</script>
</body>
</html>

