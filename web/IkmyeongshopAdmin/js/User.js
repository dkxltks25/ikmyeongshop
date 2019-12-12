
const Init =()=>{
    const ViewDetail = document.querySelectorAll(".detailUser");
    console.dir( document.querySelectorAll(".mui_list_custom"));

    for(let i = 0; i<ViewDetail.length;i++){
        ViewDetail[i].addEventListener('click',()=>{
            const {dataset:{id}} = ViewDetail[i];
            window.location.href=`./UserDetail.jsp?UserId=${id}`;
        });
    }

};

window.onload= Init();