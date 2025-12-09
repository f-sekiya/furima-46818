const price = () => {
  const priceInput = document.getElementById('item-price');
  const feeEl = document.getElementById('add-tax-price');
  const profitEl = document.getElementById('profit');

  if (!priceInput || !feeEl || !profitEl) return;

  if (priceInput.dataset.priceListener === "true") return;
  priceInput.dataset.priceListener = "true";

  const renderCalc = () => {
    const inputValue = priceInput.value;

    if (!/^\d+$/.test(inputValue)) {
      feeEl.textContent = '';
      profitEl.textContent = '';
      return;
    }

    const val = Number(inputValue);

    if (val < 300 || val > 9999999) {
      feeEl.textContent = '';
      profitEl.textContent = '';
      return;
    }

    const fee = Math.floor(val * 0.1);
    const profit = val - fee;

    feeEl.textContent = fee;
    profitEl.textContent = profit;
  };

  priceInput.addEventListener('input', renderCalc);
};

window.addEventListener('turbo:load', price);
window.addEventListener('turbo:render', price);
