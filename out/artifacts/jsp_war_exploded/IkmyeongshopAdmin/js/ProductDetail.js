

window.onload = ()=>{
    const ListProduct = document.querySelectorAll(".List_Product");
    const ToggleButton = document.querySelectorAll(".ProductViewDetail__toggle");

    for(let i = 0; i<ListProduct.length;i++){
        ListProduct[i].addEventListener('click',()=> {
            const {classList} = ListProduct[i];
            if(classList.value === "List_Product mui--is-active"){
                //리스트 같은 거 클릭
            }else{

                //리스트 다른 거
                var ctx = document.getElementById('myChart').getContext('2d');
            }
        });
    }

   for(let i = 0; i<ToggleButton.length;i++){
       ToggleButton[i].addEventListener('click',()=>{

           const PanelArea = document.querySelectorAll(`#mui__CustomPane${i+1}`)[0];
           console.log(PanelArea);
           if(ToggleButton[i].checked === true){
               //리스트 NO
               $.ajax({
                   type:"GET",
                   url:`../action/ProductViewDetailAction.jsp?State=ReviewList&ProductId=${ProductId}&day=12`,
                   dataType:"text",
                   processData: false,
                   contentType: false,
                   cache: false,
                   timeout: 600000,
                   success:  (data) =>{
                        const JsonData = JSON.parse(data.trim());
                   },
                   error: function (e) {
                       console.log("ERROR : ", e);
                   },
               })
           }else{
               $.ajax({
                   type:"GET",
                   url:`../action/ProductViewDetailAction.jsp?State=ReviewGraph&ProductId=${ProductId}&day=12`,
                   dataType:"text",
                   processData: false,
                   contentType: false,
                   cache: false,
                   timeout: 600000,
                   success:  (data) =>{
                       const JsonData = JSON.parse(data.trim());
                       const CustomCanvas = document.createElement("canvas");
                       const InputData = JsonData.map((index)=>index[0])
                       const DataColumn = JsonData.map((index)=>index[1]+"일");
                       CustomCanvas.classList.add(`CustomCanvas${i+1}`);
                       const myChart = new Chart(CustomCanvas.getContext('2d'), {
                           type: 'bar',
                           data: {
                               labels: DataColumn,
                               datasets: [{
                                   label: '# of Votes',
                                   data: InputData,
                                   backgroundColor: [
                                       'rgba(255, 99, 132, 0.2)',
                                       'rgba(54, 162, 235, 0.2)',
                                       'rgba(255, 206, 86, 0.2)',
                                       'rgba(75, 192, 192, 0.2)',
                                       'rgba(153, 102, 255, 0.2)',
                                       'rgba(255, 159, 64, 0.2)'
                                   ],
                                   borderColor: [
                                       'rgba(255, 99, 132, 1)',
                                       'rgba(54, 162, 235, 1)',
                                       'rgba(255, 206, 86, 1)',
                                       'rgba(75, 192, 192, 1)',
                                       'rgba(153, 102, 255, 1)',
                                       'rgba(255, 159, 64, 1)'
                                   ],
                                   borderWidth: 1
                               }]
                           },
                           options: {
                               scales: {
                                   yAxes: [{
                                       ticks: {
                                           beginAtZero: true
                                       }
                                   }]
                               }
                           }
                       });
                       PanelArea.appendChild(CustomCanvas);
                   },
                   error: function (e) {
                       console.log("ERROR : ", e);
                   },
               })
           }
       })
   }
};