
window.onload = ()=>{

    const ListProduct = document.querySelectorAll(".List_Product");

    for(let i = 0; i <ListProduct.length;i++){
        ListProduct[i].addEventListener('click',()=>{
            const {classList} = ListProduct[i];
            StateChangeArray[i](ListProduct[i],i);
        })
    }
};



const StatePurchaseList = (Select,i) =>{
    const {classList} = Select;
    if(classList.value === "List_Product mui--is-active"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        $.ajax({
            url:"../action/ProductViewDetailAction.jsp",
            dataType:"text",
            data:{
                state:"PurchaseList",
                id:ProductId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                console.log(JsonData);
                const EachListTalbe = document.querySelectorAll(".EachListTable");
                console.log(EachListTbody);
                const BeforeEachListTbody = document.querySelectorAll(".EachListTbody");
                console.log(BeforeEachListTbody);
                if(BeforeEachListTbody[0] !== undefined){
                    BeforeEachListTbody[0].remove();
                }
                const EachListTbody = document.createElement("tbody");
                EachListTbody.classList.add("EachListTbody");
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","4");
                    const TextTag = document.createTextNode("해당 상품에 관심이 보이는 사용자가 없습니다");
                    TdTag.appendChild(TextTag);
                    TrTag.appendChild(TdTag);
                    EachListTalbe[i].appendChild(TrTag);
                }else{
                    JsonData.map((index)=>{
                        const TrTag = document.createElement("tr");
                        for(let j = 0;j<index.length;j++){
                            const TdTag = document.createElement("td");
                            TdTag.innerHTML = index[j];
                            TrTag.appendChild(TdTag);
                        }
                        EachListTbody.appendChild(TrTag);
                    });
                    EachListTalbe[i].appendChild(EachListTbody);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};

const StatePurchaseGraph = (Select) =>{
};

const StateAttentionList = (Select,i) =>{
    const {classList} = Select;
    console.log("-"+classList.value);
    if(classList.value === "List_Product"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        $.ajax({
            url:"../action/ProductViewDetailAction.jsp",
            dataType:"text",
            data:{
                state:"AttentionList",
                id:ProductId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                console.log(JsonData);
                const EachListTalbe = document.querySelectorAll(".EachListTable");
                const BeforeEachListTbody = document.querySelectorAll(".EachListTbody");
                console.log(BeforeEachListTbody);
                if(BeforeEachListTbody[0] !== undefined){
                    BeforeEachListTbody[0].remove();
                }
                const EachListTbody = document.createElement("tbody");
                EachListTbody.classList.add("EachListTbody");
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","4");
                    const TextTag = document.createTextNode("해당 상품에 관심이 보이는 사용자가 없습니다");
                    TdTag.appendChild(TextTag);
                    TrTag.appendChild(TdTag);
                    EachListTalbe[i].appendChild(TrTag);
                }else{
                    JsonData.map((index)=>{
                        const TrTag = document.createElement("tr");
                        for(let j = 0;j<index.length;j++){
                            const TdTag = document.createElement("td");
                            TdTag.innerHTML = index[j];
                            TrTag.appendChild(TdTag);
                        }
                        EachListTbody.appendChild(TrTag);
                    });
                    EachListTalbe[i].appendChild(EachListTbody);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }

};
const StateShoppingBagList = (Select,i)=>{
    const {classList} = Select;
    if(classList.value === "List_Product"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        console.log(InsertArea);
        $.ajax({
            url:"../action/ProductViewDetailAction.jsp",
            dataType:"text",
            data:{
                state:"ShoppingBagList",
                id:ProductId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                console.log(JsonData);

                if(JsonData.length === 0){

                }else{

                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};
const StateReviewList = (Select,i) =>{
    const {classList} = Select;
    if(classList.value === "List_Product"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        console.log(InsertArea);
        $.ajax({
            url:"../action/ProductViewDetailAction.jsp",
            dataType:"text",
            data:{
                state:"ReviewList",
                id:ProductId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                console.log(JsonData);
                if(JsonData.length === 0){

                }else{

                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};

const StateChangeArray = [StatePurchaseList,StateAttentionList,StateShoppingBagList,StateReviewList];