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


<form id="addCategoryForm" onsubmit="addNewType(); return false;">
  <input type="text" id="newTypeName" placeholder="Enter new Type Name" required>
  <input type="number" id="newPrice" placeholder="Enter new Price" required>
  <button type="submit">Add Type</button>
</form>


<table class="table-curd" border="1">
  <thead>
  <tr>
    <th>Type ID</th>
    <th>Type Name</th>
    <th>Price</th>

    <th class="actions">Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="type" items="${types}">
    <tr>
      <td>${type.typeID}</td>
      <td><input type="text" id="name${type.typeID}" value="${type.typeName}"></td>
      <td><input type="number" id="price${type.typeID}" value="${type.price}"></td>

      <td>
        <button onclick="updateType(${type.typeID})">Update</button>
        <button onclick="deleteType(${type.typeID})">Delete</button>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script>
  function addNewType() {
    var TypeName = document.getElementById('newTypeName').value;
    var Price = document.getElementById('newPrice').value;

    var typeData = {
      typeName: TypeName,  // Ensure the field names match the entity properties
      price: parseFloat(Price)
    };

    fetch('/api/types/types', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(typeData)
    })
            .then(response => {
              if(response.ok) {
                return response.json();
              } else {
                throw new Error('Failed to create type');
              }
            })
            .then(data => {
              alert('Type added successfully!');
              window.location.reload(); // Reload to update the list with the new review
            })
            .catch(error => {
              alert('Error adding type: ' + error.message);
              console.error('Error:', error);
            });
  }


  function updateType(id) {
    var TypeName = document.getElementById('name' + id).value;
    var Price = document.getElementById('price' + id).value;

    fetch('/api/types/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({ typeName: TypeName, price: parseFloat(Price) })
    })
            .then(response => {
              if (response.ok) {
                alert('Update successful!');
                window.location.reload();
              } else {
                alert('Error updating type');
              }
            })
            .catch(error => {
              alert('Error updating type: ' + error.message);
              console.error('Error:', error);
            });
  }


  function deleteType(id) {
    if (confirm("Are you sure you want to delete this type?")) {
      fetch('/api/types/' + id, {
        method: 'DELETE'
      })
              .then(response => {
                if (response.ok) {
                  alert('Delete successful!');
                  window.location.reload();
                } else {
                  alert('Error deleting type');
                }
              })
              .catch(error => {
                alert('Error deleting type: ' + error.message);
                console.error('Error:', error);
              });
    }
  }
</script>
</body>
</html>
