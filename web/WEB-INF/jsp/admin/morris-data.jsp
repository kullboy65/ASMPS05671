<%-- 
    Document   : morris-data
    Created on : Feb 18, 2017, 8:56:18 PM
    Author     : PC
--%>
<%@page import="bean.LineChart"%>
<%@page import="bean.DonutChart"%>
<%@page import="DAO.Chart_DAO"%>
<%@page import="bean.Dept"%>
<%@page import="java.util.List"%>
<%@page import="DAO.Dept_DAO"%>
<%@page import="DAO.DeptRecord_DAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript">
    $(function () {

// Area Chart
    Morris.Area({
    element: 'morris-area-chart',
            data: [{
            period: '2010 Q1',
                    iphone: 2666,
                    ipad: null,
                    itouch: 2647
            }, {
            period: '2010 Q2',
                    iphone: 2778,
                    ipad: 2294,
                    itouch: 2441
            }, {
            period: '2010 Q3',
                    iphone: 4912,
                    ipad: 1969,
                    itouch: 2501
            }, {
            period: '2010 Q4',
                    iphone: 3767,
                    ipad: 3597,
                    itouch: 5689
            }, {
            period: '2011 Q1',
                    iphone: 6810,
                    ipad: 1914,
                    itouch: 2293
            }, {
            period: '2011 Q2',
                    iphone: 5670,
                    ipad: 4293,
                    itouch: 1881
            }, {
            period: '2011 Q3',
                    iphone: 4820,
                    ipad: 3795,
                    itouch: 1588
            }, {
            period: '2011 Q4',
                    iphone: 15073,
                    ipad: 5967,
                    itouch: 5175
            }, {
            period: '2012 Q1',
                    iphone: 10687,
                    ipad: 4460,
                    itouch: 2028
            }, {
            period: '2012 Q2',
                    iphone: 8432,
                    ipad: 5713,
                    itouch: 1791
            }],
            xkey: 'period',
            ykeys: ['iphone', 'ipad', 'itouch'],
            labels: ['iPhone', 'iPad', 'iPod Touch'],
            pointSize: 2,
            hideHover: 'auto',
            resize: true
    });
// Donut Chart
    Morris.Donut({
    element: 'morris-donut-chart',
            data: [
    <%
        String name = "a";
        String value = "4";
        Chart_DAO chart_dao = new Chart_DAO();
        List listvalue = chart_dao.getDonutChart();
        for (int i = 0; i < listvalue.size(); i++) {
            DonutChart d = (DonutChart) listvalue.get(i);
            name = d.getNamedept();
            value = String.valueOf(d.getValue());
    %>
            {
            label: "<%= name%>",
                    value: <%= value%>
            },
    <%

        }
    %>
            ],
            resize: true
    });
//        var u = setInterval(function () {
//            $("#morris-donut-chart").empty();
//            test();
//        }, 1000);



// Line Chart
    Morris.Line({
// ID of the element in which to draw the chart.
    element: 'morris-line-chart',
// Chart data records -- each entry in this array corresponds to a point on
// the chart.
            data: [
    <%
        List listvalueline = chart_dao.getLineChart();
        for (int i = 0; i < listvalueline.size(); i++) {
            LineChart d = (LineChart) listvalueline.get(i);
            name = d.getDate();
            value = String.valueOf(d.getValue());
    %>
            {
            d: '<%= name%>',
                    visits: <%= value%>
            },
    <%
                            }
    %>
            ],
// The name of the data record attribute that contains x-visitss.
            xkey: 'd',
// A list of names of data record attributes that contain y-visitss.
            ykeys: ['visits'],
// Labels for the ykeys -- will be displayed when you hover over the
// chart.
            labels: ['Record'],
// Disables line smoothing
            smooth: false,
            resize: true
    });
// Bar Chart



    Morris.Bar({
    element: 'morris-bar-chart',
            data: [{
            device: 'iPhone',
                    geekbench: 136
            }, {
            device: 'iPhone 3G',
                    geekbench: 137
            }, {
            device: 'iPhone 3GS',
                    geekbench: 275
            }, {
            device: 'iPhone 4',
                    geekbench: 380
            }, {
            device: 'iPhone 4S',
                    geekbench: 655
            }, {
            device: 'iPhone 5',
                    geekbench: 1571
            }],
            xkey: 'device',
            ykeys: ['geekbench'],
            labels: ['Geekbench'],
            barRatio: 0.4,
            xLabelAngle: 35,
            hideHover: 'auto',
            resize: true
    });
    });

</script>