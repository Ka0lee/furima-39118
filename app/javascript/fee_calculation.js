window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1 );
    const addPofitDom = document.getElementById("profit");
     addPofitDom.innerHTML = Math.floor(inputValue - Math.floor(inputValue * 0.1 ))

    })
})