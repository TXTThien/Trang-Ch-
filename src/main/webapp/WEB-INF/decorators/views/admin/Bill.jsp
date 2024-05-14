<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<!--
http://localhost:8080/api/bills/admin/bill
-->
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Bill Management</title>
  <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
  <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>
<body>
<h1>Bill Management</h1>



<table class="table-curd" border="1">
  <thead>
  <tr>
    <th>Bill ID</th>
    <th>Account ID</th>
    <th>Paid</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="bill" items="${bills}">
    <tr>
      <td>${bill.billID}</td>
      <td>${bill.accountID.accountID}</td>
      <td><input type="checkbox" id="paid${bill.billID}" ${bill.paid ? 'checked' : ''}></td>
      <td>
        <button onclick="updateBill(${bill.billID})">Update</button>
        <!-- <button onclick="deleteBill(${bill.billID})">Delete</button> -->
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script>



  function updateBill(id) {
    var paidStatus = document.getElementById('paid' + id).checked;
    fetch('/api/bills/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ paid: paidStatus })
    })
            .then(response => {
              if (response.ok) {
                alert('Update successful!');
                window.location.reload();
              } else {
                alert('Error updating bill');
              }
            })
            .catch(error => {
              alert('Error updating bill: ' + error.message);
              console.error('Error:', error);
            });
  }

  function deleteBill(id) {
    if (confirm("Are you sure you want to delete this bill?")) {
      fetch('/api/bills/' + id, {
        method: 'DELETE'
      })
              .then(response => {
                if (response.ok) {
                  alert('Delete successful!');
                  window.location.reload();
                } else {
                  alert('Error deleting bill');
                }
              })
              .catch(error => {
                alert('Error deleting bill: ' + error.message);
                console.error('Error:', error);
              });
    }
  }
</script>
</body>
</html>
