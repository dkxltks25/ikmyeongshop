
const List = ["Attention",
"QnA",
"UserInfoChange",
"UserInfosecession",
"Userdelivery",
"UserQnA",
"UserReview"];
window.addEventListener("hashchange",(event)=>{
    const Position = document.location.href.split("#")[1];
    const ViewList = document.getElementsByClassName("User__container_content")[0]
    fetch('../User/UserSelect.jsp')
        .then(body=>body.text())
        .then(function(html) {
            var parser = new DOMParser();
            var doc = parser.parseFromString(html, "text/html");
            return doc;
        })
        .then(doc=>{
            const {all} = doc;
            for(let i = 0; i<all.length;i++){
                if(all[i].className === `User__${List[List.indexOf(Position)]}`){
                    ViewList.innerHTML = all[i].innerHTML;
                }
            }
        })
    console.dir(ViewList);
});