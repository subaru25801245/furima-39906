document.addEventListener("DOMContentLoaded", () => {
  const priceInput = document.getElementById("item-price");
  const addTaxPrice = document.getElementById("add-tax-price");
  const profit = document.getElementById("profit");

  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    if (inputValue >= 300 && inputValue <= 9999999) {
      addTaxPrice.textContent = Math.floor(inputValue * 0.1);
      profit.textContent = Math.floor(inputValue * 0.9);
    } else {
      addTaxPrice.textContent = '---';
      profit.textContent = '---';
    }
  });
});
