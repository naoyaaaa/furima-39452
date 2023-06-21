const priceInput = document.getElementById("item-price");
const addTaxDom = document.getElementById("add-tax-price");
const profitDom = document.getElementById("profit");

calculatePrice();

priceInput.addEventListener("input", () => {
  calculatePrice();
});

function calculatePrice() {
  const inputValue = priceInput.value;

  if (!inputValue || isNaN(inputValue) || !isValidPrice(inputValue)) {
    addTaxDom.textContent = "";
    profitDom.textContent = "";
    return;
  }

  const price = parseInt(inputValue, 10); 


  const tax = Math.floor(price * 0.1); 
  addTaxDom.textContent = tax;


  const profit = price - tax;
  profitDom.textContent = profit;
}

function isValidPrice(value) {
  const minPrice = 300;
  const maxPrice = 9999999;

  return value >= minPrice && value <= maxPrice;
}


window.addEventListener("DOMContentLoaded", () => {
  calculatePrice();
});
