const SelectTypeOn = ()=>{
    const SelectBox = document.getElementById("selectBox");
    for(let i=0;i<7;i++){
        if(SelectBox[i].value == jsp_value){
           SelectBox[i].selected=true;
        }
    }
}

SelectTypeOn();