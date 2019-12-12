window.onload = () =>{
    const [newUser,Sales,BestSales,MajorView,ShoppingBag] = document.querySelectorAll(".MainIndexCard");
    newUserGraph(newUser,12);
    SalesGraph(Sales,12);
    BestSalesGraph(BestSales,12);
    MajorViewGraph(MajorView,12);
    ShoppingBagGraph(ShoppingBag,12);
};

const newUserGraph = (Area,Day) =>{
    $.ajax({
        url:"../IkmyeongshopAdmin/action/MainGraphAction.jsp",
        type:"POST",
        dataType:"text",
        data:{
            State:"newUser",
            day:Day,
        },
        cache:false,
        success:(data)=>{
            const SuccesData = JSON.parse(data.trim());
            console.log(SuccesData);
            const InputData = SuccesData.map(index=>{
                return index[0];
            });
            const DataColumn = SuccesData.map(index=>{
                console.log(index[1]);
                return index[1]+"일";
            });
            const ChartCheck = document.querySelectorAll(".CustomCanvas1")[0];
            console.log(ChartCheck);
            if(ChartCheck !== undefined){
                ChartCheck.remove();
            }
            const CustomCanvas = document.createElement("canvas");
            CustomCanvas.classList.add(`CustomCanvas1`);
            CustomCanvas.setAttribute('width',"420px");
            CustomCanvas.setAttribute('height',"400px");

            Area.appendChild(CustomCanvas);
            const myChart = new Chart(CustomCanvas.getContext('2d'), {
                type: 'bar',
                data: {
                    labels: DataColumn,
                    datasets: [{
                        label: `${Day}월 가입자 통계`,
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
                        borderWidth: 3
                    }]
                },
                options: {
                    scales: {

                    }
                }
            });
        },
        error:(e1,e2,e3)=>{
            console.log(e1,e2,e3);
        }
    })
};


const SalesGraph = (Area,Day) =>{
    $.ajax({
        url:"../IkmyeongshopAdmin/action/MainGraphAction.jsp",
        type:"POST",
        dataType:"text",
        data:{
            State:"Sales",
            day:Day,
        },
        cache:false,
        success:(data)=>{
            const SuccesData = JSON.parse(data.trim());
            console.log(SuccesData);
            const InputData = SuccesData.map(index=>{
                return index[0];
            });
            const DataColumn = SuccesData.map(index=>{
                console.log(index[1]);
                return index[1]+"일";
            });
            const ChartCheck = document.querySelectorAll(".CustomCanvas2")[0];
            console.log(ChartCheck);
            if(ChartCheck !== undefined){
                ChartCheck.remove();
            }
            const CustomCanvas = document.createElement("canvas");
            CustomCanvas.classList.add(`CustomCanvas2`);
            CustomCanvas.setAttribute('width',"420px");
            CustomCanvas.setAttribute('height',"400px");

            Area.appendChild(CustomCanvas);
            const myChart1 = new Chart(CustomCanvas.getContext('2d'), {
                type: 'line',
                data: {
                    labels: DataColumn,
                    datasets: [{
                        label: `${Day}월 매출`,
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
                        borderWidth: 2
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
        },
        error:(e1,e2,e3)=>{
            console.log(e1,e2,e3);
        }
    })
};
const BestSalesGraph = (Area,Day) =>{
    $.ajax({
        url:"../IkmyeongshopAdmin/action/MainGraphAction.jsp",
        type:"POST",
        dataType:"text",
        data:{
            State:"Best",
            day:Day,
        },
        cache:false,
        success:(data)=>{
            const SuccesData = JSON.parse(data.trim());
            console.log(SuccesData);
            const InputData = SuccesData.map(index=>{
                return index[0];
            });
            const DataColumn = SuccesData.map(index=>{
                console.log(index[1]);
                return index[1]+"일";
            });
            const ChartCheck = document.querySelectorAll(".CustomCanvas3")[0];
            console.log(ChartCheck);
            if(ChartCheck !== undefined){
                ChartCheck.remove();
            }
            const CustomCanvas = document.createElement("canvas");
            CustomCanvas.classList.add(`CustomCanvas3`);
            CustomCanvas.setAttribute('width',"420px");
            CustomCanvas.setAttribute('height',"400px");

            Area.appendChild(CustomCanvas);
            const myChart = new Chart(CustomCanvas.getContext('2d'), {
                type: 'pie',
                data: {
                    labels: DataColumn,
                    datasets: [{
                        label: `${Day}월 가입자 통계`,
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
            });
        },
        error:(e1,e2,e3)=>{
            console.log(e1,e2,e3);
        }
    })

};
const MajorViewGraph = (Area,Day) =>{
    $.ajax({
        url:"../IkmyeongshopAdmin/action/MainGraphAction.jsp",
        type:"POST",
        dataType:"text",
        data:{
            State:"View",
            day:Day,
        },
        cache:false,
        success:(data)=>{
            const SuccesData = JSON.parse(data.trim());
            console.log(SuccesData);
            const InputData = SuccesData.map(index=>{
                return index[0];
            });
            const DataColumn = SuccesData.map(index=>{
                console.log(index[1]);
                return index[1]+"일";
            });
            const ChartCheck = document.querySelectorAll(".CustomCanvas4")[0];
            console.log(ChartCheck);
            if(ChartCheck !== undefined){
                ChartCheck.remove();
            }
            const CustomCanvas = document.createElement("canvas");
            CustomCanvas.classList.add(`CustomCanvas3`);
            CustomCanvas.setAttribute('width',"420px");
            CustomCanvas.setAttribute('height',"400px");

            Area.appendChild(CustomCanvas);
            const myChart = new Chart(CustomCanvas.getContext('2d'), {
                type: 'pie',
                data: {
                    labels: DataColumn,
                    datasets: [{
                        label: `${Day}월 가입자 통계`,
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
            });
        },
        error:(e1,e2,e3)=>{
            console.log(e1,e2,e3);
        }
    })

};
const ShoppingBagGraph = () =>{

};

