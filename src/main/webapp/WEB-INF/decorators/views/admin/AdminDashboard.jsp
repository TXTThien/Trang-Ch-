<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin CRUD</title>
    <link rel="stylesheet" href="/resources/static/css/admin/style.css">
    <link rel="stylesheet" href="/resources/static/css/admin/responsive.css">
</head>
<body>
<header>
    <div class="logosec">
        <a href="/DashBoard" style="text-decoration: none"><div class="logo">Admin</div></a>
        <img src="/resources/static/assets/image/menu.png" class="icn menuicn" id="menuicn" alt="menu-icon">
    </div>

    <div class="message">
        <div class="circle"></div>
        <a href="/bookshop"><img src="/resources/static/assets/image/nofi.png" class="icn" ></a>
        <div class="dp">
            <a href="/DashBoard"><img src="/resources/static/assets/image/admin.png" class="dpicn" alt="dp"></a>
        </div>
        <a class="nav-link" href="${pageContext.request.contextPath}/logout" style="margin-top: 20px; margin-left: 10px; color: darkblue; display: inline-block;">
            <button id="log-out" class="btn btn-primary">Log out</button>
        </a>
    </div>
</header>

<div class="main-container">
    <div class="navcontainer">
        <nav class="nav">
            <div class="nav-upper-options">
                <div class="option1 nav-option">
                    <img src="/resources/static/assets/image/option.png" class="nav-img" alt="dashboard">
                    <h3><a class="link" href="/DashBoard">Dashboard</a></h3>
                </div>
                <div class="nav-option option10">
                    <img src="/resources/static/assets/image/user.png" class="nav-img" alt="Account" />
                    <h3><a class="link" href="/api/admin-accounts/admin/account">Account</a></h3>
                </div>

                <div class="nav-option option3">
                    <img src="/resources/static/assets/image/advertisement.png" class="nav-img" alt="Banner" />
                    <h3><a class="link" href="/api/banners/admin/banner">Banner</a></h3>
                </div>

                <div class="nav-option option4">
                    <img src="/resources/static/assets/image/bill.png" class="nav-img" alt="Bill" />
                    <h3><a class="link" href="/api/bills/admin/bill">Bill</a></h3>
                </div>

                <div class="nav-option option5">
                    <img src="/resources/static/assets/image/billinfor.png" class="nav-img" alt="Bill infor" />
                    <h3>
                        <a class="link" href="/api/admin-billinfos/admin/billinfo">Bill infor</a>
                    </h3>
                </div>

                <div class="nav-option option6">
                    <img src="/resources/static/assets/image/books.png" class="nav-img" alt="Books" />
                    <h3><a class="link" href="/api/books/admin/books">Books</a></h3>
                </div>

                <div class="nav-option option8">
                    <img src="/resources/static/assets/image/file.png" class="nav-img" alt="category" />
                    <h3><a class="link" href="/api/categories/admin/category">category</a></h3>
                </div>

                <div class="nav-option option10">
                    <img src="/resources/static/assets/image/view.png" class="nav-img" alt="Read Before" />
                    <h3>
                        <a class="link" href="/api/reads/admin/read">Read Before</a>
                    </h3>
                </div>

                <div class="nav-option option11">
                    <img src="/resources/static/assets/image/star.png" class="nav-img" alt="review" />
                    <h3><a class="link" href="/api/reviews/admin/review">review</a></h3>
                </div>

                <div class="nav-option option12">
                    <img src="/resources/static/assets/image/document.png" class="nav-img" alt="Type" />
                    <h3><a class="link" href="/api/types/admin/type">Type</a></h3>
                </div>
            </div>
        </nav>
    </div>

    <div class="main">
        <div class="box-container">
            <div class="box box1">
                <div class="text">
                    <c:set var="DT" />
                    <c:forEach var="BillInfo" items="${BillInfos}">
                        <c:set var="DT" value="${DT + BillInfo.number*(BillInfo.bookid.price+BillInfo.bookid.typeID.price)}"/>
                    </c:forEach>
                    <h2 class="topic-heading">${DT/1000}00đ</h2>
                    <h2 class="topic">Doanh thu</h2>
                </div>
                <img src="/resources/static/assets/image/coin.png" alt="Views">
            </div>

            <div class="box box2">
                <div class="text">
                    <h2 class="topic-heading">${bills.size()}</h2>
                    <h2 class="topic">Đơn hàng</h2>
                </div>
                <img src="/resources/static/assets/image/file.png" alt="likes">
            </div>

            <div class="box box3">
                <div class="text">
                    <h2 class="topic-heading">${accounts.size()}</h2>
                    <h2 class="topic">Người dùng</h2>
                </div>
                <img src="/resources/static/assets/image/userman.png" alt="comments">
            </div>

            <div class="box box4">
                <div class="text">
                    <h2 class="topic-heading">${reviews.size()}</h2>
                    <h2 class="topic">Đánh giá</h2>
                </div>
                <img src="/resources/static/assets/image/star.png" alt="published">
            </div>
        </div>

        <div class="report-container">
            <div class="report-header">
                <h1 class="recent-account">List User</h1>
            </div>
            <div class="report-body">
                <table class="report-table">
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>SĐT</th>
                        <th>Address</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="account" items="${accounts}">
                        <tr>
                            <td>${account.accountID}</td>
                            <td>${account.username}</td>
                            <td>${account.phoneNumber}</td>
                            <td>${account.address}</td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<script src="/resources/static/js/index.js"></script>
</body>
</html>
