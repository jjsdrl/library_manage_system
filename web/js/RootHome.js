window.onload = function () {
    let changeUser = document.getElementById('changeUser');
    let maskbox = document.getElementById('MaskBox');
    let homejpg = document.getElementById('Homejpg');
    let Userin = document.getElementById('UserIn');
    let Bookin = document.getElementById('BookIn');
    let Borrowin = document.getElementById('BorrowIn');
    let libIn = document.getElementById('libIn');
    let USerinfo = document.getElementById('UserInfo');
    let Bookinfo = document.getElementById('BookInformation');
    let LibInfo = document.getElementById('LibInfo');
    let Borrowinfo = document.getElementById('BorrowManagement');
    let selectBook = document.getElementById('selectBook');
    let seleteuser = document.getElementById('seleteuser');
    let seleteborr = document.getElementById('seleteborr');
    let seleteLib = document.getElementById('seleteLib');
    let selectUserInfo = document.getElementById('selectUserInfo');
    let selectBookInformation = document.getElementById('selectBookInformation');
    let selectBorrowManagement = document.getElementById('selectBorrowManagement');
    let selectLibInfo = document.getElementById('selectLibInfo');
    console.log(Userin, Bookin, Borrowin)
    let pagename = document.getElementById('PageName');

    pagename.onclick = function () {
        location.reload();
    }
    

    Userin.onclick = function () {
        homejpg.style.display = 'none';
        USerinfo.style.display = 'block';
        Bookinfo.style.display = 'none';
        LibInfo.style.display = 'none';
        Borrowinfo.style.display = 'none';
        selectBook.style.display = 'none';
        seleteborr.style.display = 'none';
        seleteLib.style.display = 'none';
        seleteuser.style.display = 'block';
        selectBookInformation.style.display = 'none';
        selectUserInfo.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }

    Bookin.onclick = function () {
        homejpg.style.display = 'none';
        USerinfo.style.display = 'none';
        LibInfo.style.display = 'none';
        Bookinfo.style.display = 'block';
        Borrowinfo.style.display = 'none';
        selectBook.style.display = 'block';
        seleteborr.style.display = 'none';
        seleteuser.style.display = 'none';
        seleteLib.style.display = 'none';
        console.log(selectBook);
        selectBookInformation.style.display = 'none';
        selectUserInfo.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }

    Borrowin.onclick = function () {
        homejpg.style.display = 'none';
        USerinfo.style.display = 'none';
        Bookinfo.style.display = 'none';
        LibInfo.style.display = 'none';
        Borrowinfo.style.display = 'block';
        selectBook.style.display = 'none';
        seleteborr.style.display = 'block';
        seleteuser.style.display = 'none';
        seleteLib.style.display = 'none';
        selectBookInformation.style.display = 'none';
        selectUserInfo.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }
    libIn.onclick = function () {
        homejpg.style.display = 'none';
        USerinfo.style.display = 'none';
        Bookinfo.style.display = 'none';
        LibInfo.style.display = 'block';
        Borrowinfo.style.display = 'none';
        selectBook.style.display = 'none';
        seleteborr.style.display = 'none';
        seleteuser.style.display = 'none';
        seleteLib.style.display = 'block';
        selectBookInformation.style.display = 'none';
        selectUserInfo.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }

    changeUser.onclick = function () {
        maskbox.style.display = 'block'
    }
    let btns = document.getElementById('btn');
    btns.onclick = function () {
        maskbox.style.display = 'none'
    }
    //退出
    let exit = document.getElementById('exit');
    exit.onclick = function () {
        window.location.href = "/library_manage_system/loginOut";
    }
    //删除用户
    let deleteUserBox = document.getElementById('DeleteUserBox');
    let deleteUserbtn = document.getElementById('deleteUserbtn');
    deleteUserbtn.onclick = function () {
        deleteUserBox.style.display = 'none'
    }
    //修改图书
    let deleteBookBox = document.getElementById('deleteBookBox');
    let deleteBookbtn = document.getElementById('deleteBookbtn');
    deleteBookbtn.onclick = function () {
        deleteBookBox.style.display = 'none'
    }
    //删除图书
    let changeBookBox = document.getElementById('changeBookBox');
    let changeBookbtn = document.getElementById('changeBookbtn');
    changeBookbtn.onclick = function () {
        changeBookBox.style.display = 'none'
    }
    //删除借书记录
    let deleteBorrBox = document.getElementById('deleteBorrBox');
    let deleteBorrbtn = document.getElementById('deleteBorrbtn');
    deleteBorrbtn.onclick = function () {
        deleteBorrBox.style.display = 'none'
    }
    //修改借书记录
    let changeBorrBox = document.getElementById('changeBorrBox');
    let changeBorrbtn = document.getElementById('changeBorrbtn');
    changeBorrbtn.onclick = function () {
        changeBorrBox.style.display = 'none'
    }
    //新增用户
    let adduserBox = document.getElementById('adduserBox');
    let adduserbtn = document.getElementById('adduserbtn');
    adduserbtn.onclick = function () {
        adduserBox.style.display = 'none'
    }
    //新增图书
    let addBookBox = document.getElementById('addBookBox');
    let addBookbtn = document.getElementById('addBookbtn');
    addBookbtn.onclick = function () {
        addBookBox.style.display = 'none'
    }
    //新增借书记录
    let addBorrBox = document.getElementById('addBorrBox');
    let addBorrbtn = document.getElementById('addBorrbtn');
    addBorrbtn.onclick = function () {
        addBorrBox.style.display = 'none'
    }
    //修改借阅室
    let changeLibBox = document.getElementById('changeLibBox');
    let changeLibbtn = document.getElementById('changeLibbtn');
    changeLibbtn.onclick = function () {
        changeLibBox.style.display = 'none'
    }
    //删除借阅室
    let deleteLibBox = document.getElementById('deleteLibBox');
    let deleteLibbtn = document.getElementById('deleteLibbtn');
    deleteLibbtn.onclick = function () {
        deleteLibBox.style.display = 'none'
    }
    //新建借阅室
    let addLibBox = document.getElementById('addLibBox');
    let addLibbtn = document.getElementById('addLibbtn');
    addLibbtn.onclick = function () {
        addLibBox.style.display = 'none'
    }
}
