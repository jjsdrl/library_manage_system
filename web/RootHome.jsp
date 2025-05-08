<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>

<head>
  <title></title>
  <script src="./js/vue.js"></script>
  <script src="./js/Element.js"></script>
  <script src="./js/RootHome.js"></script>
  <link rel="stylesheet" href="./css/Element.css">
  <link rel="stylesheet" href="./css/RootHome.css">
  <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">

</head>

<body>

  <div id="app">
    <el-container>
      <el-header>
        <div class="header_left" height="60px">
          <img src="./images/logo.png" alt="" width="50px" height="45px" style="float: left; margin-top: 7px;" />
          <span class="flicker" style="float: right;" id="PageName">鸿发图书</span>
        </div>
        <div class="header_center" style="display: inline;">
            <div id="selectBook" style="display: none;">
              <input type="text" id="seletebookInfo" class="search" name="seletebookInfo">
              <i class="el-icon-search searchI" @click="seletebook()"></i>
              <el-button type="success" plain @click="addbook()">新增图书</el-button>
            </div>
            <div id="seleteuser" style="display: none;">
              <input type="text" id="seleteuserInfo" class="search" name="seleteuserInfo">
              <i class="el-icon-search searchI" @click="seleteuser()"></i>
              <el-button type="success" plain @click="adduser()">新增用户</el-button>
            </div>
            <div id="seleteborr" style="display: none;">
              <input type="text" id="seleteborrInfo" class="search" name="seleteborrInfo">
              <i class="el-icon-search searchI" @click="seleteborr()"></i>
              <el-button type="success" plain @click="addborr()">新增借阅</el-button>
            </div>
            <div id="seleteLib" style="display: none;">
              <input type="text" id="seleteLibInfo" class="search" name="seleteLibInfo">
              <i class="el-icon-search searchI" @click="seleteLib()"></i>
              <el-button type="success" plain @click="addLib()">新增借阅室</el-button>
            </div>
        </div>
        <div class="header_right">
          <el-dropdown>
            <span class="el-dropdown-link flicker">
              ${sessionScope.loginRoot.rootName}
            </span>
            <el-dropdown-menu slot="dropdown">
              <el-dropdown-item divided id="exit">退出</el-dropdown-item>
            </el-dropdown-menu>
          </el-dropdown>
        </div>

      </el-header>
      <el-container>
        <el-aside width="200px">
          <el-menu :default-openeds="['1', '3']">
            <el-submenu index="1">
              <template slot="title"><i class="el-icon-message"></i>用户信息管理</template>
              <el-menu-item-group>
                <template slot="title">用户管理</template>
                <el-menu-item index="1-1" id="UserIn">用户信息管理</el-menu-item>
                <!-- <el-menu-item index="1-2">借书证管理</el-menu-item> -->
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="2">
              <template slot="title"><i class="el-icon-menu"></i>图书信息管理</template>
              <el-menu-item-group>
                <template slot="title">书籍管理</template>
                <el-menu-item index="2-1" id="BookIn">书籍信息</el-menu-item>
                <el-menu-item index="2-2" id="BorrowIn">借阅管理</el-menu-item>
              </el-menu-item-group>
            </el-submenu>
            <el-submenu index="3">
              <template slot="title"><i class="el-icon-setting"></i>图书馆管理</template>
              <el-menu-item-group>
                <template slot="title">借阅室管理</template>
                <el-menu-item index="3-1" id="libIn">借阅室情况</el-menu-item>
                <!-- <el-menu-item index="3-2">借阅室维护信息</el-menu-item> -->
              </el-menu-item-group>
              <!-- <el-menu-item-group title="藏书区">
                <el-menu-item index="3-3">图书信息</el-menu-item>
              </el-menu-item-group> -->
            </el-submenu>
          </el-menu>
        </el-aside>
        <el-container id="Homejpg" style="display: block;">
          <el-main>
            <img src="./images/1.jpg" alt="" width="1300px" />
          </el-main>
        </el-container>
        <el-container id="UserInfo" style="display: none;">
          <el-main>
            <el-table :data="userInfo">
              <el-table-column prop="userName" label="账号" width="150">
              </el-table-column>
              <el-table-column prop="userPasswd" label="密码" width="400">
              </el-table-column>
              <el-table-column prop="userBookId" label="借书证号" width="300">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeUser(scope.row)" circle id="changeUser"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteUser(scope.row)" circle id="deleteUser"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="selectUserInfo" style="display: none;">
          <el-main>
            <el-table :data="selectuserInfo">
              <el-table-column prop="userName" label="账号" width="150">
              </el-table-column>
              <el-table-column prop="userPasswd" label="密码" width="400">
              </el-table-column>
              <el-table-column prop="userBookId" label="借书证号" width="300">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeUser(scope.row)" circle id="changeUser"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteUser(scope.row)" circle id="deleteUser"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="BookInformation" style="display: none;">
          <el-main>
            <el-table :data="bookInfo">
              <el-table-column prop="bookNo" label="图书编号" width="100">
              </el-table-column>
              <el-table-column prop="bookName" label="图书名" width="180">
              </el-table-column>
              <el-table-column prop="bookNumber" label="图书数量">
              </el-table-column>
              <el-table-column prop="bookAuthor" label="作者">
              </el-table-column>
              <el-table-column prop="press" label="出版社">
              </el-table-column>
              <el-table-column prop="pressTime" label="出版时间">
              </el-table-column>
              <el-table-column prop="ISBN" label="ISBN">
              </el-table-column>
              <el-table-column prop="address" label="分区">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeBook(scope.row)" circle id="changeBook"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteBook(scope.row)" circle id="deleteBook"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="selectBookInformation" style="display: none;">
          <el-main>
            <el-table :data="selectBookInfo">
              <el-table-column prop="bookNo" label="图书编号" width="100">
              </el-table-column>
              <el-table-column prop="bookName" label="图书名" width="180">
              </el-table-column>
              <el-table-column prop="bookNumber" label="图书数量">
              </el-table-column>
              <el-table-column prop="bookAuthor" label="作者">
              </el-table-column>
              <el-table-column prop="press" label="出版社">
              </el-table-column>
              <el-table-column prop="pressTime" label="出版时间">
              </el-table-column>
              <el-table-column prop="ISBN" label="ISBN">
              </el-table-column>
              <el-table-column prop="address" label="分区">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeBook(scope.row)" circle id="changeBook"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteBook(scope.row)" circle id="deleteBook"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="BorrowManagement" style="display: none;">
          <el-main>
            <el-table :data="borrowInfo">
              <el-table-column prop="bookNo" label="图书编号" width="100">
              </el-table-column>
              <el-table-column prop="userBookId" label="借书证号" width="150">
              </el-table-column>
              <el-table-column prop="state" label="状态">
              </el-table-column>
              <el-table-column prop="borrowTime" label="借出时间" width="220">
              </el-table-column>
              <el-table-column prop="returnTime" label="还入时间" width="220">
              </el-table-column>
              <el-table-column prop="text" label="备注">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeBorr(scope.row)" circle id="changeBorr"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteBorr(scope.row)" circle id="deleteBorr"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="selectBorrowManagement" style="display: none;">
          <el-main>
            <el-table :data="selectborrowInfo">
              <el-table-column prop="bookNo" label="图书编号" width="100">
              </el-table-column>
              <el-table-column prop="userBookId" label="借书证号" width="150">
              </el-table-column>
              <el-table-column prop="state" label="状态">
              </el-table-column>
              <el-table-column prop="borrowTime" label="借出时间" width="220">
              </el-table-column>
              <el-table-column prop="returnTime" label="还入时间" width="220">
              </el-table-column>
              <el-table-column prop="text" label="备注">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeBorr(scope.row)" circle id="changeBorr"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteBorr(scope.row)" circle id="deleteBorr"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="LibInfo" style="display: none;">
          <el-main>
            <el-table :data="LibInfo">
              <el-table-column prop="roomId" label="借阅室号" width="400">
              </el-table-column>
              <el-table-column prop="roomSize" label="借阅室容量" width="225">
              </el-table-column>
              <el-table-column prop="remainingPeople" label="现有人数" width="225">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeLib(scope.row)" circle id="changeLib"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteLib(scope.row)" circle id="deleteLib"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
        <el-container id="selectLibInfo" style="display: none;">
          <el-main>
            <el-table :data="selectLibInfo">
              <el-table-column prop="roomId" label="借阅室号" width="400">
              </el-table-column>
              <el-table-column prop="roomSize" label="借阅室容量" width="225">
              </el-table-column>
              <el-table-column prop="remainingPeople" label="现有人数" width="225">
              </el-table-column>
              <el-table-column prop="do" label="操作">
                <template slot-scope="scope">
                  <el-button type="primary" icon="el-icon-edit" @click="changeLib(scope.row)" circle id="changeLib"></el-button>
                  <el-button type="danger" icon="el-icon-delete" @click="deleteLib(scope.row)" circle id="deleteLib"></el-button>
                </template> 
              </el-table-column>
            </el-table>
          </el-main>
        </el-container>
      </el-container>
      <el-footer><span class="flicker">Footer</span></el-footer>
    </el-container>
        <!-- 重置密码 -->
        <div class="maskBox" id="MaskBox" style="display: none;">
          <button id="btn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
          <h2 class="text-xl font-bold mb-4">重置密码</h2>
          <form id="password-form" action="/library_manage_system/passwdChange" method="post">
              <div class="mb-4">
                  <label for="account" class="block text-gray-700 font-bold mb-2">账号</label>
                  <input type="text" id="account" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" disabled required>
              </div>
              <div class="mb-4">
                  <label for="library-card-number" class="block text-gray-700 font-bold mb-2">借书证号</label>
                  <input type="text" id="library-card-number" name="changeUserBookId" readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                         required>
              </div>
              <!-- 标识位 -->
              <input type="hidden"  name="hidden-number" value="2">
              <button type="submit"
                      class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">重置</button>
            </form>
          </div>
        </div>
        <!-- 修改图书 -->
        <div class="changeBookBox" id="changeBookBox" style="display: none;">
        <button id="changeBookbtn">×</button>
        <div class="bg-white p-8 rounded-md shadow-md w-96 ">
            <h2 class="text-xl font-bold mb-4">修改图书</h2>
            <form id="book-form" action="/library_manage_system/bookChange" method="post">
                <div class="mb-8">
                    <label for="changeBookNo" class="block text-gray-700 font-bold mb-2">编号</label>
                    <input type="text" id="changeBookNo" name="changeBookNo" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                </div>
                <div class="mb-8">
                  <label for="changeBookName" class="block text-gray-700 font-bold mb-2">书名</label>
                  <input type="text" id="changeBookName" name="changeBookName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" required>
                </div>
                <div class="mb-8">
                    <label for="changeBookNumber" class="block text-gray-700 font-bold mb-2">数量</label>
                    <input type="text" id="changeBookNumber" name="changeBookNumber" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                <div class="mb-8">
                  <label for="changeBookAuthor" class="block text-gray-700 font-bold mb-2">作者</label>
                  <input type="text" id="changeBookAuthor" name="changeBookAuthor" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                         required>
                </div>
                <div class="mb-8">
                <label for="changeBookPress" class="block text-gray-700 font-bold mb-2">出版社</label>
                <input type="text" id="changeBookPress" name="changeBookPress" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                       required>
                </div>
                <div class="mb-8">
              <label for="changeBookPressTime" class="block text-gray-700 font-bold mb-2">出版时间</label>
              <input type="text" id="changeBookPressTime" name="changeBookPressTime" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                     required>
                </div>
                <div class="mb-8">
            <label for="changeBookISBN" class="block text-gray-700 font-bold mb-2">ISBN</label>
            <input type="text" id="changeBookISBN" name="changeBookISBN" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                   required>
                </div>
                <div class="mb-8">
          <label for="changeBookAddress" class="block text-gray-700 font-bold mb-2">分区</label>
          <input type="text" id="changeBookAddress" name="changeBookAddress" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                 required>
                </div>
                <button type="submit"
                        class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">修改</button>
            </form>
        </div>
        </div>
        <!-- 删除用户 -->
        <div class="deleteUserBox" id="DeleteUserBox" style="display: none;">
          <button id="deleteUserbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">删除用户</h2>
              <form id="deleteUser-form" action="/library_manage_system/deleteUser" method="post">
                  <div class="mb-4">
                      <label for="deleteUserName" class="block text-gray-700 font-bold mb-2">账号</label>
                      <input type="text" id="deleteUserName" name="deleteUserName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <div class="mb-4">
                      <label for="deleteUserBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                      <input type="text" id="deleteUserBookId" name="deleteUserBookId" readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                             required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认删除</button>
              </form>
          </div>
        </div>
        <!-- 删除图书 -->
        <div class="deleteBookBox" id="deleteBookBox" style="display: none;">
          <button id="deleteBookbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">删除图书</h2>
              <form id="deleteBook-form" action="/library_manage_system/deleteBook" method="post">
                  <div class="mb-4">
                      <label for="deleteBookName" class="block text-gray-700 font-bold mb-2">书名</label>
                      <input type="text" id="deleteBookName" name="deleteBookName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <div class="mb-4">
                      <label for="deleteBookIsbn" class="block text-gray-700 font-bold mb-2">ISBN</label>
                      <input type="text" id="deleteBookIsbn" name="deleteBookIsbn" readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                             required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认删除</button>
              </form>
          </div>
        </div>
        <!-- 删除借书记录 -->
        <div class="deleteBorrBox" id="deleteBorrBox" style="display: none;">
          <button id="deleteBorrbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">删除借书记录</h2>
              <form id="deleteBorr-form" action="/library_manage_system/deleteBorrow" method="post">
                  <div class="mb-4">
                      <label for="deleteBorrUserBookNo" class="block text-gray-700 font-bold mb-2">图书编号</label>
                      <input type="text" id="deleteBorrUserBookNo" name="deleteBorrUserBookNo" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <div class="mb-4">
                      <label for="deleteBorrUserBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                      <input type="text" id="deleteBorrUserBookId" name="deleteBorrUserBookId" readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                             required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认删除</button>
              </form>
          </div>
        </div>
        <!-- 删除借阅室 -->
        <div class="deleteLibBox" id="deleteLibBox" style="display: none;">
          <button id="deleteLibbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">删除借阅室</h2>
              <form id="deleteLib-form" action="/library_manage_system/deleteLib" method="post">
                  <div class="mb-4">
                      <label for="deleteLibName" class="block text-gray-700 font-bold mb-2">图书编号</label>
                      <input type="text" id="deleteLibName" name="deleteLibName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认删除</button>
              </form>
          </div>
        </div>
        <!-- 修改借书记录 -->
        <div class="changeBorrBox" id="changeBorrBox" style="display: none;">
          <button id="changeBorrbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">归还</h2>
              <form id="changeBorr-form" action="/library_manage_system/returnBook" method="post">
                  <div class="mb-4">
                      <label for="changeBorrUserBookNo" class="block text-gray-700 font-bold mb-2">图书编号</label>
                      <input type="text" id="changeBorrUserBookNo" name="changeBorrUserBookNo" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <div class="mb-4">
                      <label for="changeBorrUserBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                      <input type="text" id="changeBorrUserBookId" name="changeBorrUserBookId" readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                             required>
                  </div>
                  <div class="mb-4">
                    <label for="changeBorrText" class="block text-gray-700 font-bold mb-2">备注</label>
                    <input type="text" id="changeBorrText" name="changeBorrText"  class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认归还</button>
              </form>
          </div>
        </div>
        <!-- 修改借阅室 -->
        <div class="changeLibBox" id="changeLibBox" style="display: none;">
          <button id="changeLibbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">修改借阅室信息</h2>
              <form id="changeLib-form" action="/library_manage_system/libChange" method="post">
                  <div class="mb-4">
                      <label for="changeLibRoomName" class="block text-gray-700 font-bold mb-2">借阅室号</label>
                      <input type="text" id="changeLibRoomName" name="changeLibRoomName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                  </div>
                  <div class="mb-4">
                      <label for="changeLibRoomSize" class="block text-gray-700 font-bold mb-2">可容纳人数</label>
                      <input type="text" id="changeLibRoomSize" name="changeLibRoomSize" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认修改</button>
              </form>
          </div>
        </div>
        <!-- 新增用户 -->
        <div class="adduserBox" id="adduserBox" style="display: none;">
          <button id="adduserbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
          <h2 class="text-xl font-bold mb-4">添加用户</h2>
          <form id="adduser-form" action="/library_manage_system/addUser" method="post">
              <div class="mb-4">
                  <label for="addUserBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                  <input type="text" id="addUserBookId" name="addUserBookId" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                         required>
              </div>
              <button type="submit"
                      class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认添加</button>
            </form>
          </div>
        </div>
        <!-- 新增图书 -->
        <div class="addBookBox" id="addBookBox" style="display: none;">
        <button id="addBookbtn">×</button>
        <div class="bg-white p-8 rounded-md shadow-md w-96 ">
            <h2 class="text-xl font-bold mb-4">新增图书</h2>
            <form id="addbook-form" action="/library_manage_system/AddBook" method="post">
                <div class="mb-4">
                    <label for="addBookNo" class="block text-gray-700 font-bold mb-2">编号</label>
                    <input type="text" id="addBookNo" name="addBookNo" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"  required>
                </div>
                <div class="mb-4">
                  <label for="addBookName" class="block text-gray-700 font-bold mb-2">书名</label>
                  <input type="text" id="addBookName" name="addBookName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" required>
                </div>
                <div class="mb-4">
                    <label for="addBookNumber" class="block text-gray-700 font-bold mb-2">数量</label>
                    <input type="text" id="addBookNumber" name="addBookNumber" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                <div class="mb-4">
                  <label for="addBookAuthor" class="block text-gray-700 font-bold mb-2">作者</label>
                  <input type="text" id="addBookAuthor" name="addBookAuthor" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                         required>
                </div>
                <div class="mb-4">
                <label for="addBookPress" class="block text-gray-700 font-bold mb-2">出版社</label>
                <input type="text" id="addBookPress" name="addBookPress" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                       required>
                </div>
                <div class="mb-4">
              <label for="addBookPressTime" class="block text-gray-700 font-bold mb-2">出版时间</label>
              <input type="text" id="addBookPressTime" name="addBookPressTime" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                     required>
                </div>
                <div class="mb-4">
            <label for="addBookISBN" class="block text-gray-700 font-bold mb-2">ISBN</label>
            <input type="text" id="addBookISBN" name="addBookISBN" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                   required>
                </div>
                <div class="mb-4">
          <label for="addBookAddress" class="block text-gray-700 font-bold mb-2">分区</label>
          <input type="text" id="addBookAddress" name="addBookAddress" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                 required>
                </div>
                <button type="submit"
                        class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">添加</button>
            </form>
        </div>
        </div>
        <!-- 新增借书记录 -->
        <div class="addBorrBox" id="addBorrBox" style="display: none;">
          <button id="addBorrbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">借书</h2>
              <form id="addBorr-form" action="/library_manage_system/BorrowBook" method="post">
                  <div class="mb-4">
                      <label for="addBorrUserBookNo" class="block text-gray-700 font-bold mb-2">图书编号</label>
                      <input type="text" id="addBorrUserBookNo" name="addBorrUserBookNo" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"  required>
                  </div>
                  <div class="mb-4">
                      <label for="addBorrUserBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                      <input type="text" id="addBorrUserBookId" name="addBorrUserBookId" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                             required>
                  </div>
                  <!-- 标识位 -->
                <input type="hidden" name="hidden-number" value="2">
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认借出</button>
              </form>
          </div>
        </div>
        <!-- 新增借阅室 -->
        <div class="addLibBox" id="addLibBox" style="display: none;">
          <button id="addLibbtn">×</button>
          <div class="bg-white p-8 rounded-md shadow-md w-96">
              <h2 class="text-xl font-bold mb-4">新增借阅室</h2>
              <form id="addLib-form" action="/library_manage_system/addLib" method="post">
                  <div class="mb-4">
                      <label for="addLibRoomName" class="block text-gray-700 font-bold mb-2">借阅室号</label>
                      <input type="text" id="addLibRoomName" name="addLibRoomName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"  required>
                  </div>
                  <div class="mb-4">
                      <label for="addLibRoomSize" class="block text-gray-700 font-bold mb-2">可容纳人数(10以内)</label>
                      <input type="text" id="addLibRoomSize" name="addLibRoomSize" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" required>
                  </div>
                  <button type="submit"
                          class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认新建</button>
              </form>
          </div>
        </div>
  </div>

    <script src="js/lib/axios/dist/axios.min.js" ></script>
    <script type="module">
      var vm = new Vue({
        el: '#app',
        data() {
          return {
            bookInfo: [],
            userInfo: [],
            borrowInfo:[],
            LibInfo:[],
            selectBookInfo:[],
            selectuserInfo: [],
            selectborrowInfo:[],
            selectLibInfo:[],
          }
        },
        created() {
          // 获取所有书籍信息
          axios.get('/library_manage_system/AllBook')
                  .then(response => {
                    // 假设服务器返回了一个书籍数组
                    this.bookInfo = response.data;
                    console.log(this.bookInfo);
                  })
                  .catch(error => {
                    console.error('There was an error fetching the books!', error);
                  });

          // 获取所有用户信息
          axios.get('/library_manage_system/AllUser')
                  .then(response => {
                    // 假设服务器返回了一个用户数组
                    this.userInfo = response.data;
                    console.log(this.userInfo);
                  })
                  .catch(error => {
                    console.error('There was an error fetching the users!', error);
                  });
          // 获取所有借阅信息
          axios.get('/library_manage_system/AllBorrow')
                  .then(response => {
                    // 假设服务器返回了一个用户数组
                    this.borrowInfo = response.data;
                    console.log(this.borrowInfo);
                  })
                  .catch(error => {
                    console.error('There was an error fetching the borrowInfo!', error);
                  });
          // 获取所有借阅室信息
          axios.get('/library_manage_system/AllLib')
                  .then(response => {
                    // 假设服务器返回了一个用户数组
                    this.LibInfo = response.data;
                    console.log(this.LibInfo);
                  })
                  .catch(error => {
                    console.error('There was an error fetching the LibInfo!', error);
                  });
                },
        methods: {
          changeUser(row) {
                      let maskbox = document.getElementById('MaskBox');
                      maskbox.style.display = 'block'
                      let changeUserName = document.getElementById('account');
                      let changeUserBookId = document.getElementById('library-card-number');
                      changeUserName.value = row.userName;
                      changeUserBookId.value = row.userBookId;
                      console.log('当前行的数据:', row);
                    },
          deleteUser(row) {
                      let deleteUserBox = document.getElementById('DeleteUserBox');
                      deleteUserBox.style.display = 'block'
                      let deleteUserName = document.getElementById('deleteUserName');
                      let deleteUserBookId = document.getElementById('deleteUserBookId');
                      deleteUserName.value = row.userName;
                      deleteUserBookId.value = row.userBookId;
                      console.log('当前行的数据:', row);
                      console.log('当前行的数据:', row.userName);
                    },
          changeBook(row) {
                      let changeBookBox = document.getElementById('changeBookBox');
                      changeBookBox.style.display = 'block'
                      let changeBookNo = document.getElementById('changeBookNo');
                      let changeBookName = document.getElementById('changeBookName');
                      let changeBookNumber = document.getElementById('changeBookNumber');
                      let changeBookAuthor = document.getElementById('changeBookAuthor');
                      let changeBookPress = document.getElementById('changeBookPress');
                      let changeBookPressTime = document.getElementById('changeBookPressTime');
                      let changeBookISBN = document.getElementById('changeBookISBN');
                      let changeBookAddress = document.getElementById('changeBookAddress');
                      changeBookNo.value = row.bookNo;
                      changeBookName.value = row.bookName;
                      changeBookNumber.value = row.bookNumber;
                      changeBookAuthor.value = row.bookAuthor;
                      changeBookPress.value = row.press;
                      changeBookPressTime.value = row.pressTime;
                      changeBookISBN.value = row.ISBN;
                      changeBookAddress.value = row.address;
                      console.log('当前行的数据:', row);
                    },
          deleteBook(row) {
                      let deleteBookBox = document.getElementById('deleteBookBox');
                      deleteBookBox.style.display = 'block'
                      let deleteBookName = document.getElementById('deleteBookName');
                      let deleteBookIsbn = document.getElementById('deleteBookIsbn');
                      deleteBookName.value = row.bookName;
                      deleteBookIsbn.value = row.ISBN;
                      console.log('当前行的数据:', row);
                    },
          deleteBorr(row) {
                      let deleteBorrBox = document.getElementById('deleteBorrBox');
                      deleteBorrBox.style.display = 'block'
                      let deleteBorrUserBookNo = document.getElementById('deleteBorrUserBookNo');
                      let deleteBorrUserBookId = document.getElementById('deleteBorrUserBookId');
                      deleteBorrUserBookNo.value = row.bookNo;
                      deleteBorrUserBookId.value = row.userBookId;
                      console.log('当前行的数据:', row);
                    },
          changeBorr(row) {

                      let changeBorrBox = document.getElementById('changeBorrBox');
                      changeBorrBox.style.display = 'block'
                      let changeBorrUserBookNo = document.getElementById('changeBorrUserBookNo');
                      let changeBorrUserBookId = document.getElementById('changeBorrUserBookId');
                      changeBorrUserBookNo.value = row.bookNo;
                      changeBorrUserBookId.value = row.userBookId;
                      console.log('当前行的数据:', row);
                    },
          deleteLib(row) {
                      let deleteLibBox = document.getElementById('deleteLibBox');
                      deleteLibBox.style.display = 'block'
                      let deleteLibName = document.getElementById('deleteLibName');
                      deleteLibName.value = row.roomId;
                      console.log('当前行的数据:', row);
                    },
          changeLib(row) {
                      let changeLibBox = document.getElementById('changeLibBox');
                      changeLibBox.style.display = 'block'
                      let changeLibRoomName = document.getElementById('changeLibRoomName');
                      changeLibRoomName.value = row.roomId;
                      console.log('当前行的数据:', row);
                    },
          async seletebook() {
            const searchTerm = document.getElementById('seletebookInfo').value;
            if (!searchTerm.trim()) {
              alert('请输入搜索内容');
              return;
            }
            try {
              const response = await axios.get('/library_manage_system/seleteBook', {
                params: {
                  seletebookInfo: searchTerm
                }
              });
              this.selectBookInfo = response.data;
              console.log('搜索结果:', this.selectBookInfo);
              this.$nextTick(() => {
                // 隐藏主页面
                let homejpg = document.getElementById('Homejpg');
                if (homejpg) {
                  homejpg.style.display = 'none';
                  console.log('隐藏主页面成功');
                } else {
                  console.error('未找到主页面元素');
                }
                // 隐藏书籍信息页面
                let Bookinfo = document.getElementById('BookInformation');
                if (Bookinfo) {
                  Bookinfo.style.display = 'none';
                }
                // 显示搜索结果页面
                let selectBookInformation = document.getElementById('selectBookInformation');
                if (selectBookInformation) {
                  let selectBook = document.getElementById('selectBook');
                  selectBook.style.display = 'block';
                  selectBookInformation.style.display = 'block';
                  console.log('显示搜索结果页面成功');
                } else {
                  console.error('未找到搜索结果页面元素');
                }
              });
            } catch (error) {
              console.error('搜索失败:', error);
              alert('搜索失败，请稍后再试');
            }
          },
          async seleteuser() {
            const searchTerm = document.getElementById('seleteuserInfo').value;
            if (!searchTerm.trim()) {
              alert('请输入搜索内容');
              return;
            }
            try {
              const response = await axios.get('/library_manage_system/seleteUser', {
                params: {
                  seleteuserInfo: searchTerm
                }
              });
              this.selectuserInfo = response.data;
              console.log('搜索结果:', this.selectuserInfo);
              this.$nextTick(() => {
                // 隐藏主页面
                let homejpg = document.getElementById('Homejpg');
                if (homejpg) {
                  homejpg.style.display = 'none';
                  console.log('隐藏主页面成功');
                } else {
                  console.error('未找到主页面元素');
                }
                // 隐藏用户信息页面
                let USerinfo = document.getElementById('UserInfo');
                if (USerinfo) {
                  USerinfo.style.display = 'none';
                }
                // 显示搜索结果页面
                let selectUserInfo = document.getElementById('selectUserInfo');
                if (selectUserInfo) {
                  let seleteuser = document.getElementById('seleteuser');
                  seleteuser.style.display = 'block';
                  selectUserInfo.style.display = 'block';
                  console.log('显示搜索结果页面成功');
                } else {
                  console.error('未找到搜索结果页面元素');
                }
              });
            } catch (error) {
              console.error('搜索失败:', error);
              alert('搜索失败，请稍后再试');
            }
          },
          async seleteborr() {
            const searchTerm = document.getElementById('seleteborrInfo').value;
            if (!searchTerm.trim()) {
              alert('请输入搜索内容');
              return;
            }
            try {
              const response = await axios.get('/library_manage_system/seleteBorrow', {
                params: {
                  seleteborrInfo: searchTerm
                }
              });
              this.selectborrowInfo = response.data;
              console.log('搜索结果:', this.selectborrowInfo);
              this.$nextTick(() => {
                // 隐藏主页面
                let homejpg = document.getElementById('Homejpg');
                if (homejpg) {
                  homejpg.style.display = 'none';
                  console.log('隐藏主页面成功');
                } else {
                  console.error('未找到主页面元素');
                }
                // 隐藏借阅信息页面
                let Borrowinfo = document.getElementById('BorrowManagement');
                if (Borrowinfo) {
                  Borrowinfo.style.display = 'none';
                }
                // 显示搜索结果页面
                let selectBorrowManagement = document.getElementById('selectBorrowManagement');
                if (selectBorrowManagement) {
                  let seleteborr = document.getElementById('seleteborr');
                  seleteborr.style.display = 'block';
                  selectBorrowManagement.style.display = 'block';
                  console.log('显示搜索结果页面成功');
                } else {
                  console.error('未找到搜索结果页面元素');
                }
              });
            } catch (error) {
              console.error('搜索失败:', error);
              alert('搜索失败，请稍后再试');
            }
          },
          async seleteLib() {
            const searchTerm = document.getElementById('seleteLibInfo').value;
            if (!searchTerm.trim()) {
              alert('请输入搜索内容');
              return;
            }
            try {
              const response = await axios.get('/library_manage_system/seleteLib', {
                params: {
                  seleteLibInfo: searchTerm
                }
              });
              this.selectLibInfo = response.data;
              console.log('搜索结果:', this.selectLibInfo);
              this.$nextTick(() => {
                // 隐藏主页面
                let homejpg = document.getElementById('Homejpg');
                if (homejpg) {
                  homejpg.style.display = 'none';
                  console.log('隐藏主页面成功');
                } else {
                  console.error('未找到主页面元素');
                }
                // 隐藏书籍信息页面
                let LibInfo = document.getElementById('LibInfo');
                if (LibInfo) {
                  LibInfo.style.display = 'none';
                }
                // 显示搜索结果页面
                let selectLibInfo = document.getElementById('selectLibInfo');
                if (selectLibInfo) {
                  let seleteLib = document.getElementById('seleteLib');
                  seleteLib.style.display = 'block';
                  selectLibInfo.style.display = 'block';
                  console.log('显示搜索结果页面成功');
                } else {
                  console.error('未找到搜索结果页面元素');
                }
              });
            } catch (error) {
              console.error('搜索失败:', error);
              alert('搜索失败，请稍后再试');
            }
          },
          addbook(){
            let addBookBox = document.getElementById('addBookBox');
            addBookBox.style.display = 'block';
          },
          adduser(){
            let adduserBox = document.getElementById('adduserBox');
            adduserBox.style.display = 'block';
          },
          addborr(){
            let addBorrBox = document.getElementById('addBorrBox');
            addBorrBox.style.display = 'block';
          },
          addLib(){
            let addLibBox = document.getElementById('addLibBox');
            addLibBox.style.display = 'block';
          }
}
                
      })
    </script>
</body>

</html>