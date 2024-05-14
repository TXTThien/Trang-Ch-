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
<body>


<form id="addCategoryForm" onsubmit="addNewReview(); return false;">
    <input type="number" id="newBookId" placeholder="Enter new Book ID " required>
    <input type="number" id="newAccountId" placeholder="Enter new Account ID " required>
    <input type="number" id="newPoint" placeholder="Enter new Point " required>
    <input type="text" id="newComment" placeholder="Enter new Comment " required>
    <button type="submit">Add Review</button>
</form>

<table class="table-curd" border="1">
    <thead>
    <tr>
        <th>Review ID</th>
        <th>Book ID</th>
        <th>Book Tittle</th>

        <th>Account ID</th>
        <th>Point</th>
        <th>Comment</th>

        <th>Actions</th>
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
            <td><input type="text" id="name${review.reviewID}" value="${review.comment}"></td>
            <td>
                <button onclick="updateReview(${review.reviewID})">Update</button>
                <button onclick="deleteReview(${review.reviewID})">Delete</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
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
</body>
</html>
