<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="../static/css/carousel.css" rel="stylesheet">


    <title>Title</title>
     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>

</head>
<body>
<!-- NAVBAR
================================================== -->
<div class="navbar-wrapper">
      <div class="container">

        <nav class="navbar navbar-inverse navbar-fixed-top">
          <div class="container">
            <div class="navbar-header">
              <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
              </button>
              <a class="navbar-brand" href="/">Home</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
              <ul class="nav navbar-nav">
                <li><a href="/">Present</a></li>
                <li><a href="/page/description">Description</a></li>
                <li><a href="/page/reference">Reference</a></li>
              </ul>
            </div>
          </div>
        </nav>

      </div>
</div>

<hr class="featurette-divider">



<div class="row">
  <div class="col-md-6">
      
      <div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto">
         
      </div>
       <div id="container3" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
  </div>
  <div class="col-md-6">
<div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<div id="container4" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
  </div>
</div>





<script type="text/javascript">
	$(function () {

	$.getJSON('/task4data4', function (data) {

		
        var nData=[];
        for(i=0;i<data.length;i++){
            nData.push([data[i]['hour'],data[i]['count']]);

        }

        $('#container4').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Number of twitters with respect to hour'
        },
        subtitle: {
            text: 'Source: <a href="http://en.wikipedia.org/wiki/List_of_cities_proper_by_population">Wikipedia</a>'
        },
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'number of twitters'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'number of twitters: <b>{point.y:.0f}</b>'
        },
        series: [{
            name: 'twitters',
            data: nData,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.0f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });
});

});


	$(function () {

	$.getJSON('/task4data3', function (data) {

		var cat=['Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri','Sat'];
        var nData=[];
        for(i=0;i<cat.length;i++){
            nData.push([cat[i],data[i]['count']]);
        }

        $('#container3').highcharts({
        chart: {
            type: 'column'
        },
        title: {
            text: 'Number of twitters with recpect to day of week'
        },
        
        xAxis: {
            type: 'category',
            labels: {
                rotation: -45,
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        },
        yAxis: {
            min: 0,
            title: {
                text: 'number of twitters'
            }
        },
        legend: {
            enabled: false
        },
        tooltip: {
            pointFormat: 'Number of twitters: <b>{point.y:.0f}</b>'
        },
        series: [{
            name: 'twitters',
            data: nData,
            dataLabels: {
                enabled: true,
                rotation: -90,
                color: '#FFFFFF',
                align: 'right',
                format: '{point.y:.0f}', // one decimal
                y: 10, // 10 pixels down from the top
                style: {
                    fontSize: '13px',
                    fontFamily: 'Verdana, sans-serif'
                }
            }
        }]
    });
});

});


	$(function () {

	$.getJSON('/task4data1', function (data) {

		console.log(data);
		var posData=[];
		var negData=[];
		var neuData=[];

		data.forEach(function (d) {
			posData.push(d['positive']);
		});
		data.forEach(function (d) {
			negData.push(d['negative']);
		});
		data.forEach(function (d) {
			neuData.push(d['neutral']);
		});

		var possum=0;
		var negsum=0;
		var neusum=0;
		var aveData=[];
		for(i=0;i<posData.length;i++){
			possum+=posData[i];
			negsum+=negData[i];
			neusum+=neuData[i];
			aveData.push((posData[i]+negData[i]+neuData[i])/3);
		}
    $('#container1').highcharts({
        title: {
            text: 'Tweet sentiment with respect to day of week'
        },
        xAxis: {
            categories: ['Sun','Mon', 'Tue', 'Wed', 'Thu', 'Fri','Sat']
        },
        labels: {
            items: [{
                html: 'Overall sentiment',
                style: {
                    left: '50px',
                    top: '18px',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Positive',
            data: posData
        }, {
            type: 'column',
            name: 'Negative',
            data: negData
        }, {
            type: 'column',
            name: 'Neutral',
            data: neuData
        }, {
            type: 'spline',
            name: 'Average',
            data: aveData,
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }, 
        ]
    });
});

});


		$(function () {

	$.getJSON('/task4data2', function (data) {

		console.log(data);
		var hourData=[];
		var posData=[];
		var negData=[];
		var neuData=[];

		data.forEach(function (d) {
			posData.push(d['positive']);
			negData.push(d['negative']);
			neuData.push(d['neutral']);
			hourData.push(d['hour'])
		});
		

		var possum=0;
		var negsum=0;
		var neusum=0;
		var aveData=[];
		for(i=0;i<posData.length;i++){
			possum+=posData[i];
			negsum+=negData[i];
			neusum+=neuData[i];
			aveData.push((posData[i]+negData[i]+neuData[i])/3);
		}
    $('#container2').highcharts({
        title: {
            text: 'Tweet sentiment with respect to hour'
        },
        xAxis: {
            categories: hourData
        },
        labels: {
            items: [{
                html: 'Overall sentiment',
                style: {
                    left: '50px',
                    top: '18px',
                    color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                }
            }]
        },
        series: [{
            type: 'column',
            name: 'Positive',
            data: posData
        }, {
            type: 'column',
            name: 'Negative',
            data: negData
        }, {
            type: 'column',
            name: 'Neutral',
            data: neuData
        }, {
            type: 'spline',
            name: 'Average',
            data: aveData,
            marker: {
                lineWidth: 2,
                lineColor: Highcharts.getOptions().colors[3],
                fillColor: 'white'
            }
        }, {
            type: 'pie',
            name: 'Overall sentiment',
            data: [{
                name: 'Positive',
                y: possum,
                color: Highcharts.getOptions().colors[0] // Jane's color
            }, {
                name: 'Negative',
                y: negsum,
                color: Highcharts.getOptions().colors[1] // John's color
            }, {
                name: 'Neutral',
                y: neusum,
                color: Highcharts.getOptions().colors[2] // Joe's color
            }],
            center: [100, 80],
            size: 100,
            showInLegend: false,
            dataLabels: {
                enabled: false
            }
        }]
    });
});

});
</script>
      <!-- FOOTER -->
      <footer>
        <p class="pull-right"><a href="#">Back to top</a></p>
        <p>&copy; 2016 University of Melbourne &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
      </footer>


</body>
</html>
