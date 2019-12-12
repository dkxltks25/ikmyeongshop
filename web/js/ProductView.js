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
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");
            return doc;
         })
        .then(document=>{
            const {all} = document;
            for(let i = 0; i<all.length;i++){
                if(all[i].className === `ProductInfo_${HashArray[HashArray.indexOf(HashValue)]}`){
                    image[0].innerHTML = all[i].innerHTML;
                    const MoveAllView = document.getElementsByClassName("viewAllReview")[0];
                    if(MoveAllView !== null || MoveAllView !== undefined){
                        MoveAllView.addEventListener('click',()=>location.href="../Review/ReviewList.jsp");
                    }
                   if(all[i].className === `ProductInfo_review`){
                       console.log(2);
                       const TrTag = document.querySelectorAll(".ProductInfo_review_tr");
                       console.log(TrTag);
                           for(let j =0;j<TrTag.length;j++){
                               console.log(TrTag[j]);
                               TrTag[j].addEventListener('click', ()=>{
                                   console.log(3);
                                   console.dir(TrTag[j]);
                                   const TrId = TrTag[j].dataset.id;
                                   console.log(TrId);
                                   $.ajax({
                                       url:"../Review/ReviewContentAction.jsp",
                                       data:{
                                           id:TrId
                                       },
                                       dataType:"Text",
                                       success:(data)=>{
                                           const SuccessData = data.trim();
                                           const InsertTrTag = document.createElement("tr")[0];
                                           console.dir(InsertTrTag);
                                           InsertTrTag.classList.add("InsertTr");
                                           const CheckTrTag = document.querySelectorAll("InsertTr")[0];
                                           if(CheckTrTag !== undefined){
                                               CheckTrTag.remove();
                                           }
                                           const InsertTdTag = document.createElement("td");
                                           InsertTdTag.classList.add("InsertTr");
                                           InsertTdTag.setAttribute("rowspan","4");
                                           InsertTdTag.createTextNode(SuccessData);
                                           CheckTrTag.appendChild(InsertTdTag);
                                           TrTag[i].after(CheckTrTag);

                                       },
                                       error:(e1,e2,e3)=>{
                                           console.log(e1);
                                           console.log(e2);
                                           console.log(e3);
                                       }
                                   })
                               });


                           }
                   }
                }

            }
        })
        .catch(function(err) {
            console.log('Failed to fetch page: ', err);
        });



});


window.onload = ()=>{
    
    const [UpButton,DownButton] =document.getElementsByClassName('product_view_price_btn');
    console.log(document.getElementsByClassName('product_view_price_btn'));
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
    MoveAttention.addEventListener('click',()=>location.href=`../Product/AttentionAction.jsp?ProductNumber=${productNumber}`);
    MovePurchase.addEventListener('click',CreateForm);
};

const CreateForm = () =>{
    const Form = document.createElement('form');
    Form.setAttribute("charset", "UTF-8");
    Form.setAttribute("method", "Post");
    Form.setAttribute("action", "/Purchase/");

    const hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "ProductId[]");
    hiddenField.setAttribute("value", productNumber);
    const hiddenProductCount = document.createElement("input");
    hiddenProductCount.setAttribute("type","hidden");
    hiddenProductCount.setAttribute("name", "PurchaseCount");
    hiddenProductCount.setAttribute("value",document.getElementById("product_view_price_count").value);
    Form.appendChild(hiddenField);
    Form.appendChild(hiddenProductCount);
    document.body.appendChild(Form);
    Form.appendChild(hiddenField);
    Form.submit();
};