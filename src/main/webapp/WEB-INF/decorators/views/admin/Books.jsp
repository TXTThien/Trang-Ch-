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
            <input class="input-content" style="width: 550px" type="text" id="newBookPrice" placeholder="Enter book price (VNĐ)" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookAvatar" placeholder="Enter book avatar URL" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="text" id="newBookAuthor" placeholder="Enter book author" required>
            <p style="margin-top: 8px"></p>
            <select class="input-content" style="width: 550px" id="newBookLanguage" required>
                <option value="Tiếng Anh">Tiếng Anh</option>
                <option value="Tiếng Việt">Tiếng Việt</option>
                <option value="Tiếng Nhật">Tiếng Nhật</option>
                <option value="Tiếng Trung">Tiếng Trung</option>
            </select>
            <p style="margin-top: 8px"></p>
            <select class="input-content" style="width: 550px" id="newBookAge" required>
                <option value="0">0+</option>
                <option value="3">3+</option>
                <option value="6">6+</option>
                <option value="12">12+</option>
                <option value="16">16+</option>
                <option value="18">18+</option>

            </select>            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookStock" placeholder="Enter book stock quantity" min="0" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookCategory" placeholder="Enter category ID" min="0" max="${categories.size()}" required>
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" type="number" id="newBookType" placeholder="Enter type ID" min="0" max="${types.size()}" required>
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
                    <td><input class="input-content" type="number" id="price${book.bookID}" value="${book.price}" min="0"></td>
                    <td><input class="input-content" id="avatar${book.bookID}" value="${book.avatar}"></td>
                    <td><input class="input-content" id="author${book.bookID}" value="${book.author}"></td>

                    <td>
                        <select class="input-content" id="language${book.bookID}">
                            <option value="Tiếng Anh" <c:if test="${book.language == 'Tiếng Anh'}">selected</c:if>>Tiếng Anh</option>
                            <option value="Tiếng Việt" <c:if test="${book.language == 'Tiếng Việt'}">selected</c:if>>Tiếng Việt</option>
                            <option value="Tiếng Trung" <c:if test="${book.language == 'Tiếng Trung'}">selected</c:if>>Tiếng Trung</option>
                            <option value="Tiếng Nhật" <c:if test="${book.language == 'Tiếng Nhật'}">selected</c:if>>Tiếng Nhật</option>
                        </select>
                    </td>
                    <td>
                        <select class="input-content" id="age${book.bookID}">
                            <option value="0" <c:if test="${book.age == '0'}">selected</c:if>>0+</option>
                            <option value="3" <c:if test="${book.age == '3'}">selected</c:if>>3+</option>
                            <option value="6" <c:if test="${book.age == '6'}">selected</c:if>>6+</option>
                            <option value="12" <c:if test="${book.age == '12'}">selected</c:if>>12+</option>
                            <option value="16" <c:if test="${book.age == '16'}">selected</c:if>>16+</option>
                            <option value="18" <c:if test="${book.age == '18'}">selected</c:if>>18+</option>

                        </select>
                    </td>
                    <td><input class="input-content" type="number" id="stock${book.bookID}" value="${book.stock}" min="0"></td>
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
                var title = document.getElementById('newBookTitle').value
                var content = document.getElementById('newBookContent').value
                var price = parseFloat(document.getElementById('newBookPrice').value)
                var avatar = document.getElementById('newBookAvatar').value
                var author =document.getElementById('newBookAuthor').value
                var language =document.getElementById('newBookLanguage').value
                var age =parseInt(document.getElementById('newBookAge').value)
                var stock =parseInt(document.getElementById('newBookStock').value)
                var category =parseInt(document.getElementById('newBookCategory').value)
                var typeID =parseInt(document.getElementById('newBookType').value)

                var bookData = {
                    title: title,
                    content: content,
                    price: price,
                    avatar: avatar,
                    author: author,
                    language: language,
                    age: age,
                    stock: stock,
                    category: category,
                    typeID: typeID
                };
                if (title.length<2)
                {
                    alert("Tên  sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (content.length<2)
                {
                    alert("Nội dung sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (avatar.length<2)
                {
                    alert("Avatar sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (author.length<2)
                {
                    alert("Tác giả sách phải có từ 2 ký tự trở lên");
                    return;
                }

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
                var title = document.getElementById('title' + id).value
                var content = document.getElementById('content' + id).value
                var price = parseFloat(document.getElementById('price' + id).value)
                var avatar = document.getElementById('avatar' + id).value
                var author =document.getElementById('author' + id).value
                var language =document.getElementById('language' + id).value
                var age =parseInt(document.getElementById('age' + id).value)
                var stock =parseInt(document.getElementById('stock' + id).value)

                var bookData = {
                    title: title,
                    content: content,
                    price: price,
                    avatar: avatar,
                    author: author,
                    language:language ,
                    age: age,
                    stock: stock,

                };
                if (title.length<2)
                {
                    alert("Tên sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (content.length<2)
                {
                    alert("Nội dung sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (price<=0)
                {
                    alert("Giá sách phải lớn hơn 0VNĐ");
                    return;
                }
                if (avatar.length<2)
                {
                    alert("Avatar sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (author.length<2)
                {
                    alert("Tác giả sách phải có từ 2 ký tự trở lên");
                    return;
                }
                if (stock<0)
                {
                    alert("Tồn kho sách phải từ 0 trở lên");
                    return;
                }

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
