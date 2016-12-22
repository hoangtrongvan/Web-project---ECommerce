<%-- 
    Document   : Order-List
    Created on : Dec 5, 2016, 2:05:13 PM
    Author     : nhatduthan2405
--%>

<%@page import="Order.OrderDAO"%>

<%@page import="Order.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="description" content="chart created using amCharts live editor" />
        <title>Total Income</title>
        <script src="../amcharts/amcharts.js" type="text/javascript"></script>
        <script src="../amcharts/serial.js" type="text/javascript"></script>
        <script>
            var chart;

            var chartData = [
                {
                    "product": 2005,
                    "amount": 23.5,
                    "expenses": 18.1
                },
                {
                    "product": 2006,
                    "amount": 26.2,
                    "expenses": 22.8
                },
                {
                    "product": 2007,
                    "amount": 30.1,
                    "expenses": 23.9
                },
                {
                    "product": 2008,
                    "amount": 29.5,
                    "expenses": 25.1
                },
                {
                    "product": 2009,
                    "amount": 24.6,
                    "expenses": 25
                }
            ];


            AmCharts.ready(function () {
                // SERIAL CHART
                chart = new AmCharts.AmSerialChart();
                chart.dataProvider = chartData;
                chart.categoryField = "product";
                chart.startDuration = 1;
                chart.rotate = true;

                // AXES
                // category
                var categoryAxis = chart.categoryAxis;
                categoryAxis.gridPosition = "start";
                categoryAxis.axisColor = "#DADADA";
                categoryAxis.dashLength = 3;

                // value
                var valueAxis = new AmCharts.ValueAxis();
                valueAxis.dashLength = 3;
                valueAxis.axisAlpha = 0.2;
                valueAxis.position = "top";
                valueAxis.title = "Amount";
                valueAxis.minorGridEnabled = true;
                valueAxis.minorGridAlpha = 0.08;
                valueAxis.gridAlpha = 0.15;
                chart.addValueAxis(valueAxis);



                // GRAPHS
                // column graph
                var graph1 = new AmCharts.AmGraph();
                graph1.type = "column";
                graph1.title = "Amount";
                graph1.valueField = "amount";
                graph1.lineAlpha = 0;
                graph1.fillColors = "#FF5C4D";
                graph1.fillAlphas = 0.8;
                graph1.balloonText = "<span style='font-size:13px;'>[[title]] of [[category]]:<b>[[value]]</b></span>";
                chart.addGraph(graph1);

                // line graph
                var graph2 = new AmCharts.AmGraph();
                graph2.type = "line";
                graph2.lineColor = "#27c5ff";
                graph2.bulletColor = "#FFFFFF";
                graph2.bulletBorderColor = "#27c5ff";
                graph2.bulletBorderThickness = 2;
                graph2.bulletBorderAlpha = 1;
                graph2.title = "Expenses";
                graph2.valueField = "expenses";
                graph2.lineThickness = 2;
                graph2.bullet = "round";
                graph2.fillAlphas = 0;
                graph2.balloonText = "<span style='font-size:13px;'>[[title]] in [[category]]:<b>[[value]]</b></span>";
                chart.addGraph(graph2);

                // LEGEND
                var legend = new AmCharts.AmLegend();
                legend.useGraphSettings = true;
                chart.addLegend(legend);

                chart.creditsPosition = "top-right";

                // WRITE
                chart.write("chartdiv");
            });
        </script>





        <style>
            body{
                margin: 0;

                padding : 0;
            }           
            table {
                border-collapse: collapse;
                width: 100%;
            }

            th, td {
                text-align: left;
                padding: 8px;
            }

            tr:nth-child(even){background-color: #FFEAD3}

            th {
                background-color: #FF6053;
                color: white;
            }
            td.totalIncome{
                font-weight: bold;
                color: white;
                background-color: #FF6053;
            }
            .integer{
                text-align: center;
                width: 40px;
                height: 20px;
                border-radius: .5rem;
                background-color: white;
                color: #333;
                margin-top: -12px;



            }
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 8px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                margin: 4px 2px;
                -webkit-transition-duration: 0.4s; /* Safari */
                transition-duration: 0.4s;
                cursor: pointer;
            }
            .button1 {
                background-color: #4CAF50;
                color: white;
                border: 2px solid #4CAF50;
            }

            .button1:hover {
                background-color: white; 
                color: black; 

            }



            .button3 {
                background-color: #f44336;
                color: white;
                border: 2px solid #f44336;
            }

            .button3:hover {
                background-color: white; 
                color: black; 

            }


        </style>
    </head>
    <body>
        <jsp:include page="../HeaderandFooter/navbar.jsp" /> 
        <jsp:include page="../HeaderandFooter/horizon-nav.jsp" /> 
        <div id="chartdiv" class="inline" style="width: 500px; height: 600px;"></div> 


        <div class="inline" style="padding:0;height:100%;">

            <table>
                <tr>

                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Price of Product</th>
                    <th>Quantity</th>
                    <th>Order Total</th>



                </tr>
                <%
                    OrderDAO orderDAO = new OrderDAO();
                    ArrayList<Order> allOrders = orderDAO.generateReport();
                    Collections.reverse(allOrders);
                    int i = 0;
                    float totalIncome = 0;
                %>

                <%
                    for (Order order : allOrders) {

                        String productID = order.getProduct_id();

                        String productName = order.getProduct_name();
                        float price = order.getPrice();
                        float total = order.getTotal();
                        int quantity = order.getQuantity();
                %>
                <tr>

                    <td><%=productID%></td>
                    <td><p id="name<%=++i%>"><%=productName%></p></td>
                    <td><%="$" + price%></td>
                    <td><p id="quantity<%=i%>"><%=quantity%><p></td>
                    <td><%="$" + total%></td>




                </tr>

                <% totalIncome += total;
      }%>
                <tr >

                    <td></td>
                    <td></td>
                    <td></td>
                    <td class="totalIncome">Total Income :</td>
                    <td class="totalIncome"><%="$" + totalIncome%></td>



                </tr>
            </table>
        </div>

        <script>
            var active = document.getElementById("total");
            active.className += " active";
        </script>
    </body>
</html>
