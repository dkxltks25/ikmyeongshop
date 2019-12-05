const AllPrice = document.querySelector("#SelectAllPrice") ;
const NSelectPrice = document.querySelector("#SelectPrice");
const SelectNumber = document.querySelector("#SelectNumber");


const ProcessInit = ()=>{
    const Selectors = document.querySelectorAll(".ProductSelected");
    for(let i = 0;i<Selectors.length;i++){
        Selectors[i].addEventListener('change',(event)=>{

            const ToggleState = !Selectors[i].checked;
            console.dir(ToggleState);
            const {path:[_,__,___,tr]} = event;
            const SelectPrice = document.querySelectorAll(`#Price${i+1}`)[0];
            const SelectCount = document.querySelectorAll(`#Count${i+1}`)[0];

            if(ToggleState === true){
                SelectNumber.innerHTML = parseInt(SelectNumber.innerHTML) - 1;
                NSelectPrice.innerHTML = parseInt(NSelectPrice.innerHTML) - parseInt(SelectPrice.innerHTML) * parseInt(SelectCount.innerHTML);
            }
            else{
                SelectNumber.innerHTML = parseInt(SelectNumber.innerHTML) + 1;
                NSelectPrice.innerHTML = parseInt(NSelectPrice.innerHTML) + parseInt(SelectPrice.innerHTML) * parseInt(SelectCount.innerHTML);

            }
            AllPrice.innerHTML = parseInt(NSelectPrice.innerHTML) + 2500;


        });
    }

};

ProcessInit();

