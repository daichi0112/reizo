function decoration () {
  const headerBtn = document.querySelectorAll('#header-btn');
  const searchBtn = document.getElementById('search-btn');
  const foods = document.querySelectorAll('.food');

  headerBtn.forEach((header) => {
    header.addEventListener('mouseover', () => {
      header.setAttribute('style', 'background-color:#f3c52f;');
    });
  });
  searchBtn.addEventListener('mouseover', () => {
    searchBtn.setAttribute('style', 'background-color:#f0e0ac;');
  });
  foods.forEach((food) => {
    food.addEventListener('mouseover', () => {
      food.setAttribute('style', 'background-color:#7cff9dd8;');
    });
  });

  headerBtn.forEach((header) => {
    header.addEventListener('mouseout', () => {
      header.removeAttribute('style', 'background-color:#f3c52f;');
    });
  });
  searchBtn.addEventListener('mouseout', () => {
    searchBtn.removeAttribute('style', 'background-color:#f0e0ac;');
  });
  foods.forEach((food) => {
    food.addEventListener('mouseout', () => {
      food.removeAttribute('style', 'background-color:#7cff9dd8;');
    });
  });
}

window.addEventListener('load', decoration);