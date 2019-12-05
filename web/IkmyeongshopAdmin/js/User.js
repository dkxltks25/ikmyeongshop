
const Init =()=>{
    const [ViewDetail,DeleteUser] = document.querySelectorAll(".mui_list_custom");
    console.dir(ViewDetail);
    ViewDetail.addEventListener('click',()=>{
        const {dataset:{id}} = ViewDetail;
        window.location.href=`./UserDetail.jsp?UserId=${id}`;
    });
    DeleteUser.addEventListener('click',()=>{

    });
};

window.onload= Init();