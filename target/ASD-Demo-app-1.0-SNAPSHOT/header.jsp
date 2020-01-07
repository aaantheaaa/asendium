<%-- 
    Document   : header
    Created on : Dec 2, 2019, 12:06:26 PM
    Author     : el181
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--Header: navigation bar on the top, should import with page_footer-->
<%
String title = request.getParameter("page_title");

%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">        
        <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <script src="/javascript/app.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
                <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css" integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay" crossorigin="anonymous">
        <link rel="stylesheet" type="text/css" href="css/style.css">
        <title><%=title%></title>
        
         
    </head>
    <body>
        <div class="container">
            <header class ="blog-header py-3">
                <div class ="row flex-nowrap jsutify-content-between align-items-center">
                    <div class ="col-4 pt-1">
                        <a class ="text-muted" href="https://www.asendium.com/asendium-lite/">Subscribe<a>
                    </div>
                    <div class ="col-4 text-center">
                        <a class ="blog-header-logo text-dark logofont" href="index.jsp">Universal Calculator</a>
                    </div>
                    <div class ="col-4 d-flex justify-content-end align-items-center">
                        <a class ="text-muted" href="#" aria-label="Search">
                            <img src="img/searchIcon.png" width="20" height="20">
                        </a>
                    </div>
                </div>
            </header>
        <div class="nav-scroller py-1 mb-2">
            <nav class="nav d-flex justify-content-between">
                <a class="p-2 text-muted" href="common.jsp">Common</a>
                <a class="p-2 text-muted" href="cashflow.jsp">Cashflow</a>
                <a class="p-2 text-muted" href="investment.jsp">Investment</a>
                <a class="p-2 text-muted" href="debt.jsp">Debt</a>
                <a class="p-2 text-muted" href="insurance.jsp">Insurance</a>
                <a class="p-2 text-muted" href="superannuation.jsp">Superannuation</a>
                <a class="p-2 text-muted" href="retirement.jsp">Retirement</a>
                <a class="p-2 text-muted" href="centrelink.jsp">Centrelink</a>
            </nav>
        </div>
            
