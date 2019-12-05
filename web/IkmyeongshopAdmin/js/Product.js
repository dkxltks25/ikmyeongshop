
window.onload = ()=>{
    const ListViewDetail = document.querySelectorAll(".ListViewDetail");

    for(let i = 0; i <ListViewDetail.length;i++){
        ListViewDetail[i].addEventListener('click',(event)=>{
            console.dir(ListViewDetail);
            console.log(i);
            const {dataset:{id}} = ListViewDetail[i];
            location.href = `./ProductViewDetail.jsp?ProductId=${id}`;
        })
    }
}