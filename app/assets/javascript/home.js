document.addEventListener('DOMContentLoaded', () => {
  // Создаем кнопку
  const button = document.createElement('button');
  button.innerText = 'Поиск';
  button.style.position = 'fixed';
  button.style.right = '20px';
  button.style.bottom = '20px';
  button.style.padding = '10px 20px';
  button.style.backgroundColor = '#007BFF';
  button.style.color = 'white';
  button.style.border = 'none';
  button.style.borderRadius = '10px'
  button.style.cursor = 'pointer';
  //button.style.display = 'none'; // Изначально скрыта

  document.body.appendChild(button);

  // Показать кнопку через 5 секунд
  //setTimeout(() => {
  button.style.display = 'block';
  //}, 5000);

  // Обработчик для кнопки
  button.addEventListener('click', () => {
    // Скрыть кнопку
    button.style.display = 'none';

    // Создаем окно
    const searchWindow = document.createElement('div');
    searchWindow.style.position = 'fixed';
    searchWindow.style.right = '20px';
    searchWindow.style.bottom = '20px';
    searchWindow.style.padding = '30px';
    searchWindow.style.backgroundColor = 'white';
    //searchWindow.style.border = '1px solid #ddd';
    searchWindow.style.borderRadius = '10px'
    searchWindow.style.boxShadow = '0px 0px 10px rgba(0,0,0,0.1)';
    searchWindow.style.zIndex = '1000';

    // div поисковой строки
    const searchDiv = document.createElement('div');
    searchDiv.className = 'input-group';
    searchWindow.appendChild(searchDiv);

    // Создаем поисковую строку
    const searchLine = document.createElement('input');
    searchLine.type = 'text';
    searchLine.placeholder = 'Введите запрос...';
    //searchLine.style.width = '200px';
    //searchLine.style.padding = '10px';
    //searchLine.style.marginBottom = '10px';
    //searchLine.style.border = '1px solid #ccc';
    //searchLine.style.borderRadius = '4px';
    //
    // Использую класс из bootstrap, так быстрее прописывать стили.
    searchLine.className = 'form-control rounded';

    searchDiv.appendChild(searchLine);

    // Кнопка для поиска
    const searchButton = document.createElement('button');
    searchButton.className = 'btn btn-primary';
    searchButton.innerText = 'Найти';

    // Обработчик поиска:
    searchButton.addEventListener('click', () => {
      const strLowCase = searchLine.value.toLowerCase();
  
      const data = [
        { name: 'Сбер Банк', ticker: 'SBER' },
        { name: 'МТС', ticker: 'MTSS' },
        { name: 'Тинькофф групп', ticker: 'TCS' },
        { name: 'Московская биржа', ticker: 'MOEX' }
      ];

      const searchData = data
        .filter(item => item.name.toLowerCase().includes(strLowCase))
        .map(item => item.ticker);

      searchButton.style.display = 'none';
      searchLine.style.display = 'none';

      const searchOutputText = document.createElement('div');
      searchOutputText.innerText = searchData.join(', ');
      searchDiv.appendChild(searchOutputText);
    });
    
    searchDiv.appendChild(searchButton);
    
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
    searchWindow.appendChild(closeButton);

    // Обработчик закрытия окна
    closeButton.addEventListener('click', () => {
      //clearInterval(intervalId); // Останавливаем обновление времени
      document.body.removeChild(searchWindow); // Удаляем окно
      button.style.display = 'block'; // Показываем кнопку
    });

    // Добавляем окно к документу
    document.body.appendChild(searchWindow);
  });
});
