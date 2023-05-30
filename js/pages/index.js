/*
 *  Document   : index.js
 *  Author     : pixelcave
 *  Description: Custom javascript code used in Dashboard page
 */

var Index = function() {

    return {
        init: function() {
            /* Mini Bar Charts with jquery.sparkline plugin, for more examples you can check out http://omnipotent.net/jquery.sparkline/#s-about */
            var miniChartBarOptions = {
                type: 'bar',
                barWidth: 8,
                barSpacing: 6,
                height: '64px',
                tooltipOffsetX: -25,
                tooltipOffsetY: 20,
                barColor: '#999999',
                tooltipPrefix: '+ ',
                tooltipSuffix: ' Sales',
                tooltipFormat: '{{prefix}}{{value}}{{suffix}}'
            };
            $('#mini-chart-sales').sparkline([8,3,1,5,4,8,9,6,5,7,10,5,8,9], miniChartBarOptions);

            miniChartBarOptions['tooltipSuffix'] = '%';
            $('#mini-chart-brand').sparkline([50,65,70,90,95,110,140,160,190,200,220,230,260], miniChartBarOptions);

            /*
             * With Gmaps.js, Check out examples and documentation at http://hpneo.github.io/gmaps/examples.html
             */


            /*
             * Flot 0.8.2 Jquery plugin is used for charts
             *
             * For more examples or getting extra plugins you can check http://www.flotcharts.org/
             * Plugins included in this template: pie, resize, stack, time
             */

            // Get the elements where we will attach the charts
            var dashWidgetChart = $('#dash-widget-chart');
			
            // Random data for the chart
            
		/*	var dataSent = [[1, 1560], [2, 1650], [3, 1320], [4, 1950], [5, 1800], [6, 2400], [7, 2100]];
            var dataOpened = [[1, 500], [2, 420], [3, 480], [4, 350], [5, 600], [6, 850], [7, 1100]];
            var dataClicked = [[1, 50], [2, 42], [3, 40], [4, 35], [5, 60], [6, 85], [7, 110]];
			
			 
            // Array with month labels used in chart
            var chartMonths = [[1, 'Saturday'], [2, 'Sunday'], [3, 'Monday'], [4, 'Tuesday'], [5, 'Wednesday'], [6, 'Thursday'], [7, 'Friday']];
	*/
            // Initialize Dash Widget Chart
            $.plot(dashWidgetChart,
                [
                    {
                        data: dataSent,
                        lines: {show: true, fill: false},
                        points: {show: true, radius: 6, fillColor: '#cccccc'}
                    },
                    {
                        data: dataOpened,
                        lines: {show: true, fill: false},
                        points: {show: true, radius: 6, fillColor: '#ffffff'}
                    },
                    {
                        data: dataClicked,
                        lines: {show: true, fill: false},
                        points: {show: true, radius: 6, fillColor: '#ffffff'}
                    }
                ],
                {
                    colors: ['#ffffff', '#353535'],
                    legend: {show: false},
                    grid: {borderWidth: 0, hoverable: true, clickable: true},
                    yaxis: {show: false},
                    xaxis: {show: false, ticks: chartMonths}
                }
            );

            // Creating and attaching a tooltip to the widget
            var previousPoint = null, ttlabel = null;
            dashWidgetChart.bind('plothover', function(event, pos, item) {

                if (item) {
                    if (previousPoint !== item.dataIndex) {
                        previousPoint = item.dataIndex;

                        $('#chart-tooltip').remove();
                        var x = item.datapoint[0], y = item.datapoint[1];

                        // Get xaxis label
                        var monthLabel = item.series.xaxis.options.ticks[item.dataIndex][1];

                        if (item.seriesIndex === 2) {
                            ttlabel = '<strong>' + y + '</strong> clicked on <strong>' + monthLabel + '</strong>';
                        } else 
                        if (item.seriesIndex === 1) {
                            ttlabel = '<strong>' + y + '</strong> opened on <strong>' + monthLabel + '</strong>';
                        } else {
                            ttlabel = '<strong>' + y + '</strong> sent  on<strong>' + monthLabel + '</strong>';
                        }

                        $('<div id="chart-tooltip" class="chart-tooltip">' + ttlabel + '</div>')
                            .css({top: item.pageY - 50, left: item.pageX - 50}).appendTo("body").show();
                    }
                }
                else {
                    $('#chart-tooltip').remove();
                    previousPoint = null;
                }
            });
        }
    };
}();