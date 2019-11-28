window.onload=()=>{
    const Select = document.getElementsByClassName("ServiceQnA__Container_ContentBox")[0];
    const textCount = document.getElementById("textCount");
    let Temp = 0;
    Select.addEventListener('keydown',(e)=>{
        textCount.innerHTML = Select.value.length;
        if(Select.value.length+1 >= 255){
            Select.value = Temp;
        }else{
            Temp = Select.value;
        }
    })
    Select.addEventListener('change',(e)=>{
        textCount.innerHTML = Select.value.length;
        if(Select.value.length+1 >= 255){
            Select.value = Temp;
        }else{
            Temp = Select.value;
        }
    })
}