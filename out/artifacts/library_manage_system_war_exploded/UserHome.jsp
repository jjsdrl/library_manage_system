<%@ page import="com.lms.utils.Md5Util" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="com.lms.pojo.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <script src="./js/vue.js"></script>
    <script src="./js/Element.js"></script>
    <script src="./js/UserHome.js"></script>
    <link rel="stylesheet" href="./css/Element.css">
    <link rel="stylesheet" href="./css/UserHome.css">
    <link rel="stylesheet" href="./css/pet.css">
    <script src="https://unpkg.com/@tailwindcss/browser@4"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" rel="stylesheet">
</head>

<body>
    <div id="app">
        <el-container>
            <el-header>
                <div class="header_left" height="60px">
                    <img src="./images/logo.png" alt="" width="50px" height="45px"
                        style="float: left; margin-top: 7px;" />
                    <span class="flicker" style="float: right;" id="PageName">鸿发图书</span>
                </div>
                <div class="header_center" style="display: inline;">
                    <div id="selectBook" style="display: none;">
                      <input type="text" id="seletebookInfo" class="search" name="seletebookInfo">
                      <i class="el-icon-search searchI" @click="seletebook()"></i>
                    </div>
                    <div id="seleteborr" style="display: none;">
                      <input type="text" id="seleteborrInfo" class="search" name="seleteborrInfo">
                      <i class="el-icon-search searchI" @click="seleteborr()"></i>
                    </div>
                    <div id="seleteLib" style="display: none;">
                      <input type="text" id="seleteLibInfo" class="search" name="seleteLibInfo">
                      <i class="el-icon-search searchI" @click="seleteLib()"></i>
                    </div>
                </div>
                <div class="header_right">
                    <el-dropdown>
                        <span class="el-dropdown-link flicker">
                            ${sessionScope.loginUser.userName}
                        </span>

                        <el-dropdown-menu slot="dropdown">
                            <el-dropdown-item id="RootReName">修改用户名</el-dropdown-item>
                            <el-dropdown-item id="RootRepasswd">修改密码</el-dropdown-item>
                            <el-dropdown-item onclick="exitApp()">退出</el-dropdown-item>
                        </el-dropdown-menu>
                    </el-dropdown>
                </div>

            </el-header>
            <el-container>
                <el-aside width="200px">
                    <el-menu :default-openeds="['1', '3']">
                        <el-submenu index="2">
                            <template slot="title"><i class="el-icon-menu"></i>图书信息</template>
                            <el-menu-item-group>
                                <template slot="title">书籍管理</template>
                                <el-menu-item index="2-1" id="BookIn">书籍信息</el-menu-item>
                                <el-menu-item index="2-2" id="BorrowIn">借阅信息</el-menu-item>
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
                        <h1>欢迎光临鸿发图书！！！</h1>
                    </el-main>
                </el-container>
                <el-container id="BookInformation" style="display: none;">
                    <el-main>
                        <el-table :data="bookInfo" :row-class-name="() => 'el-table--enable-row-hover'">
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
                            <el-table-column prop="operate" label="操作">
                                <template slot-scope="scope">
                                    <div>
                                        <i class="el-icon-thumb" @click="handleIconClick(scope.row)" id="borrowIn"></i>
                                    </div>
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
                        <el-table-column prop="operate" label="操作">
                            <template slot-scope="scope">
                                <div>
                                    <i class="el-icon-thumb" @click="handleIconClick(scope.row)" id="borrowIn"></i>
                                </div>
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
                            <el-table-column prop="userBookId" label="借书证号" width="300">
                            </el-table-column>
                            <el-table-column prop="state" label="状态">
                            </el-table-column>
                            <el-table-column prop="borrowTime" label="借出时间">
                            </el-table-column>
                            <el-table-column prop="returnTime" label="还入时间">
                            </el-table-column>
                            <el-table-column prop="text" label="备注">
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
                        <el-table-column prop="operate" label="操作">
                          <template slot-scope="scope">
                              <div>
                                  <i class="el-icon-check" @click="need(scope.row)" id="libIn"></i>
                              </div>
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
                        <el-table-column prop="operate" label="操作">
                          <template slot-scope="scope">
                              <div>
                                  <i class="el-icon-check" @click="need(scope.row)" id="libIn"></i>
                              </div>
                          </template>
                      </el-table-column>
                      </el-table>
                    </el-main>
                  </el-container>
            </el-container>
            <el-footer><span class="flicker">Footer</span></el-footer>
        </el-container>

    </div>
    <div class="maskBox" id="MaskBox" style="display: none;">
        <button id="btn">×</button>
        <div class="bg-white p-8 rounded-md shadow-md w-96">
            <h2 class="text-xl font-bold mb-4">修改密码</h2>
            <form id="password-form" action="/library_manage_system/passwdChange" method="post">
                <div class="mb-4">
                    <label for="account" class="block text-gray-700 font-bold mb-2">账号</label>
                    <input type="text" id="account" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" value="${sessionScope.loginUser.userName}" placeholder="${sessionScope.loginUser.userName}" disabled required>
                </div>
                <div class="mb-4">
                    <label for="new-password" class="block text-gray-700 font-bold mb-2">新密码</label>
                    <input type="password" id="new-password" name="changeUserPasswd" placeholder="请输入新密码" class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                <div class="mb-4">
                    <label for="library-card-number" class="block text-gray-700 font-bold mb-2">借书证号</label>
                    <input type="text" id="library-card-number" name="changeUserBookId" value="${sessionScope.loginUser.userBookId}"  readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                <!-- 标识位 -->
                <input type="hidden" name="hidden-number" value="1">
                <button type="submit"
                        class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">提交</button>
            </form>
        </div>
    </div>
    <div class="changeusernameBox" id="changeusernameBox" style="display: none;">
      <button id="changeusernamebtn">×</button>
      <div class="bg-white p-8 rounded-md shadow-md w-96">
          <h2 class="text-xl font-bold mb-4">修改密码</h2>
          <form id="name-form" action="/library_manage_system/userNameChange" method="post">
              <div class="mb-4">
                  <label for="newName" class="block text-gray-700 font-bold mb-2">新用户名</label>
                  <input type="text" id="newName" name="newName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" placeholder="请输入新用户名"   required>
              </div>
              <div class="mb-4">
                  <label for="changeusernameBookId" class="block text-gray-700 font-bold mb-2">借书证号</label>
                  <input type="text" id="changeusernameBookId" name="changeusernameBookId" value="${sessionScope.loginUser.userBookId}"  readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                         required>
              </div>
              
              <button type="submit"
                      class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">提交</button>
          </form>
      </div>
  </div>
    <div class="borrBox" id="borrBox" style="display: none;">
        <button id="borrbtn" >×</button>
        <div class="bg-white p-8 rounded-md shadow-md w-96">
            <h2 class="text-xl font-bold mb-4">借阅</h2>
            <form id="borrow-form" action="/library_manage_system/BorrowBook" method="post">
                <div class="mb-4">
                    <label for="borrbookno" class="block text-gray-700 font-bold mb-2">图书编号</label>
                    <input type="text" id="borrbookno" name="borrbookno" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
                </div>
                <div class="mb-4">
                    <label for="borrbookname" class="block text-gray-700 font-bold mb-2">书名</label>
                    <input type="text" id="borrbookname"   class="border border-gray-400 p-2 w-full rounded-md maskboxInput"  readonly required>
                </div>
                <div class="mb-4">
                    <label for="library-card-number" class="block text-gray-700 font-bold mb-2">借书证号</label>
                    <input type="text"  name="changeUserBookId" value="${sessionScope.loginUser.userBookId}"  readonly class="border border-gray-400 p-2 w-full rounded-md maskboxInput"
                           required>
                </div>
                <!-- 标识位 -->
                <input type="hidden" name="hidden-number" value="1">
                <button type="submit"
                        class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">提交</button>
            </form>
        </div>
    </div>
    <!-- 预约借阅室 -->
    <div class="changeLibBox" id="changeLibBox" style="display: none;">
      <button id="changeLibbtn">×</button>
      <div class="bg-white p-8 rounded-md shadow-md w-96">
          <h2 class="text-xl font-bold mb-4">预约借阅室</h2>
          <form id="changeLib-form" action="/library_manage_system/libneed" method="post">
              <div class="mb-4">
                  <label for="changeLibRoomName" class="block text-gray-700 font-bold mb-2">借阅室号</label>
                  <input type="text" id="changeLibRoomName" name="changeLibRoomName" class="border border-gray-400 p-2 w-full rounded-md maskboxInput" readonly required>
              </div>
              <button type="submit"
                      class="bg-green-500 text-white py-2 px-4 rounded-md hover:bg-green-600">确认预约</button>
          </form>
      </div>
    </div>
    <div id="pet"></div>
    <div class="context-menu" id="contextMenu">
        <div onclick="changePasswd()" id="petRepasswd" >修改密码</div>
        <div onclick="hidePet()">隐藏</div>
        <div onclick="exitApp()">退出系统</div>
    </div>
    <script src="./js/pet.js"></script>
    <script src="js/lib/axios/dist/axios.min.js" ></script>
        <script type="module">

            var vm = new Vue({
                el: '#app',
                data() {
                    return {
                        bookInfo: [],
                        borrowInfo:[],
                        LibInfo:[],
                        selectBookInfo:[],
                        selectborrowInfo:[],
                        selectLibInfo:[],
                    }
                },
                created(){
                    axios.get('/library_manage_system/AllBook')
                        .then(response => {
                            // 假设服务器返回了一个用户数组
                            this.bookInfo = response.data;
                            console.log(this.bookInfo);
                        })
                        .catch(error => {
                            console.error('There was an error fetching the books!', error);
                        });
                    axios.get('/library_manage_system/BorrowInfoByid')
                        .then(response => {
                            // 假设服务器返回了一个借阅数组
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
                    need(row){
                      if(row.roomSize > row.remainingPeople){
                        let changeLibBox = document.getElementById('changeLibBox');
                        changeLibBox.style.display = 'block'
                        let changeLibRoomName = document.getElementById('changeLibRoomName');
                        changeLibRoomName.value = row.roomId;
                        console.log('当前行的数据:', row);
                      }else{
                        alert('当前借阅室无空位请选择别的借阅室');
                        return;
                      }
                    },
                    handleIconClick(row) {
                        let borrBox = document.getElementById('borrBox');
                        borrBox.style.display = 'block';
                        let inputBookNo = document.getElementById('borrbookno');
                        let inputBookName = document.getElementById('borrbookname');
                        inputBookName.value = row.bookName;
                        inputBookNo.value = row.bookNo;
                        console.log('当前行的数据:', row);

                    },
                    // 模糊搜索书本
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
                    // 模糊搜索借阅记录
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
                    //模糊搜索借阅室
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
        }

            })
        </script>
</body>

</html>