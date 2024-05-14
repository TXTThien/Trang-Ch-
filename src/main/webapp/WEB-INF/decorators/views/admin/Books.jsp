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
<body>
<h1>Book Management</h1>

<form id="addBookForm" onsubmit="addNewBook(); return false;">
    <input type="text" id="newBookTitle" placeholder="Enter new book title" required>
    <input type="text" id="newBookContent" placeholder="Enter book content" required>
    <input type="text" id="newBookPrice" placeholder="Enter book price" required>
    <input type="text" id="newBookAvatar" placeholder="Enter book avatar URL" required>
    <input type="text" id="newBookAuthor" placeholder="Enter book author" required>
    <input type="text" id="newBookLanguage" placeholder="Enter book language" required>
    <input type="number" id="newBookAge" placeholder="Enter book age recommendation" required>
    <input type="number" id="newBookStock" placeholder="Enter book stock quantity" required>
    <input type="number" id="newBookCategory" placeholder="Enter category ID" required>
    <input type="number" id="newBookType" placeholder="Enter type ID" required>
    <button type="submit">Add Book</button>
</form>

<table class="table-curd" border="1">
    <thead>
    <tr>
        <th>Book ID</th>
        <th>Title</th>
        <th>Content</th>
        <th>Price</th>
        <th>Avatar</th>
        <th>Author</th>
        <th>Language</th>
        <th>Age</th>
        <th>Stock</th>
        <th>Category ID</th>
        <th>Type ID</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="book" items="${books}">
        <tr>
            <td>${book.bookID}</td>
            <td><input type="text" id="title${book.bookID}" value="${book.title}"></td>
            <td><input type="text" id="content${book.bookID}" value="${book.content}"></td>
            <td><input type="number" id="price${book.bookID}" value="${book.price}"></td>
            <td><input type="text" id="avatar${book.bookID}" value="${book.avatar}"></td>
            <td><input type="text" id="author${book.bookID}" value="${book.author}"></td>
            <td><input type="text" id="language${book.bookID}" value="${book.language}"></td>
            <td><input type="number" id="age${book.bookID}" value="${book.age}"></td>
            <td><input type="number" id="stock${book.bookID}" value="${book.stock}"></td>
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
</body>
</html>
