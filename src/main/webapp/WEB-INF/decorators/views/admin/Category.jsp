<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<!--
http://localhost:8080/api/categories/admin/category
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
        <h3 class="logo">Category Management</h3>
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

                <div class="nav-option option1">
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


        <form id="addCategoryForm" onsubmit="addNewCategory(); return false;">

            <input class="input-content" style="width: 550px; display: none" id="newCategoryId" value="" readonly >
            <p style="margin-top: 8px"></p>
            <input class="input-content" style="width: 550px" id="newCategoryName" placeholder="Enter new category name" required>
            <p style="margin-top: 8px"></p>
            <button class="button-submit" type="submit">Add Category</button>
        </form>

        <table class="table-curd" id="categoryTable">
            <thead>
            <tr>
                <th style="width: 200px ">Category ID</th>
                <th>Category Name</th>
                <th style="width: 150px">Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="category" items="${categories}">
                <tr>
                    <td style="font-size: 16px">${category.categoryID}</td>
                    <td><input class="input-content" style="font-size: 14px" id="name${category.categoryID}" value="${category.categoryName}"></td>
                    <td>
                        <button onclick="updateCategory(${category.categoryID})">Update</button>
                        <button onclick="deleteCategory(${category.categoryID})">Delete</button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>

        <script>
            document.addEventListener('DOMContentLoaded', (event) => {
                const categoryTable = document.getElementById('categoryTable');
                const newCategoryIdInput = document.getElementById('newCategoryId');
                let maxCategoryId = 0;

                if (categoryTable) {
                    const rows = categoryTable.getElementsByTagName('tbody')[0].getElementsByTagName('tr');
                    for (let row of rows) {
                        const categoryId = parseInt(row.cells[0].textContent);
                        if (!isNaN(categoryId) && categoryId > maxCategoryId) {
                            maxCategoryId = categoryId;
                        }
                    }
                }

                newCategoryIdInput.value = maxCategoryId + 1;
                newCategoryIdInput.disabled = true; // Lock the input field
            });

            let menuicn = document.querySelector(".menuicn");
            let nav = document.querySelector(".navcontainer");

            menuicn.addEventListener("click", () => {
                nav.classList.toggle("navclose");
            });
            function addNewCategory() {
                var categoryId = document.getElementById('newCategoryId').value;
                var categoryName = document.getElementById('newCategoryName').value;

                if (categoryName.trim().length < 2) {
                    alert('Category Name phải có từ 2 ký tự trở lên');
                    return;
                }

                var categoryData = {
                    categoryID: categoryId,
                    categoryName: categoryName
                };

                fetch('/api/categories/categories', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify(categoryData)
                })
                    .then(response => {
                        if(response.ok) {
                            return response.json();
                        } else {
                            throw new Error('Failed to create category');
                        }
                    })
                    .then(data => {
                        alert('Category added successfully!');
                        window.location.reload(); // Reload to update the list with the new category
                    })
                    .catch(error => {
                        alert('Error adding category: ' + error.message);
                        console.error('Error:', error);
                    });
            }

            function updateCategory(id) {
                var newName = document.getElementById('name' + id).value;

                if (newName.trim().length < 2) {
                    alert('Category Name phải có từ 2 ký tự trở lên');
                    return;
                }

                fetch('/api/categories/' + id, {
                    method: 'PUT',
                    headers: {
                        'Content-Type': 'application/json'
                    },
                    body: JSON.stringify({ categoryName: newName })
                })
                    .then(response => {
                        if (response.ok) {
                            alert('Update successful!');
                            window.location.reload();
                        } else {
                            alert('Error updating category');
                        }
                    })
                    .catch(error => {
                        alert('Error updating category: ' + error.message);
                        console.error('Error:', error);
                    });
            }

            function deleteCategory(id) {
                if (confirm("Are you sure you want to delete this category?")) {
                    fetch('/api/categories/' + id, {
                        method: 'DELETE'
                    })
                        .then(response => {
                            if (response.ok) {
                                alert('Delete successful!');
                                window.location.reload();
                            } else {
                                alert('Error deleting category');
                            }
                        })
                        .catch(error => {
                            alert('Error deleting category: ' + error.message);
                            console.error('Error:', error);
                        });
                }
            }
        </script>

    </div>
</div>
</body>
</html>
