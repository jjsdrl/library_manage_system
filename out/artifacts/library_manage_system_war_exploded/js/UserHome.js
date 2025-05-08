window.onload = function() {
    let Rootrepasswd = document.getElementById('RootRepasswd');
    var maskbox = document.getElementById('MaskBox');
    let homejpg = document.getElementById('Homejpg');
    let Bookin = document.getElementById('BookIn');
    let libIn = document.getElementById('libIn');
    let Borrowin = document.getElementById('BorrowIn');
    let Bookinfo = document.getElementById('BookInformation');
    let LibInfo = document.getElementById('LibInfo');
    let Borrowinfo = document.getElementById('BorrowManagement');
    let selectBook = document.getElementById('selectBook');
    let seleteborr = document.getElementById('seleteborr');
    let seleteLib = document.getElementById('seleteLib');
    let selectBookInformation = document.getElementById('selectBookInformation');
    let selectBorrowManagement = document.getElementById('selectBorrowManagement');
    let selectLibInfo = document.getElementById('selectLibInfo');
    let pagename = document.getElementById('PageName');
    pagename.onclick = function () {
        location.reload();
    }

    Bookin.onclick = function () {
        homejpg.style.display = 'none';
        Bookinfo.style.display = 'block';
        Borrowinfo.style.display = 'none';
        LibInfo.style.display = 'none';
        selectBook.style.display = 'block';
        seleteborr.style.display = 'none';
        seleteLib.style.display = 'none';
        selectBookInformation.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }

    Borrowin.onclick = function () {
        homejpg.style.display = 'none';
        Bookinfo.style.display = 'none';
        LibInfo.style.display = 'none';
        Borrowinfo.style.display = 'block';
        selectBook.style.display = 'none';
        seleteLib.style.display = 'none';
        seleteborr.style.display = 'block';
        selectBookInformation.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }
    libIn.onclick = function () {
        homejpg.style.display = 'none';
        Bookinfo.style.display = 'none';
        LibInfo.style.display = 'block';
        Borrowinfo.style.display = 'none';
        selectBook.style.display = 'none';
        seleteLib.style.display = 'block';
        seleteborr.style.display = 'none';
        selectBookInformation.style.display = 'none';
        selectBorrowManagement.style.display = 'none';
        selectLibInfo.style.display = 'none';
    }
    let changeusernameBox = document.getElementById('changeusernameBox');
    let RootReName = document.getElementById('RootReName');
    let changeusernamebtn = document.getElementById('changeusernamebtn');
    RootReName.onclick = function () {
        changeusernameBox.style.display = 'block'
    }
    changeusernamebtn.onclick = function () {
        console.log("这里是changeusernamebtn")
        changeusernameBox.style.display = 'none'
    }
    Rootrepasswd.onclick = function () {
        maskbox.style.display = 'block'
    }
    let btns = document.getElementById('btn');

    btns.onclick = function () {
        console.log("这里是btn")
        maskbox.style.display = 'none'
    }
    let borrBox = document.getElementById('borrBox');
    
    let borrbtn = document.getElementById('borrbtn');
    borrbtn.onclick = function () {
        console.log("这里是borrbtn")
        borrBox.style.display = 'none'
    }
    //修改借阅室
    let changeLibBox = document.getElementById('changeLibBox');
    let changeLibbtn = document.getElementById('changeLibbtn');
    changeLibbtn.onclick = function () {
        changeLibBox.style.display = 'none'
    }


}
