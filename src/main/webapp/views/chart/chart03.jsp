<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<style>
  /*#c1, #c2, #c3{*/
  /*  width:300px;*/
  /*  height:300px;*/
  /*  border:2px solid lightgray;*/
  /*  margin:10px;*/
  /*}*/
</style>

<script>
  let chart03 = {
    init: () => {
      chart03.getdata1();
      chart03.getdata2();
      chart03.getdata3();
    },
    getdata1: () => {
      $.ajax({
        url:'/chart0301',
        success: (result) => {
          chart03.display1(result)
        }
      });
    },
    getdata2: () => {
      $.ajax({
        url:'/chart0302',
        success: (result) => {
          chart03.display2(result)
        }
      });
    },
    getdata3: () => {
      $.ajax({
        url:'/chart0303',
        success: (result) => {
          chart03.display3(result)
        }
      });

    },
    display1: (result) => {
// Data retrieved from https://olympics.com/en/olympic-games/beijing-2022/medals
      Highcharts.chart('c1', {
        chart: {
          type: 'pie',
          options3d: {
            enabled: true,
            alpha: 45
          }
        },
        title: {
          text: 'Beijing 2022 gold medals by country',
          align: 'left'
        },
        subtitle: {
          text: '3D donut in Highcharts',
          align: 'left'
        },
        plotOptions: {
          pie: {
            innerSize: 100,
            depth: 45
          }
        },
        series: [{
          name: 'Medals',
          data: result
        }]
      });

    },
    display2: (result) => {
      var categories = [
        '0-4', '5-9', '10-14', '15-19', '20-24', '25-29', '30-34', '35-40', '40-45',
        '45-49', '50-54', '55-59', '60-64', '65-69', '70-74', '75-79', '80+'
      ];
      Highcharts.chart('c2', {
        chart: {
          type: 'bar'
        },
        title: {
          text: 'Population pyramid for Somalia, 2021',
          align: 'left'
        },
        subtitle: {
          text: 'Source: <a ' +
                  'href="https://countryeconomy.com/demography/population-structure/somalia"' +
                  'target="_blank">countryeconomy.com</a>',
          align: 'left'
        },
        accessibility: {
          point: {
            valueDescriptionFormat: '{index}. Age {xDescription}, {value}%.'
          }
        },
        xAxis: [{
          categories: categories,
          reversed: false,
          labels: {
            step: 1
          },
          accessibility: {
            description: 'Age (male)'
          }
        }, { // mirror axis on right side
          opposite: true,
          reversed: false,
          categories: categories,
          linkedTo: 0,
          labels: {
            step: 1
          },
          accessibility: {
            description: 'Age (female)'
          }
        }],
        yAxis: {
          title: {
            text: null
          },
          labels: {
            formatter: function () {
              return Math.abs(this.value) + '%';
            }
          },
          accessibility: {
            description: 'Percentage population',
            rangeDescription: 'Range: 0 to 5%'
          }
        },

        plotOptions: {
          series: {
            stacking: 'normal',
            borderRadius: '50%'
          }
        },

        tooltip: {
          formatter: function () {
            return '<b>' + this.series.name + ', age ' + this.point.category + '</b><br/>' +
                    'Population: ' + Highcharts.numberFormat(Math.abs(this.point.y), 1) + '%';
          }
        },

        series: [{
          name: 'Male',
          data: [
            -8.98, -7.52, -6.65, -5.72, -4.85,
            -3.71, -2.76, -2.07, -1.70, -1.47,
            -1.22, -0.99, -0.81, -0.62, -0.41,
            -0.23, -0.15
          ]
        }, {
          name: 'Female',
          data: result
        }]
      });


    },
    display3: (result) => {
        console.log(result);
      // Data retrieved from https://netmarketshare.com/
// Build the chart
      Highcharts.chart('c3', {
        chart: {
          plotBackgroundColor: null,
          plotBorderWidth: null,
          plotShadow: false,
          type: 'pie'
        },
        title: {
          text: 'Browser market shares in March, 2022',
          align: 'left'
        },
        tooltip: {
          pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
        },
        accessibility: {
          point: {
            valueSuffix: '%'
          }
        },
        plotOptions: {
          pie: {
            allowPointSelect: true,
            cursor: 'pointer',
            dataLabels: {
              enabled: false
            },
            showInLegend: true
          }
        },
        series: [{
          name: 'Brands',
          colorByPoint: true,
          data: result
        }]
      });


    }

  };

  $( () => {
    chart03.init();
  });


</script>

<div class="col-sm-8 text-left">
    <h3>CHART03</h3><br/>
    <div class="row">
      <div class="col-sm-4" id="c1">
        c1
      </div>
      <div class="col-sm-4" id="c2">
        c2
      </div>
      <div class="col-sm-4" id="c3">
        c3
      </div>
    </div>
</div>