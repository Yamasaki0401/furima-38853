window.addEventListener('load', () => {
  const inputPrice = document.getElementById("item-price");
  if (inputPrice) {
    inputPrice.addEventListener("keyup", () => {
      const inputVal = inputPrice.value;
      const taxPrice = document.getElementById("add-tax-price");
      const profitPrice = document.getElementById("profit");
      const Tax = 0.1;
      const tax_price = inputVal * Tax
      const profit = inputVal - tax_price
      taxPrice.innerHTML = Math.floor(tax_price) ;
      profitPrice.innerHTML = Math.floor(profit) ;
    });
  }
});

