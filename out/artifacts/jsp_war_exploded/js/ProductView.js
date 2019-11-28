const HashArray = ["info","arrive","change","review","QnA"];

window.addEventListener("hashchange",(event)=>{
    console.log(1);
    const {newURL} = event;
    const HashPosition = newURL.indexOf("#");
    const HashValue = newURL.slice(HashPosition+1);
    const ViewListItem = document.getElementsByClassName("product_view_list_item");
    for(let i = 0; i < ViewListItem.length;i++){
        ViewListItem[i].style.borderBottom = (i == HashArray.indexOf(HashValue)) ? "2px solid #3b3b3b" : "" ;
        ViewListItem[i].style.color = (i == HashArray.indexOf(HashValue)) ? "#333333" : "#999999" ;
        };
    const image = document.getElementsByClassName("item_view");
    fetch("../Product/ProductInfo.jsp?ProductNumber=1")
        .then(body=>body.text())
        .then(function(html) {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, "text/html");
            return doc;
         })
        .then(document=>{
            const {all} = document;
            for(let i = 0; i<all.length;i++){
                if(all[i].className === `ProductInfo_${HashArray[HashArray.indexOf(HashValue)]}`){
                    image[0].innerHTML = all[i].innerHTML;
                }
            }
        })
        .catch(function(err) {
            console.log('Failed to fetch page: ', err);
        });
});


window.onload = ()=>{
    const [UpButton,DownButton] =document.getElementsByClassName('product_view_price_btn');
    const Input = document.getElementById("product_view_price_count");
    const Product_price = document.getElementById("product_price");
    const Product_full_price = document.getElementById("product_full_price");
    const Product_sum_price = document.getElementById("product_sum_price");
    const MoveShoppingBag = document.getElementById("MoveShoppingBag");
    const MovePurchase = document.getElementById('MovePurchase');
    const MoveAttention = document.getElementById("MoveAttention");
    UpButton.addEventListener('click',()=>{
        const Count_price = (parseInt(Input.value)+1) * price;
        Input.value =  parseInt(Input.value)+1;
        Product_price.innerHTML = Count_price;
        Product_full_price.innerHTML = Count_price;
        Product_sum_price.innerHTML = Count_price;
    });
    DownButton.addEventListener('click',()=>{
        if(parseInt(Input.value)>= 2){
            const Count_price = (parseInt(Input.value)-1) * price;
            Input.value =  parseInt(Input.value)-1;
            Product_price.innerHTML = Count_price;
            Product_full_price.innerHTML = Count_price;
            Product_sum_price.innerHTML = Count_price;
        }
    });
    MoveShoppingBag.addEventListener('click',()=>location.href=`/ShoppingBag?ProductNumber=${productNumber}&ItemCount=${Input.value}`);
    MoveAttention.addEventListener('click',()=>location.href="");
}
