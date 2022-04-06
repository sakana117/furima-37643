if(document.URL.match(/new/)){
  window.addEventListener("load", item);
}

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

if(document.URL.match(/orders/)){
  window.addEventListener("load", pay);
}

function pay (){
  Payjp.setPublicKey("pk_test_******************"); // PAY.JPテスト公開鍵
  const submit = document.getElementById("button");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    console.log("フォーム送信時にイベント発火")
  });
}