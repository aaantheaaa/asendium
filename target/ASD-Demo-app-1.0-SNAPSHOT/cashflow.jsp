
<jsp:include page="header.jsp">
    <jsp:param name="page_title" value="asendium/calaulator/cashflow"/>
</jsp:include>

<div class="container bg-light mt-5" >
    <h2 class="p-3"> Saving Goals Calculator</h2>
    <div class ="row">
    <div class="col-sm-5">
    <form>
        <div class="form-group row" >
            <label for="Saving Goal" class="col-sm-11 col-form-label text-dark">Saving Goal</label>
            <div class="col-sm-11">
            <input type="number" class="form-control" id="SavingGoal" onchange="fSavingGoal(document.getElementById('SavingGoal').value)">
            </div>
        </div>
        <div class="form-group row" >
            <label for="Starting Balance" class="col-sm-11 col-form-label text-dark">Starting Balance</label>
            <div class="col-sm-11">
            <input type="number" class="form-control" id="StartingBalance" onchange="fStartingBalance(document.getElementById('StartingBalance').value)">
            </div>
        </div>
        <div class="form-group row" >
            <label for="Time Period" class="col-sm-11 col-form-label text-dark">Time Period (Year)</label>
            <div class="col-sm-11">
            <input type="number" class="form-control" id="TimePeriod" onchange="fTimePeriod(document.getElementById('TimePeriod').value)">
            </div>
        </div>
        <div class="form-group row" >
            <label for="Interest Rate" class="col-sm-11 col-form-label text-dark">Interest Rate</label>
            <div class="col-sm-11">
            <input type="number" class="form-control" id="InterestRate" placeholder="Not Implemented Yet :(">
            </div>
        </div>
        <div class="form-group row" >
            <input type="button" class="btn btn-primary ml-3 mt-2" id="pdfButton" value="Save As PDF" onclick="toPDF()">
        </div>
        <div class="form-group row" >
            <h2 class="m-4" id = "msgbox"></h2>
        </div>
    </form>
    </div>
    <div class="col-sm-7 p-4">
        
        <canvas id="result" width="400" height="400" style="background-color: #ffffffbb; padding: 20px"></canvas>
        <script type="text/javascript">
        


        var startingYear = 2020;
        let savingGoal = {v:0};
        let startingBalance = {v:0};
        let year = {v:0};
        let interestRate = {v:0};//Not Implemented Yet
        var formCompleted = false;
        var chartLabel = [];
        var chartData1 = [];
        var chartData2 = [];
        let savingsAmount = 4000;
        let savingsPerMonth = {v:0};
        var msg ="";

        var ctx = document.getElementById('result');
        var resultChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: [],
                datasets: [
                {
                    label: 'Starting Balance',
                    data: [],
                    backgroundColor: 
                        'rgba(78, 84, 200, 1)'
                    ,
                    borderWidth: 1
                },{
                    label: 'Regular Savings',
                    data: [],
                    backgroundColor: 
                        'rgba(143, 148, 251, 1)'
                    ,
                    borderWidth: 1
                },{
                    label: 'Interest',
                    data: [],
                    backgroundColor: 
                        'rgba(252, 92, 125, 1)'
                    ,
                    borderWidth: 1
                }     
                ]
            },

            options: {
            	tooltips:{
            		mode: 'index',
            		intersect: false
            	},
            	responsive: true,
                scales: {
                	xAxes: [{
                		stacked: true,
                	}],
                    yAxes: [{
                    	stacked: true,
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
        
        function init()
        {
            startingYear = 2020;
            interestRate = {v:0};//Not Implemented Yet
            formCompleted = false;
            chartLabel = [];
            chartData1 = [];
            chartData2 = [];
            savingsAmount = -1;
        }

        
        function fSavingGoal(value){
            init();
            savingGoal.v = value;
            updateChart();
        }
        
        function fStartingBalance(value){
            init();
            startingBalance.v = value;
            updateChart();
        }

        function fTimePeriod(value){
            init();
            year.v = value;
            updateChart();
        };

        function updateChart(){
            for(i = 0 ; i < year.v ; i ++ )
            {
                chartLabel.push(startingYear++);
            }

            resultChart.data.labels = chartLabel;

            
            savingsAmount = (parseFloat(savingGoal.v) - parseFloat(startingBalance.v))/ parseFloat(year.v);

            for(j = 1 ; j <= year.v ; j ++ )
            {
                var caculatedSavingsPerYear = (j*savingsAmount);
                chartData1.push(caculatedSavingsPerYear.toFixed(2));
                chartData2.push(parseFloat(startingBalance.v).toFixed(2));
            }
            resultChart.data.datasets[1].data = chartData1;
            resultChart.data.datasets[0].data = chartData2;

            if(savingsAmount > 0 && year.v > 0 && savingGoal.v > 0){
            msg = document.getElementById("msgbox");
            savingsPerMonth.v = savingsAmount/12;
            msg.innerHTML = "You need to save<br/>"+" $ " +  parseFloat(savingsPerMonth.v).toFixed(2) + " <br/>per month.";
            }
            resultChart.update();
        };

        function toPDF(){
        	var doc = new jsPDF();
        	var canvas = document.getElementById('result');
        	var context = canvas.getContext('2d');
        	var img = canvas.toDataURL("image/png");

        	doc.setFont("times");
        	doc.setFontSize(10);
        	doc.text(5,5,'test- convert to pdf');
        	doc.setFontSize(50);
        	doc.text(30,35,'Asendium');
        	doc.setFontSize(40);
        	doc.text(30,55,'Savings Goals Calculator');
        	doc.setFontSize(20);
        	doc.text(30,70,'Saving Goal: ' + savingGoal.v);
        	doc.text(30,80,'Starting Balance: ' + startingBalance.v);
        	doc.text(30,90,'Time Period (Year): '+ year.v);
        	doc.text(30,100,'Interest Rate: ' + interestRate.v);
        	doc.setFontSize(23);
        	doc.setFontType("bold");
        	doc.text(30,115,'You need to save $'+ (savingsPerMonth.v).toFixed(2) +'\nper month.');
        	doc.addImage(img,'JPEG',30,133,130,140);
        	// Not x,y stuff - XML? study! 
        	doc.save('test.pdf');
        }

        /*$('pdfButton').click(function(){
        	var doc = new jsPDF();
        	var imgData = 'CalculatorDoc.jpg';
        	document.write("function working");
        	doc.addImage(imgData,'JPEG',0,0,210,297);

        	doc.save('test.pdf');

        });*/

        </script>
    </div>
    </div>
</div>


<jsp:include page="footer.jsp" />