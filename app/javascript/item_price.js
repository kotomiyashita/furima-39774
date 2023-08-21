document.addEventListener('turbo:load', function item_price() {
  const priceInput = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price');
  const profit = document.getElementById('profit');

  if (priceInput) {
    priceInput.addEventListener('input', function() {
      const price = parseInt(priceInput.value, 10) || 0;
      const tax = Math.floor(price * 0.1);
      const profitValue = price - tax;

      addTaxPrice.innerHTML = tax.toLocaleString();
      profit.innerHTML = profitValue.toLocaleString();
    });
  }
});