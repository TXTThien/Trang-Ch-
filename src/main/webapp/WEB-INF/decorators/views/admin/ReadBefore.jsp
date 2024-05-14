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


<form id="addCategoryForm" onsubmit="addNewRead(); return false;">
  <input type="number" id="newBookId" placeholder="Enter new Book ID " required>
  <input type="text" id="newImageLink" placeholder="Enter new Image Link  " required>

  <button type="submit">Add ReadBefore</button>
</form>

<table class="table-curd" border="1">
  <thead>
  <tr>
    <th>ReadBefore ID</th>
    <th>Book ID</th>
    <th>Image Link</th>


    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="readbefore" items="${readbefores}">
    <tr>
      <td>${readbefore.readID}</td>
      <td><input type="text" id="book${readbefore.readID}" value="${readbefore.bookID.bookID}"></td>
      <td><input type="text" id="link${readbefore.readID}" value="${readbefore.imageLink}"></td>

      <td>
        <button onclick="updateRead(${readbefore.readID})">Update</button>
        <button onclick="deleteRead(${readbefore.readID})">Delete</button>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script>
  function addNewRead() {
    var bookId = document.getElementById('newBookId').value;
    var imageLink = document.getElementById('newImageLink').value;

    var reviewData = {
      bookID: { bookID: bookId },
      imageLink: imageLink
    };

    fetch('/api/reads/reads', {
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
                throw new Error('Failed to create readbefore');
              }
            })
            .then(data => {
              alert('readbefore added successfully!');
              window.location.reload(); // Reload to update the list with the new review
            })
            .catch(error => {
              alert('Error adding readbefore: ' + error.message);
              console.error('Error:', error);
            });
  }

  function updateRead(id) {
    var BookId = document.getElementById('book' + id).value;
    var ImageLink = document.getElementById('link' + id).value;

    fetch('/api/reads/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({       bookID: { bookID: BookId },
        imageLink: ImageLink })
    })
            .then(response => {
              if (response.ok) {
                alert('Update successful!');
                window.location.reload();
              } else {
                alert('Error updating readbefore');
              }
            })
            .catch(error => {
              alert('Error updating readbefore: ' + error.message);
              console.error('Error:', error);
            });
  }

  function deleteRead(id) {
    if (confirm("Are you sure you want to delete this readbefore?")) {
      fetch('/api/reads/' + id, {
        method: 'DELETE'
      })
              .then(response => {
                if (response.ok) {
                  alert('Delete successful!');
                  window.location.reload();
                } else {
                  alert('Error deleting readbefore');
                }
              })
              .catch(error => {
                alert('Error deleting readbefore: ' + error.message);
                console.error('Error:', error);
              });
    }
  }
</script>
</body>
</html>
