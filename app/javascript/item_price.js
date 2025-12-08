document.addEventListener('turbo:load', () => {
  const priceInput = document.getElementById('item-price')
  const feeEl = document.getElementById('add-tax-price')
  const profitEl = document.getElementById('profit')

  if (!priceInput || !feeEl || !profitEl) return

  priceInput.addEventListener('input', () => {
    const val = parseInt(priceInput.value.replace(/[^0-9]/g, ''), 10)

    if (Number.isInteger(val) && val >= 300 && val <= 9999999) {
      const fee = Math.floor(val * 0.1)
      const profit = val - fee
      feeEl.textContent = fee.toLocaleString()
      profitEl.textContent = profit.toLocaleString()
    } else {
      feeEl.textContent = ''
      profitEl.textContent = ''
    }
  })
})