window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  if (!priceInput){ return false;}
   priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    console.log(inputValue);
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(inputValue * 0.1 );
     console.log(addTaxDom.innerHTML);
    const addPofitDom = document.getElementById("profit");
     addPofitDom.innerHTML = Math.round(inputValue - Math.round(inputValue * 0.1 ))
     console.log(addPofitDom.innerHTML);

    })
})