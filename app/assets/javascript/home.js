document.addEventListener('DOMContentLoaded', () => {
  // Создаем кнопку
  const button = document.createElement('button');
  button.innerText = 'Время';
  button.style.position = 'fixed';
  button.style.right = '20px';
  button.style.bottom = '20px';
  button.style.padding = '10px 20px';
  button.style.backgroundColor = '#007BFF';
  button.style.color = 'white';
  button.style.border = 'none';
  button.style.borderRadius = '10px'
  button.style.cursor = 'pointer';
  button.style.display = 'none'; // Изначально скрыта

  document.body.appendChild(button);

  // Показать кнопку через 5 секунд
  setTimeout(() => {
    button.style.display = 'block';
  }, 5000);

  // Обработчик для кнопки
  button.addEventListener('click', () => {
    // Скрыть кнопку
    button.style.display = 'none';

    // Создаем окно
    const timeWindow = document.createElement('div');
    timeWindow.style.position = 'fixed';
    timeWindow.style.right = '20px';
    timeWindow.style.bottom = '20px';
    timeWindow.style.padding = '20px';
    timeWindow.style.backgroundColor = 'white';
    timeWindow.style.border = '1px solid #ddd';
    timeWindow.style.boxShadow = '0px 0px 10px rgba(0,0,0,0.1)';
    timeWindow.style.zIndex = '1000';

    // Время
    const timeDisplay = document.createElement('div');
    timeDisplay.style.marginBottom = '10px';
    timeWindow.appendChild(timeDisplay);

    // Обновляем время каждую секунду
    const updateTime = () => {
      const now = new Date();
      const hours = String(now.getHours()).padStart(2, '0');
      const minutes = String(now.getMinutes()).padStart(2, '0');
      const seconds = String(now.getSeconds()).padStart(2, '0');
      timeDisplay.innerText = `${hours}:${minutes}:${seconds}`;
    };
    updateTime(); // Обновить время сразу
    const intervalId = setInterval(updateTime, 1000);

    // Кнопка закрытия окна
    const closeButton = document.createElement('button');
    closeButton.innerText = 'X';
    closeButton.style.position = 'absolute';
    closeButton.style.top = '5px';
    closeButton.style.right = '5px';
    closeButton.style.background = 'transparent';
    closeButton.style.border = 'none';
    closeButton.style.cursor = 'pointer';
    closeButton.style.fontSize = '16px';
    timeWindow.appendChild(closeButton);

    // Обработчик закрытия окна
    closeButton.addEventListener('click', () => {
      clearInterval(intervalId); // Останавливаем обновление времени
      document.body.removeChild(timeWindow); // Удаляем окно
      button.style.display = 'block'; // Показываем кнопку
    });

    // Добавляем окно к документу
    document.body.appendChild(timeWindow);
  });
});
