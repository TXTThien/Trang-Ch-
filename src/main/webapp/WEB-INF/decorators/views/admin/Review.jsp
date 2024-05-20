<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<!--
-->
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Category Management</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>

<header>
    <div class="logosec">
        <a href="/DashBoard" style="text-decoration: none"><div class="logo">Admin</div></a>
        <img src="/resources/static/assets/image/menu.png" class="icn menuicn" id="menuicn" alt="menu-icon">
    </div>

    <div>
        <h3 class="logo">Reviews Management</h3>
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
                <div class="nav-option option8">
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

                <div class="nav-option option5">
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

                <div class="nav-option option11">
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

                <div class="nav-option option1">
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
        <form id="addCategoryForm" onsubmit="addNewReview(); return false;">
            <input class="input-content" style="width: 550px" type="number" id="newBookId" placeholder="Enter new Book ID " min="1" max="${books.size()}" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newAccountId" placeholder="Enter new Account ID " min="1" max="${accounts.size()}" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newPoint" placeholder="Enter new Point " min="1" max="5" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newComment" placeholder="Enter new Comment" required>
            <p style="margin-top: 8px"></p>
            <button class="button-submit" type="submit">Add Review</button>
        </form>

        <table class="table-curd" >
            <thead>
            <tr>
                <th class="content-id">Review ID</th>
                <th style="width: 100px">Book ID</th>
                <th style="width: 400px">Book Tittle</th>
                <th style="width: 140px">Account ID</th>
                <th style="width: 120px">Point</th>
                <th>Comment</th>

                <th class="actions">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="review" items="${reviews}">
                <tr>
                    <td>${review.reviewID}</td>
                    <td>${review.bookID.bookID}"</td>
                    <td>${review.bookID.title}"</td>
                    <td>${review.accountID.accountID}"</td>
                    <td>${review.point}"</td>
                    <td><input class="input-content" id="name${review.reviewID}" value="${review.comment}"></td>
                    <td>
                        <button onclick="updateReview(${review.reviewID})">Update</button>
                        <button onclick="deleteReview(${review.reviewID})">Delete</button>
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

            function addNewReview() {
                var bookId = document.getElementById('newBookId').value;
                var accountId = document.getElementById('newAccountId').value;
                var point = document.getElementById('newPoint').value;
                var comment = document.getElementById('newComment').value;

                var reviewData = {
                    accountID: { accountID: accountId },
                    bookID: { bookID: bookId },
                    point: point,
                    comment: comment
                };

                fetch('/api/reviews/reviews', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(reviewData)
                })
                    .then(response => {
                        if(response.ok) {
                            return response.json();
                        } else {
                            throw new Error('Failed to create review');
                        }
                    })
                    .then(data => {
                        alert('Review added successfully!');
                        window.location.reload(); // Reload to update the list with the new review
                    })
                    .catch(error => {
                        alert('Error adding review: ' + error.message);
                        console.error('Error:', error);
                    });
            }

            function updateReview(id) {
                var Comment = document.getElementById('name' + id).value;
                console.log("towis day")
                fetch('/api/reviews/' + id, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ comment: Comment })
                })
                    .then(response => {
                        if (response.ok) {
                            alert('Update successful!');
                            window.location.reload();
                        } else {
                            alert('Error updating review');
                        }
                    })
                    .catch(error => {
                        alert('Error updating review: ' + error.message);
                        console.error('Error:', error);
                    });
            }

            function deleteReview(id) {
                if (confirm("Are you sure you want to delete this review?")) {
                    fetch('/api/reviews/' + id, {
                        method: 'DELETE'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert('Delete successful!');
                                window.location.reload();
                            } else {
                                alert('Error deleting review');
                            }
                        })
                        .catch(error => {
                            alert('Error deleting review: ' + error.message);
                            console.error('Error:', error);
                        });
                }
            }
        </script>
    </div>
</div>
</body>
</html>
