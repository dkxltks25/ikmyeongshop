
const List = ["notice","QnA","FAQ"];
window.addEventListener("hashchange",(event)=>{
    console.log(1);
    const Position = document.location.href.split("#")[1];
    const ViewList = document.getElementsByClassName("Service__container_content")[0];
    fetch('../Service/ServiceView.jsp')
        .then(body=>body.text())
        .then(function(html) {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");
            return doc;
        })
        .then(doc=>{
            const {all} = doc;
            console.dir(all);
            for(let i = 0; i<all.length;i++){
                if(all[i].className === `ServiceView__${List[List.indexOf(Position)]}`){
                    ViewList.innerHTML = all[i].innerHTML;
                }
            }
        });
    console.dir(ViewList);
});
