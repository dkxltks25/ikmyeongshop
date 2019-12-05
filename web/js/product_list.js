const SelectTypeOn = ()=>{
    const SelectBox = document.getElementById("selectBox");
    for(let i=0;i<7;i++){
        if(SelectBox[i].value == jsp_value){
           SelectBox[i].selected=true;
        }
    }
}

SelectTypeOn()

window.onload = ()=>{
    const List = document.querySelectorAll(".product_list_form_sort_item");
    for(let i = 0; i < List.length;i++){
        List[i].addEventListener("click",()=>{
            location.href =`../Product/Product_list.jsp?ProductClass=${jsp_value}&ProductOption=${i+1}`;
        })
    }
    const SELECTOR = document.querySelector("#selectBox");
    SELECTOR.addEventListener('change',(event)=>{
        const {target} = event;
        console.dir(target);
        for(let i = 0;i<target.length;i++){
            if(target[i].selected){
                location.href=`../Product/Product_list.jsp?ProductClass=${target[i].value}`;
            }
        }
    })
}