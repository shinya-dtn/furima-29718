function money (){
  const from = document.getElementById("item-price");
  from.addEventListener("keyup", () => {
    var price = document.getElementById("item-price").value
    var fee = price / 10;
    var profit = price - fee;
    let feeForm = document.getElementById("add-tax-price");
      feeForm.innerHTML = fee;
    let profitForm = document.getElementById("profit");
      profitForm.innerHTML = profit;
  })
}

window.addEventListener('load', money)

// キーボードのキーを離した時に発火するイベント
// →値を取得する記述
// →値を元にして手数料と利益を計算し、表示させる
