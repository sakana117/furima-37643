window.addEventListener("load", item);

function item (){
  const ItemPrice = document.getElementById("item-price");
  ItemPrice.addEventListener("input", ()=>{
    const inputItemPrice = ItemPrice.value;
    const formatter = new Intl.NumberFormat();

    const AddTaxDom = document.getElementById("add-tax-price");
    const inputAddTaxDom = Math.floor(inputItemPrice*0.1);
    AddTaxDom.innerHTML = formatter.format(inputAddTaxDom);

    const Profit = document.getElementById("profit");
    Profit.innerHTML = formatter.format(inputItemPrice-inputAddTaxDom);
  });
}