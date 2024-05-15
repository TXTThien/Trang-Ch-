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
    <h3 class="logo">ReadBefore Management</h3>
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

        <div class="nav-option option10">
          <img
                  src="/resources/static/assets/image/file.png"
                  class="nav-img"
                  alt="category"
          />
          <h3>
            <a class="link" href="/api/categories/admin/category">category</a>
          </h3>
        </div>

        <div class="nav-option option1">
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


    <form id="addCategoryForm" onsubmit="addNewRead(); return false;">
      <input class="input-content" style="width: 600px" type="number" id="newBookId" placeholder="Enter new Book ID " required>
      <p style="margin-top: 8px"></p>
      <input class="input-content" style="width: 600px" type="text" id="newImageLink" placeholder="Enter new Image Link  " required>
      <p style="margin-top: 8px"></p>
      <button class="button-submit" type="submit">Add ReadBefore</button>
    </form>

    <table class="table-curd" >
      <thead>
      <tr>
        <th style="width: 100px">ReadBefore ID</th>
        <th style="width: 180px">Book ID</th>
        <th>Image Link</th>
        <th class="actions">Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="readbefore" items="${readbefores}">
        <tr>
          <td>${readbefore.readID}</td>
          <td><input class="input-content" id="book${readbefore.readID}" value="${readbefore.bookID.bookID}"></td>
          <td><input class="input-content" id="link${readbefore.readID}" value="${readbefore.imageLink}"></td>
          <td>
            <button onclick="updateRead(${readbefore.readID})">Update</button>
            <button onclick="deleteRead(${readbefore.readID})">Delete</button>
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

  </div>
</div>
</body>
</html>
