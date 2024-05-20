<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Account Management</title>
  <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>
<body>
<header>
  <div class="logosec">
    <a href="/DashBoard" style="text-decoration: none"><div class="logo">Admin</div></a>
    <img src="/resources/static/assets/image/menu.png" class="icn menuicn" id="menuicn" alt="menu-icon">
  </div>

  <div>
    <h3 class="logo">Account Management</h3>
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
        <div class="nav-option option1">
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

    <table class="table-curd" >
      <thead>
      <tr>
        <th class="content-id" >Account ID</th>
        <th>Username</th>
        <th>Name</th>
        <th>Phone Number</th>
        <th>Address</th>
        <th>Role</th>
        <th>Actions</th>
      </tr>
      </thead>
      <tbody>
      <c:forEach var="account" items="${accounts}">
        <tr>
          <td>${account.accountID}</td>
          <td>${account.username}</td>
          <td><input class="input-content" id="name${account.accountID}" value="${account.name}"></td>
          <td><input class="input-content" id="phoneNumber${account.accountID}" value="${account.phoneNumber}"></td>
          <td><input class="input-content" id="address${account.accountID}" value="${account.address}"></td>
          <td>
            <select class="input-content" id="role${account.accountID}">
              <option value="ADMIN" <c:if test="${account.role == 'ADMIN'}">selected</c:if>>ADMIN</option>
              <option value="USER" <c:if test="${account.role == 'USER'}">selected</c:if>>USER</option>
            </select>
          </td>
          <td>
            <button onclick="updateAccount(${account.accountID})">Update</button>
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

      function updateAccount(id) {
        var newName = document.getElementById('name' + id).value;
        var newPhoneNumber = document.getElementById('phoneNumber' + id).value;
        var newAddress = document.getElementById('address' + id).value;
        var newRole = document.getElementById('role' + id).value;

        if (newName.trim().length < 2) {
          alert("Username phải có từ 2 ký tự trở lên");
          return;
        }
        if (newAddress.trim().length < 2) {
          alert("Địa chỉ phải có từ 2 ký tự trở lên");
          return;
        }
        if (newPhoneNumber.trim().length < 8 || newPhoneNumber.trim().length > 10) {
          alert("số điện thoại phải có từ 8 đến 10 ký tự");
          return;
        }
        fetch('/api/admin-accounts/' + id, {
          method: 'PUT',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            name: newName,
            phoneNumber: newPhoneNumber,
            address: newAddress,
            role: newRole
          })
        })
                .then(response => {
                  if (response.ok) {
                    alert('Update successful!');
                    window.location.reload();
                  } else {
                    alert('Error updating account');
                  }
                })
                .catch(error => {
                  alert('Error updating account: ' + error.message);
                  console.error('Error:', error);
                });
      }
    </script>
  </div>
</div>
</body>
</html>
