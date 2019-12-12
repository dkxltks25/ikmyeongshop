

window.onload = () =>{
    const UserSelect = document.querySelectorAll(".UserDetail__SelectPanel");
    console.log(UserSelect);
    for(let i= 0; UserSelect.length-1;i++){
        UserSelect[i].addEventListener('click',()=>{
            console.log(i);
            console.dir(UserSelect[i]);
            StateChangeArray[i](UserSelect[i],i);
        })

    }

};
const StatePurchaseList = (Select,i) =>{
    const {classList} = Select;
    if(classList.value === "UserDetail__SelectPanel"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        $.ajax({
            url:"../action/UserDetailAction.jsp",
            dataType:"text",
            data:{
                state:"PurchaseList",
                id:UserId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                const UserTable = document.querySelectorAll(".UserTable")[i];
                const BeforeUserInfoTable = document.querySelectorAll(".UserInfoTable")[i];
                if(BeforeUserInfoTable !== undefined){
                    BeforeUserInfoTable.remove();
                }
                const UserInfoTable = document.createElement("tbody");
                UserInfoTable.classList.add("UserInfoTable");

                console.log(JsonData);
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","5");
                    TdTag.createTextNode("등록된 정보가 없습니다");
                    TrTag.appendChild(TdTag);
                }else{

                    JsonData.map((index)=>{
                        const TrTag = document.createElement("tr");
                        index.map((text)=>{
                            const TdTag = document.createElement("td");
                           const Text = document.createTextNode(text);
                           TdTag.appendChild(Text);
                            TrTag.appendChild(TdTag);
                        });
                        UserInfoTable.appendChild(TrTag);
                    });
                    UserTable.appendChild(UserInfoTable);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};

const StatePurchaseGraph = (Select) =>{
};

const StateAttentionList = (Select,i) =>{
    const {classList} = Select;
    if(classList.value === "UserDetail__SelectPanel"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        console.log(InsertArea);
        $.ajax({
            url:"../action/UserDetailAction.jsp",
            dataType:"text",
            data:{
                state:"AttentionList",
                id:UserId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                console.log(JsonData);
                const UserTable = document.querySelectorAll(".UserTable")[i];
                console.log(UserTable);
                const BeforeUserInfoTable = document.querySelectorAll(".UserInfoTable")[i];
                if(BeforeUserInfoTable !== undefined){
                    BeforeUserInfoTable.remove();
                }
                const UserInfoTable = document.createElement("tbody");
                UserInfoTable.classList.add("UserInfoTable");

                console.log(JsonData);
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","5");
                    const Text = document.createTextNode("등록된 찜목록이 없습니다.");
                    TdTag.appendChild(Text);
                    TrTag.appendChild(TdTag);
                    UserInfoTable.appendChild(TrTag);
                    UserTable.appendChild(UserInfoTable);
                }else{
                    JsonData.map((index)=>{
                        console.log(1);
                        console.log("-"+index);
                        const TrTag = document.createElement("tr");
                        index.map((text)=>{
                            console.log("-"+text);
                            const TdTag = document.createElement("td");
                            const Text = document.createTextNode(text);
                            TdTag.appendChild(Text);
                            TrTag.appendChild(TdTag);
                        });
                        UserInfoTable.appendChild(TrTag);
                    });
                    UserTable.appendChild(UserInfoTable);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }

};
const StateShoppingBagList = (Select,i)=>{
    const {classList} = Select;
    if(classList.value === "UserDetail__SelectPanel"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        console.log(InsertArea);
        $.ajax({
            url:"../action/UserDetailAction.jsp",
            dataType:"text",
            data:{
                state:"ShoppingBagList",
                id:UserId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                const UserTable = document.querySelectorAll(".UserTable")[i];
                console.log(UserTable);
                const BeforeUserInfoTable = document.querySelectorAll(".UserInfoTable")[i];
                if(BeforeUserInfoTable !== undefined){
                    BeforeUserInfoTable.remove();
                }
                const UserInfoTable = document.createElement("tbody");
                UserInfoTable.classList.add("UserInfoTable");

                console.log(JsonData);
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","5");
                    const Text = document.createTextNode("등록된 찜목록이 없습니다.");
                    TdTag.appendChild(Text);
                    TrTag.appendChild(TdTag);
                    UserInfoTable.appendChild(TrTag);
                    UserTable.appendChild(UserInfoTable);
                }else{
                    JsonData.map((index)=>{
                        console.log(1);
                        console.log("-"+index);
                        const TrTag = document.createElement("tr");
                        index.map((text)=>{
                            console.log("-"+text);
                            const TdTag = document.createElement("td");
                            const Text = document.createTextNode(text);
                            TdTag.appendChild(Text);
                            TrTag.appendChild(TdTag);
                        });
                        UserInfoTable.appendChild(TrTag);
                    });
                    UserTable.appendChild(UserInfoTable);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};
const StateReviewList = (Select,i) =>{
    const {classList} = Select;
    if(classList.value === "UserDetail__SelectPanel"){
        const InsertArea = document.querySelectorAll(`#pane-events-${[i+1]}`)[0];
        console.log(InsertArea);
        $.ajax({
            url:"../action/UserDetailAction.jsp",
            dataType:"text",
            data:{
                state:"ReviewList",
                id:UserId
            },
            success:(data)=>{
                const SuccesData = data.trim();
                const JsonData = JSON.parse(SuccesData);
                const UserTable = document.querySelectorAll(".UserTable")[i];
                console.log(UserTable);
                const BeforeUserInfoTable = document.querySelectorAll(".UserInfoTable")[i];
                if(BeforeUserInfoTable !== undefined){
                    BeforeUserInfoTable.remove();
                }
                const UserInfoTable = document.createElement("tbody");
                UserInfoTable.classList.add("UserInfoTable");

                console.log(JsonData);
                if(JsonData.length === 0){
                    const TrTag = document.createElement("tr");
                    const TdTag = document.createElement("td");
                    TdTag.setAttribute("colspan","5");
                    const Text = document.createTextNode("등록된 찜목록이 없습니다.");
                    TdTag.appendChild(Text);
                    TrTag.appendChild(TdTag);
                    UserInfoTable.appendChild(TrTag);
                    UserTable.appendChild(UserInfoTable);
                }else{
                    JsonData.map((index)=>{
                        console.log(1);
                        console.log("-"+index);
                        const TrTag = document.createElement("tr");
                        index.map((text)=>{
                            console.log("-"+text);
                            const TdTag = document.createElement("td");
                            const Text = document.createTextNode(text);
                            TdTag.appendChild(Text);
                            TrTag.appendChild(TdTag);
                        });
                        UserInfoTable.appendChild(TrTag);
                    });
                    UserTable.appendChild(UserInfoTable);
                }
            },
            error:(e1,e2,e3)=>{
                console.log(e1);
                console.log(e2);
                console.log(e3);
            }
        })
    }
};

const StateChangeArray = [StatePurchaseList,StateAttentionList,StateShoppingBagList,StateReviewList];