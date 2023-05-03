window.addEventListener('load', () => {
  const inputPrice = document.getElementById("item-price");
  inputPrice.addEventListener("change", () => {
    const inputVal = inputPrice.value;
    const taxPrice = document.getElementById("add-tax-price");
    const profitPrice = document.getElementById("profit");
    const Tax = 0.1;
    const tax_price = inputVal * Tax
    const profit = inputVal - tax_price
    taxPrice.innerHTML = tax_price ;
    profitPrice.innerHTML = profit ;
  });
});
