
window.onload = ()=>{
    const ListContent = document.getElementsByClassName("list_customButton_Content");
    const ListWrite = document.getElementsByClassName("list_customButton_Write");

    for(let i = 0; i<ListContent.length;i++){
        ListContent[i].addEventListener("click",()=>{
            const {dataset:{id}} = ListContent[i];
            let WriteText = "";
            $.ajax({
                type: "get",
                url: `../action/QnAListArray.jsp?id=${id}`,
                dataType:"text",
                processData: false,
                contentType: false,
                cache: false,
                timeout: 600000,
                success:  (data) =>{
                    const Check = document.getElementsByClassName(`ViewContentArea${i+1}`);
                    if(Check[0] === undefined){
                        const tr = document.getElementById(`QnANumber${i+1}`);
                        const NewTr = document.createElement("tr");
                        NewTr.classList.add(`ViewContentArea${i+1}`);
                        const NewTd1 = document.createElement("td");
                        NewTd1.setAttribute("colspan",1);
                        NewTd1.appendChild(document.createTextNode("└──"));
                        const NewTd2 = document.createElement("td");
                        NewTd2.setAttribute("colspan",6);
                        NewTd2.appendChild(document.createTextNode(data));

                        NewTr.appendChild(NewTd1);
                        NewTr.appendChild(NewTd2);

                        tr.after(NewTr);
                    }else{
                        Check[0].remove();
                    }
                },
                error: function (e) {
                    console.log("ERROR : ", e);
                },
            })
        })
    }
    for(let i = 0; i<ListWrite.length;i++){
        ListWrite[i].addEventListener("click",()=>{
            const {dataset:{id}} = ListWrite[i];
            const Check = document.getElementsByClassName(`ViewContentArea${i+1}`);
            if(Check[0] === undefined){
                const tr = document.getElementById(`QnANumber${i+1}`);
                const NewTr = document.createElement("tr");
                NewTr.classList.add(`ViewContentArea${i+1}`);

                const NewTd = document.createElement("td");
                NewTd.setAttribute("colspan","1");
                const NewTd1 = document.createElement("td");
                const MuiInputDiv = document.createElement("div");
                MuiInputDiv.classList.add("mui-textfield");
                MuiInputDiv.classList.add("mui-textfield--float-label");

                const ContentInut = document.createElement("input");
                ContentInut.setAttribute('type','text');
                const ContentLabel = document.createElement("label");
                ContentLabel.appendChild(document.createTextNode("답장명 입력"));

                MuiInputDiv.appendChild(ContentInut);
                MuiInputDiv.appendChild(ContentLabel);
                NewTd1.setAttribute("colspan","4");
                NewTd1.appendChild(MuiInputDiv);

                const NewTd2 = document.createElement("td");
                const SubmitButton = document.createElement("button");
                SubmitButton.addEventListener('click',()=>{

                });
                SubmitButton.setAttribute("width","100px");
                SubmitButton.classList.add("mui-btn");
                SubmitButton.classList.add("mui-btn--raised");
                SubmitButton.appendChild(document.createTextNode("Submit"));
                NewTd2.appendChild(SubmitButton);
                NewTd2.setAttribute("colspan",2);
                NewTr.appendChild(NewTd);
                NewTr.appendChild(NewTd1);
                NewTr.appendChild(NewTd2);
                tr.after(NewTr);
            }else{
                Check[0].remove();
            }
                },

        )}

};
