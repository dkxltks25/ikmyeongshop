const init = ()=>{
    const [AllReview,AllProductQ] = document.getElementsByClassName("viewAllReview");
    const [WriteReview,WriteProductQ] = document.getElementsByClassName("WriteReview");
    console.dir(AllReview);
    AllReview.addEventListener('click',()=>{
        alert(1);
    })
}
init();
