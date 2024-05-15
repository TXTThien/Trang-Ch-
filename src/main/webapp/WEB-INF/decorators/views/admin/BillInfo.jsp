<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin BillInfo Management</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>

<header>
    <div class="logosec">
        <a href="/DashBoard" style="text-decoration: none"><div class="logo">Admin</div></a>
        <img src="/resources/static/assets/image/menu.png" class="icn menuicn" id="menuicn" alt="menu-icon">
    </div>

    <div>
        <h3 class="logo">BillInfo Management</h3>
    </div>

    <div class="message">
        <div class="circle"></div>
        <a href="/bookshop"><img src="/resources/static/assets/image/home.jpg" class="icn" ></a>
        <div class="dp">
            <a href="/DashBoard"><img src="/resources/static/assets/image/admin.png" class="dpicn" alt="dp"></a>
        </div>
        <a class="nav-link" href="${pageContext.request.contextPath}/logout" style="margin-top: 20px; margin-left: 10px; color: darkblue; display: inline-block;">
            <button id="log-out" class="btn btn-primary">Log out</button>
        </a>
    </div>
</header>

<body>


<div class="main-container">
    <div class="navcontainer">
        <nav class="nav">
            <div class="nav-upper-options">
                <div class="nav-option option2">
                    <img
                            src="/resources/static/assets/image/option.png"
                            class="nav-img"
                            alt="dashboard"
                    />
                    <h3><a class="link" href="/DashBoard">Dashboard</a></h3>
                </div>
                <div class="nav-option option5">
                    <img
                            src="/resources/static/assets/image/user.png"
                            class="nav-img"
                            alt="Account"
                    />
                    <h3>
                        <a class="link" href="/api/admin-accounts/admin/account">Account</a>
                    </h3>
                </div>

                <div class="nav-option option3">
                    <img
                            src="/resources/static/assets/image/advertisement.png"
                            class="nav-img"
                            alt="Banner"
                    />
                    <h3><a class="link" href="/api/banners/admin/banner">Banner</a></h3>
                </div>

                <div class="nav-option option4">
                    <img
                            src="/resources/static/assets/image/bill.png"
                            class="nav-img"
                            alt="Bill"
                    />
                    <h3><a class="link" href="/api/bills/admin/bill">Bill</a></h3>
                </div>

                <div class="nav-option option1">
                    <img
                            src="/resources/static/assets/image/billinfor.png"
                            class="nav-img"
                            alt="Bill infor"
                    />
                    <h3>
                        <a class="link" href="/api/admin-billinfos/admin/billinfo"
                        >Bill infor</a
                        >
                    </h3>
                </div>

                <div class="nav-option option6">
                    <img
                            src="/resources/static/assets/image/books.png"
                            class="nav-img"
                            alt="Books"
                    />
                    <h3><a class="link" href="/api/books/admin/books">Books</a></h3>
                </div>

                <div class="nav-option option8">
                    <img
                            src="/resources/static/assets/image/file.png"
                            class="nav-img"
                            alt="category"
                    />
                    <h3>
                        <a class="link" href="/api/categories/admin/category">category</a>
                    </h3>
                </div>

                <div class="nav-option option10">
                    <img
                            src="/resources/static/assets/image/view.png"
                            class="nav-img"
                            alt="Read Before"
                    />
                    <h3>
                        <a class="link" href="/api/reads/admin/read">Read Before</a>
                    </h3>
                </div>

                <div class="nav-option option11">
                    <img
                            src="/resources/static/assets/image/star.png"
                            class="nav-img"
                            alt="review"
                    />
                    <h3><a class="link" href="/api/reviews/admin/review">review</a></h3>
                </div>

                <div class="nav-option option12">
                    <img
                            src="/resources/static/assets/image/document.png"
                            class="nav-img"
                            alt="Type"
                    />
                    <h3><a class="link" href="/api/types/admin/type">Type</a></h3>
                </div>
            </div>
        </nav>
    </div>

    <div class="main">


        <table class="table-curd" border="1">
            <thead>
            <tr>
                <th style="width: 300px">BillInfo ID</th>
                <th style="width: 300px">Bill ID</th>
                <th>Book ID</th>
                <th>Number</th>
                <th class="actions">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="billInfo" items="${billInfos}">
                <tr>
                    <td style="font-size: 15px">${billInfo.billInfoID}</td>
                    <td style="font-size: 15px">${billInfo.billID.billID}</td>
                    <td style="font-size: 15px"><input class="input-content" id="bookID${billInfo.billInfoID}" value="${billInfo.bookid.bookID}"></td>
                    <td style="font-size: 15px"><input class="input-content" type="number" id="number${billInfo.billInfoID}" value="${billInfo.number}"></td>
                    <td>
                        <button onclick="updateBillInfo(${billInfo.billInfoID})">Update</button>
                        <button onclick="deleteBillInfo(${billInfo.billInfoID})">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <script>

            let menuicn = document.querySelector(".menuicn");
            let nav = document.querySelector(".navcontainer");

            menuicn.addEventListener("click", () => {
                nav.classList.toggle("navclose");
            });

            function addNewBillInfo() {
                var billID = document.getElementById('newBillID').value;
                var bookID = document.getElementById('newBookID').value;
                var number = document.getElementById('newNumber').value;

                if (!billID) {
                    alert('Please enter a valid Bill ID');
                    return;
                }

                var billInfoData = {
                    billID: { billID: billID },
                    bookid: { bookID: bookID },
                    number: number
                };

                fetch('/api/admin-billinfos', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(billInfoData)
                })
                    .then(response => {
                        if (response.ok) {
                            return response.json();
                        } else {
                            throw new Error('Failed to create billInfo');
                        }
                    })
                    .then(data => {
                        alert('BillInfo added successfully!');
                        window.location.reload();
                    })
                    .catch(error => {
                        alert('Error adding billInfo: ' + error.message);
                        console.error('Error:', error);
                    });
            }


            function updateBillInfo(id) {
                var newBookID = document.getElementById('bookID' + id).value;
                var newNumber = document.getElementById('number' + id).value;

                fetch('/api/admin-billinfos/' + id, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({
                        bookid: { bookID: newBookID },
                        number: newNumber
                    })
                })
                    .then(response => {
                        if (response.ok) {
                            alert('Update successful!');
                            window.location.reload();
                        } else {
                            alert('Error updating billInfo');
                        }
                    })
                    .catch(error => {
                        alert('Error updating billInfo: ' + error.message);
                        console.error('Error:', error);
                    });
            }

            function deleteBillInfo(id) {
                if (confirm("Are you sure you want to delete this billInfo?")) {
                    fetch('/api/admin-billinfos/' + id, {
                        method: 'DELETE'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert('Delete successful!');
                                window.location.reload();
                            } else {
                                alert('Error deleting billInfo');
                            }
                        })
                        .catch(error => {
                            alert('Error deleting billInfo: ' + error.message);
                            console.error('Error:', error);
                        });
                }
            }
        </script>

    </div>
</div>
</body>
</html>
