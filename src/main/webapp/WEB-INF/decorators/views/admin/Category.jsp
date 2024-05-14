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
<body>
<h1>Category Management</h1>


<form id="addCategoryForm" onsubmit="addNewCategory(); return false;">
    <input type="text" id="newCategoryId" placeholder="Enter new category ID" required>
    <input type="text" id="newCategoryName" placeholder="Enter new category name" required>
    <button type="submit">Add Category</button>
</form>

<table class="table-curd" border="1">
    <thead>
    <tr>
        <th>Category ID</th>
        <th>Category Name</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="category" items="${categories}">
        <tr>
            <td>${category.categoryID}</td>
            <td><input type="text" id="name${category.categoryID}" value="${category.categoryName}"></td>
            <td>
                <button onclick="updateCategory(${category.categoryID})">Update</button>
                <button onclick="deleteCategory(${category.categoryID})">Delete</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function addNewCategory() {
        var categoryId = document.getElementById('newCategoryId').value;
        var categoryName = document.getElementById('newCategoryName').value;

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
</body>
</html>
