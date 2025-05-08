      const pet = document.getElementById('pet');
      const contextMenu = document.getElementById('contextMenu');
      let maskbox = document.getElementById('MaskBox');
      let isDragging = false;
      let offsetX = 0, offsetY = 0;
      let petInitialLeft = 500; // 初始位置（可以根据需要调整）
      let petInitialTop = 500;  // 初始位置（可以根据需要调整）

      // 初始化图片序列
      let imageKey = 1;
      const totalImages = 61;
      const imageUrl = './images/meizi/meizi_ (';

      function updateImage() {
          imageKey = (imageKey % totalImages) + 1;
          pet.style.backgroundImage = "url('"+imageUrl+imageKey+").png')";
      }

      // 模拟动画（每隔 500ms 切换图片）
      setInterval(updateImage, 500);

      // 设置初始位置
      pet.style.left = `${petInitialLeft}px`;
      pet.style.top = `${petInitialTop}px`;
      pet.style.position = 'absolute'; // 确保是绝对定位

      pet.addEventListener('mousedown', (e) => {
          if (e.button === 0) { // 左键
              isDragging = true;
              // 计算偏移量
              offsetX = e.clientX - pet.getBoundingClientRect().left;
              offsetY = e.clientY - pet.getBoundingClientRect().top;
              pet.style.cursor = 'grabbing';
          } else if (e.button === 2) { // 右键
              e.preventDefault(); // 阻止默认右键菜单
              showContextMenu(e.clientX, e.clientY);
          }
      });

      document.addEventListener('mousemove', (e) => {
          if (isDragging) {
              pet.style.left = `${e.clientX - offsetX}px`;
              pet.style.top = `${e.clientY - offsetY}px`;
          }
      });

      document.addEventListener('mouseup', () => {
          isDragging = false;
          pet.style.cursor = 'grab';
      });

      function showContextMenu(x, y) {
          contextMenu.style.left = `${x}px`;
          contextMenu.style.top = `${y}px`;
          contextMenu.style.display = 'block';
      }

      document.addEventListener('click', () => {
          contextMenu.style.display = 'none';
      });

      // 右键菜单功能
      function changePasswd() {
          maskbox.style.display = 'block';
      }

      function hidePet() {
          pet.style.display = 'none';
      }

      function exitApp() {
          window.location.href = "/library_manage_system/loginOut";
      }