<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Book Management</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>

<header>
    <div class="logosec">
        <a href="/DashBoard" style="text-decoration: none"><div class="logo">Admin</div></a>
        <img src="/resources/static/assets/image/menu.png" class="icn menuicn" id="menuicn" alt="menu-icon">
    </div>

    <div>
        <h3 class="logo">Books Management</h3>
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
                <div class="nav-option option6">
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

                <div class="nav-option option1">
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


        <form id="addBookForm" onsubmit="addNewBook(); return false;">
            <input class="input-content" style="width: 550px" type="text" id="newBookTitle" placeholder="Enter new book title" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookContent" placeholder="Enter book content" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookPrice" placeholder="Enter book price" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookAvatar" placeholder="Enter book avatar URL" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookAuthor" placeholder="Enter book author" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookLanguage" placeholder="Enter book language" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookAge" placeholder="Enter book age recommendation" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookStock" placeholder="Enter book stock quantity" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookCategory" placeholder="Enter category ID" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookType" placeholder="Enter type ID" required>
            <p style="margin-top: 8px"></p>
            <button class="button-submit" type="submit">Add Book</button>
        </form>

        <table class="table-curd" border="1">
            <thead>
            <tr style="font-size: 13px">
                <th>Book ID</th>
                <th>Title</th>
                <th>Content</th>
                <th style="width: 105px">Price</th>
                <th>Avatar</th>
                <th>Author</th>
                <th style="width: 105px">Language</th>
                <th style="width: 75px">Age</th>
                <th style="width: 75px">Stock</th>
                <th style="width: 35px">Category ID</th>
                <th style="width: 35px">Type ID</th>
                <th style="width: 35px">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="book" items="${books}">
                <tr>
                    <td>${book.bookID}</td>
                    <td><input class="input-content" id="title${book.bookID}" value="${book.title}"></td>
                    <td><input class="input-content" id="content${book.bookID}" value="${book.content}"></td>
                    <td><input class="input-content" type="number" id="price${book.bookID}" value="${book.price}"></td>
                    <td><input class="input-content" id="avatar${book.bookID}" value="${book.avatar}"></td>
                    <td><input class="input-content" id="author${book.bookID}" value="${book.author}"></td>
                    <td><input class="input-content" id="language${book.bookID}" value="${book.language}"></td>
                    <td><input class="input-content" type="number" id="age${book.bookID}" value="${book.age}"></td>
                    <td><input class="input-content" type="number" id="stock${book.bookID}" value="${book.stock}"></td>
                    <td>${book.category.categoryID}</td>
                    <td>${book.typeID.typeID}</td>
                    <td>
                        <button onclick="updateBook(${book.bookID})">Update</button>
                        <button onclick="deleteBook(${book.bookID})">Delete</button>
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


            function addNewBook() {
                var bookData = {
                    title: document.getElementById('newBookTitle').value,
                    content: document.getElementById('newBookContent').value,
                    price: parseFloat(document.getElementById('newBookPrice').value),
                    avatar: document.getElementById('newBookAvatar').value,
                    author: document.getElementById('newBookAuthor').value,
                    language: document.getElementById('newBookLanguage').value,
                    age: parseInt(document.getElementById('newBookAge').value),
                    stock: parseInt(document.getElementById('newBookStock').value),
                    category: { categoryID: parseInt(document.getElementById('newBookCategory').value) },
                    typeID: { typeID: parseInt(document.getElementById('newBookType').value) }
                };

                fetch('/api/books/books', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(bookData)
                })
                alert('Book added successfully!');
                window.location.reload();
            }

            function updateBook(id) {
                var bookData = {
                    title: document.getElementById('title' + id).value,
                    content: document.getElementById('content' + id).value,
                    price: parseFloat(document.getElementById('price' + id).value),
                    avatar: document.getElementById('avatar' + id).value,
                    author: document.getElementById('author' + id).value,
                    language: document.getElementById('language' + id).value,
                    age: parseInt(document.getElementById('age' + id).value),
                    stock: parseInt(document.getElementById('stock' + id).value),

                };

                fetch('/api/books/' + id, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(bookData)
                })
                alert("Success")
                window.location.reload();

            }

            function deleteBook(id) {
                if (confirm("Are you sure you want to delete this book?")) {
                    fetch('/api/books/' + id, {
                        method: 'DELETE'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert('Delete successful!');
                                window.location.reload();
                            } else {
                                alert('Error deleting book');
                            }
                        })
                        .catch(error => {
                            alert('Error deleting book: ' + error.message);
                            console.error('Error:', error);
                        });
                }
            }
        </script>

    </div>
</div>
</body>
</html>
