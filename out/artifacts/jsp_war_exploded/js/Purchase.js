
window.onload = ()=>{
    const SelectRadio = document.querySelectorAll(".SelectType");
    console.dir(SelectRadio[0]);
    for(let i = 0; i<SelectRadio.length;i++){
        SelectRadio[i].addEventListener('change',()=>{
            const {value} = SelectRadio[i];
            const Execution = MethodArray[value-1];
            Execution();
        })

    }
    console.log(ProductId);
    console.log(PurchasePrice);
    console.log(PurchaseCount);
    const PurchaseForm = document.querySelector("#PurchaseForm");
    PurchaseForm.addEventListener('submit',()=>{

        const UserIdInput = document.createElement("input");
        UserIdInput.setAttribute("type", "hidden");
        UserIdInput.setAttribute("name", "UserId");
        UserIdInput.setAttribute("value", UserId);

        const ProductIdInput = document.createElement("input");
        ProductIdInput.setAttribute("type", "hidden");
        ProductIdInput.setAttribute("name", "ProductId");
        ProductIdInput.setAttribute("value", ProductId);

        const PurchasePriceInput = document.createElement("input");
        PurchasePriceInput.setAttribute("type", "hidden");
        PurchasePriceInput.setAttribute("name", "PurchaseProductPrice");
        PurchasePriceInput.setAttribute("value", PurchasePrice);

        const PurchaseCountInput = document.createElement("input");
        PurchaseCountInput.setAttribute("type", "hidden");
        PurchaseCountInput.setAttribute("name", "PurchaseProductCount");
        PurchaseCountInput.setAttribute("value", PurchaseCount);

        PurchaseForm.appendChild(UserIdInput);
        PurchaseForm.appendChild(ProductIdInput);
        PurchaseForm.appendChild(PurchasePriceInput);
        PurchaseForm.appendChild(PurchaseCountInput);

    })
};

const CheckLastArrive = () =>{
    $.ajax({
        url:"./PurchaseAction.jsp",
        type:"POST",
        data:{
            Type:"CheckList",
            User:UserId
        },
        dataType:"text",
        cache:false,
        success:(data)=>{
            const SuccesData = data.trim();
            if(SuccesData === "null") {
                alert("최근 배송지가 없습니다");
                const SelectRadio = document.querySelectorAll(".SelectType");
                SelectRadio[1].checked = true;
            }
            else{
                const InputData = JSON.parse(SuccesData);
                fillData(InputData);
                //PurchaseRecipient
                // PurchasePhone
                // PurchaseZipCode
                // PurchaseAddress
                // PurchaseFullAddress
            }
        },
        error:(e1,e2,e3)=>{
            console.error(e1);
            console.error(e2);
            console.error(e3);
        }
    })
};

const ClearNormalInput = () =>{
    fillData(["","","","",""]);
};

const SelectMyInfo = ()=>{
    $.ajax({
        url:"./PurchaseAction.jsp",
        type:"POST",
        data:{
            Type:"MyInfo",
            User:UserId
        },
        dataType:"text",
        cache:false,
        success:(data)=>{
            const SuccessData = JSON.parse(data.trim());
            fillData(SuccessData);
        },
        error:(e1,e2,e3)=>{
            console.error(e1);
            console.error(e2);
            console.error(e3);

        }
    })
};

const fillData = (data) =>{
    const DeliveryForm = document.querySelectorAll(".deliveryForm");

    for(let i = 0; i<DeliveryForm.length;i++){
        DeliveryForm[i].value = data[i] === null ? "" : data[i];
    }
}
const MethodArray = [CheckLastArrive,ClearNormalInput,SelectMyInfo];