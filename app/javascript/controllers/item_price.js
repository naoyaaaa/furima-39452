const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

// 初期表示時に手数料と利益を計算して表示
calculatePrice();

priceInput.addEventListener("input", () => {
  calculatePrice();
});

function calculatePrice() {
  const inputValue = priceInput.value;

  // 価格の入力値が数値でない場合や範囲外の場合は手数料と利益を空欄にリセット
  if (!inputValue || isNaN(inputValue) || !isValidPrice(inputValue)) {
    addTaxDom.textContent = "";
    profitDom.textContent = "";
    return;
  }

  const price = parseInt(inputValue, 10); // 入力値を整数に変換

  // 手数料を計算して表示
  const tax = Math.floor(price * 0.1); // 10% の手数料（小数点以下切り捨て）
  addTaxDom.textContent = tax;

  // 販売利益を計算して表示
  const profit = price - tax;
  profitDom.textContent = profit;
}

function isValidPrice(value) {
  const minPrice = 300;
  const maxPrice = 9999999;

  return value >= minPrice && value <= maxPrice;
}

// ページがリロードされたときに価格を復元する
window.addEventListener("DOMContentLoaded", () => {
  calculatePrice();
});
