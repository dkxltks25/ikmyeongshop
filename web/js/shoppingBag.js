const ProductCountArray = [];
const ProductPriceArray = [];


const ProcessInit = ()=>{
    const ProductSelectArray = [];

    const AllPrice = document.querySelector("#SelectAllPrice") ;
    const NSelectPrice = document.querySelector("#SelectPrice");
    const SelectNumber = document.querySelector("#SelectNumber");
    const SelectButton = document.querySelectorAll(".ShoppingBag__SelectButton")[0];
    const AllButton = document.querySelectorAll(".ShoppingBag__AllButton")[0];
    const Selectors = document.querySelectorAll(".ProductSelected");
    for(let i = 0;i<Selectors.length;i++){
        Selectors[i].addEventListener('change',(event)=>{
            const {dataset:{id}} = Selectors[i];
            console.log(id);
            const ToggleState = !Selectors[i].checked;
            console.dir(ToggleState);
            const {path:[_,__,___,tr]} = event;
            const SelectPrice = document.querySelectorAll(`#Price${i+1}`)[0];
            const SelectCount = document.querySelectorAll(`#Count${i+1}`)[0];

            if(ToggleState === true){
                ProductSelectArray.splice(ProductSelectArray.indexOf(id));
                SelectNumber.innerHTML = parseInt(SelectNumber.innerHTML) - 1;
                NSelectPrice.innerHTML = parseInt(NSelectPrice.innerHTML) - parseInt(SelectPrice.innerHTML) * parseInt(SelectCount.innerHTML);
            }
            else{
                ProductSelectArray.push(id);
                SelectNumber.innerHTML = parseInt(SelectNumber.innerHTML) + 1;
                NSelectPrice.innerHTML = parseInt(NSelectPrice.innerHTML) + parseInt(SelectPrice.innerHTML) * parseInt(SelectCount.innerHTML);
            }
            AllPrice.innerHTML = parseInt(NSelectPrice.innerHTML) + 2500;
        });
    }
    SelectButton.addEventListener('click',()=>{
        console.log(ProductSelectArray);
        CreateForm(ProductSelectArray);
    })

};

window.onload = ProcessInit


const CreateForm = (data) =>{
    const Form = document.createElement('form');
    Form.setAttribute("charset", "UTF-8");
    Form.setAttribute("method", "Post");
    Form.setAttribute("action", "/Purchase/");

    const hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "ProductId[]");
    hiddenField.setAttribute("value", data);
    const hiddenProductCount = document.createElement("input");
    hiddenProductCount.setAttribute("type","hidden");
    hiddenProductCount.setAttribute("name", "State");
    hiddenProductCount.setAttribute("value","All");

    Form.appendChild(hiddenField);
    Form.appendChild(hiddenProductCount);
    document.body.appendChild(Form);
    Form.appendChild(hiddenField);
    Form.submit();
}
