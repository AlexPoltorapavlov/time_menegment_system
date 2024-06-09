export function handleSearch(searchLine, searchWindow) {
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

  const searchDiv = searchWindow.querySelector('.input-group');
  const searchButton = searchWindow.querySelector('.search-button');
  const searchLineElement = searchWindow.querySelector('.search-line');

  searchButton.style.display = 'none';
  searchLineElement.style.display = 'none';

  const searchOutputText = document.createElement('div');
  searchOutputText.innerText = searchData.join(', ');
  searchDiv.appendChild(searchOutputText);
}
