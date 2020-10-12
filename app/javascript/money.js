function money (){
  const from = document.getElementById("item-price");
  from.addEventListener("keyup", () => {
    var price = document.getElementById("item-price").value
    var fee = Math.floor(price / 10).toLocaleString();
    var profit = (price - parseFloat(fee)).toLocaleString();
    let feeForm = document.getElementById("add-tax-price");
      feeForm.innerHTML = fee;
    let profitForm = document.getElementById("profit");
      profitForm.innerHTML = profit;
  });
}
window.addEventListener('load', money)

//小数点切り捨て
// Math.floor
// .toLocaleString()
// キーボードのキーを離した時に発火するイベント
// →値を取得する記述
// →値を元にして手数料と利益を計算し、表示させる
