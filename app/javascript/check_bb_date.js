function bb_date () {
  const date = new Date();
  // 今日の日付から7日後にセット
  date.setDate(date.getDate() + 7);

  const bbDay = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
  console.log(bbDay)

}
window.addEventListener('load', bb_date);