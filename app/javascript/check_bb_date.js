function bb_date () {
  const date = new Date();
  const date2 = new Date();

  // 賞味期限チェックの日付設定（7日後）
  date.setDate(date.getDate() + 7);

  // 月日はそれぞれ二桁表示 例) 2020-01-01
  const setBbDay = date.getFullYear() + '-' + ("0" + (date.getMonth() + 1)).slice(-2) + '-' + ("0" + date.getDate()).slice(-2);

  // 今日の日付
  const today = date2.getFullYear() + '-' + ("0" + (date2.getMonth() + 1)).slice(-2) + '-' + ("0" + date2.getDate()).slice(-2);

  // 「賞味期限当日〜賞味期限7日前」「賞味期限切れ」の食材の表示を変更
  const foodLink = document.querySelectorAll('.food-link');
  foodLink.forEach((link) => {
    const checkDate = link.querySelectorAll('.day');
    checkDate.forEach((bbDate) => {
      if (bbDate.innerHTML < today) {
        link.setAttribute('style', 'color:red;');
        bbDate.innerHTML = '切れ';
      } else if (bbDate.innerHTML <= setBbDay) {
        link.setAttribute('style', 'color:red;');
      };
    });
  });

}
window.addEventListener('load', bb_date);