import { createButton, createSearchWindow } from './ui';
import { handleSearch } from './search';

document.addEventListener('DOMContentLoaded', () => {
  // Создаем кнопку
  const button = createButton();

  document.body.appendChild(button);

  // Показать кнопку сразу (можно раскомментировать для задержки)
  // setTimeout(() => {
  button.style.display = 'block';
  // }, 5000);

  // Обработчик для кнопки
  button.addEventListener('click', () => {
    // Скрыть кнопку
    button.style.display = 'none';

    // Создаем окно поиска
    const searchWindow = createSearchWindow();

    // Добавляем окно к документу
    document.body.appendChild(searchWindow);

    // Обработчик закрытия окна
    const closeButton = searchWindow.querySelector('.close-button');
    closeButton.addEventListener('click', () => {
      document.body.removeChild(searchWindow); // Удаляем окно
      button.style.display = 'block'; // Показываем кнопку
    });

    // Обработчик поиска
    const searchButton = searchWindow.querySelector('.search-button');
    const searchLine = searchWindow.querySelector('.search-line');
    searchButton.addEventListener('click', () => handleSearch(searchLine, searchWindow));
  });
});
