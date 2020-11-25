function submit () {
  const submitBtn = document.querySelectorAll('.submit-btn');

  submitBtn.forEach((btn) => {
    btn.addEventListener('mouseover', () => {
      btn.setAttribute('style', 'background-color:#f17979;');
    });
  });

  submitBtn.forEach((btn) => {
    btn.addEventListener('mouseout', () => {
      btn.removeAttribute('style', 'background-color:#f17979;');
    });
  });
}

window.addEventListener('load', submit);