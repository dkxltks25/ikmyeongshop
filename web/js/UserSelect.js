
const List = ["Attention", "QnA", "UserInfoChange", "UserInfosecession", "Userdelivery", "UserQnA", "UserReview"];
window.addEventListener("hashchange",(event)=>{
    const Position = document.location.href.split("#")[1];
    const ViewList = document.getElementsByClassName("User__container_content")[0];
    fetch('../User/UserSelect.jsp')
        .then(body=>body.text())
        .then(function(html) {
            const parser = new DOMParser();
            const doc = parser.parseFromString(html, "text/html");
            return doc;
        })
        .then(doc=>{
            const {all} = doc;
            for(let i = 0; i<all.length;i++){
                if(all[i].className === `User__${List[List.indexOf(Position)]}`){
                    ViewList.innerHTML = all[i].innerHTML;
                    if(all[i].className === `User__Attention`){
                        const DeleteButton = document.querySelectorAll(".Userdelete__button");
                        const SelectButton = document.querySelectorAll(".UserSelect__button");
                        for(let j = 0; j <DeleteButton.length;j++){
                            DeleteButton[j].addEventListener('click',()=>{
                                const {dataset:{id}} = DeleteButton[j];
                                console.log(id);
                                alert(id);
                                AddForm('Delete',id)

                            });
                            SelectButton[j].addEventListener('click',()=>{
                                const {dataset:{id}} = SelectButton[j];
                                AddForm('Select',id)
                            });
                        }
                    }
                }
            }
        })
    console.dir(ViewList);
});


const AddForm = (State,dataId) =>{
    const Form = document.createElement('form');
    Form.setAttribute("charset", "UTF-8");
    Form.setAttribute("method", "Post");
    Form.setAttribute("action", "../Product/AttentionAction.jsp");

    const hiddenField = document.createElement("input");
    hiddenField.setAttribute("type", "hidden");
    hiddenField.setAttribute("name", "state");
    hiddenField.setAttribute("value", State);
    const hiddenProductCount = document.createElement("input");
    hiddenProductCount.setAttribute("type","hidden");
    hiddenProductCount.setAttribute("name", "dataId");
    hiddenProductCount.setAttribute("value",dataId);

    Form.appendChild(hiddenField);
    Form.appendChild(hiddenProductCount);
    document.body.appendChild(Form);
    Form.appendChild(hiddenField);
    Form.submit();
}