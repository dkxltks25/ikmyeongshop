
window.onload = () =>{
    const tr = document.querySelectorAll("tr");
    for(let i = 0; i<tr.length;i++){
        tr[i].addEventListener('click',()=>{
            const {dataset:{id}} = tr[i];
            $.ajax({
                url:"ServiceNoticeAction.jsp",
                data:{id},
                dataType:"Text",
                success: (data)=>{
                    const successData = data.trim();
                    const CreateTr = document.createElement("tr");
                    const CreateTd = document.createElement("td");
                    CreateTd.appendChild(document.createTextNode(successData));
                    CreateTd.setAttribute("colspan","4");
                    CreateTr.appendChild(CreateTd);
                    CreateTr.classList.add("TempTr");
                    const TempTr= document.querySelectorAll(".TempTr")[0];
                    console.dir(TempTr);
                    if(TempTr !== undefined){
                        TempTr.remove();
                    }
                    tr[i].after(CreateTr);
                    console.log(data);
                },
                error:(e1,e2,e3)=>{
                    console.log(e1,e2,e3);
                }

            })
        })
    }
}