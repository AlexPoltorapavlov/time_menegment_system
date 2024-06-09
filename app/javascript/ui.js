export function createButton() {
  const button = document.createElement('button');
  button.innerText = 'Поиск';
  button.style.position = 'fixed';
  button.style.right = '20px';
  button.style.bottom = '20px';
  button.style.padding = '10px 20px';
  button.style.backgroundColor = '#007BFF';
  button.style.color = 'white';
  button.style.border = 'none';
  button.style.borderRadius = '10px';
  button.style.cursor = 'pointer';
  button.style.display = 'none'; // Изначально скрыта
  return button;
}

export function createSearchWindow() {
  const searchWindow = document.createElement('div');
  searchWindow.style.position = 'fixed';
  searchWindow.style.right = '20px';
  searchWindow.style.bottom = '20px';
  searchWindow.style.padding = '30px';
  searchWindow.style.backgroundColor = 'white';
  searchWindow.style.borderRadius = '10px';
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
  searchLine.className = 'form-control rounded search-line';
  searchDiv.appendChild(searchLine);

  // Кнопка для поиска
  const searchButton = document.createElement('button');
  searchButton.className = 'btn btn-primary search-button';
  searchButton.innerText = 'Найти';
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
  closeButton.className = 'close-button';
  searchWindow.appendChild(closeButton);

  return searchWindow;
}
