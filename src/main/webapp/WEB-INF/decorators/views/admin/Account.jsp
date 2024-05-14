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
<h1>Account Management</h1>

<table class="table-curd" border="1">
  <thead>
  <tr>
    <th>Account ID</th>
    <th>Username</th>
    <th>Name</th>
    <th>Phone Number</th>
    <th>Address</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="account" items="${accounts}">
    <tr>
      <td>${account.accountID}</td>
      <td>${account.username}</td>
      <td><input type="text" id="name${account.accountID}" value="${account.name}"></td>
      <td><input type="text" id="phoneNumber${account.accountID}" value="${account.phoneNumber}"></td>
      <td><input type="text" id="address${account.accountID}" value="${account.address}"></td>
      <td>
        <button onclick="updateAccount(${account.accountID})">Update</button>
<%--        <button onclick="deleteAccount(${account.accountID})">Delete</button>--%>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script>
  function updateAccount(id) {
    var newName = document.getElementById('name' + id).value;
    var newPhoneNumber = document.getElementById('phoneNumber' + id).value;
    var newAddress = document.getElementById('address' + id).value;

    fetch('/api/admin-accounts/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        name: newName,
        phoneNumber: newPhoneNumber,
        address: newAddress
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

  function deleteAccount(id) {
    if (confirm("Are you sure you want to delete this account?")) {
      fetch('/api/admin-accounts/' + id, {
        method: 'DELETE'
      })
              .then(response => {
                if (response.ok) {
                  alert('Delete successful!');
                  window.location.reload();
                } else {
                  alert('Error deleting account');
                }
              })
              .catch(error => {
                alert('Error deleting account: ' + error.message);
                console.error('Error:', error);
              });
    }
  }
</script>
</body>
</html>

<<!--
http://localhost:8080/api/admin-accounts/admin/account
-->