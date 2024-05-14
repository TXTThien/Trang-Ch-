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


<form id="addCategoryForm" onsubmit="addNewBanner(); return false;">
  <input type="text" id="newBannerImage" placeholder="Enter new Banner Image" required>
  <input type="text" id="newBannerType" placeholder="Enter new Banner Type" required>
  <input type="number" id="newIDBookOrCate" placeholder="Enter new IDBook Or IDCate" required>
  <button type="submit">Add Banner</button>
</form>



<table class="table-curd" border="1">
  <thead>
  <tr>
    <th>Banner ID</th>
    <th>Banner Image</th>
    <th>Banner Type</th>
    <th>IDBook Or IDCate</th>
    <th>Actions</th>
  </tr>
  </thead>
  <tbody>
  <c:forEach var="banner" items="${banners}">
    <tr>
      <td>${banner.bannerID}</td>
      <td><input type="text" id="img${banner.bannerID}" value="${banner.bannerImage}"></td>
      <td><input type="text" id="type${banner.bannerID}" value="${banner.bannerType}"></td>
      <td><input type="number" id="id${banner.bannerID}" value="${banner.idbookorcate}"></td>

      <td>
        <button onclick="updateBanner(${banner.bannerID})">Update</button>
        <button onclick="deleteBanner(${banner.bannerID})">Delete</button>
      </td>
    </tr>
  </c:forEach>
  </tbody>
</table>

<script>
  function addNewBanner() {
    var BannerImage = document.getElementById('newBannerImage').value;
    var BannerType = document.getElementById('newBannerType').value;
    var IDBookCate = document.getElementById('newIDBookOrCate').value;

    var bannerData = {
      bannerImage: BannerImage,  // Ensure the field names match the entity properties
      bannerType: BannerType,
      idbookorcate: parseInt(IDBookCate)
    };

    fetch('/api/banners', {  // Correct the URL to match backend mapping
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(bannerData)
    })
            .then(response => {
              if(response.ok) {
                return response.json();
              } else {
                throw new Error('Failed to create banner');
              }
            })
            .then(data => {
              alert('Banner added successfully!');
              window.location.reload(); // Reload to update the list with the new banner
            })
            .catch(error => {
              alert('Error adding banner: ' + error.message);
              console.error('Error:', error);
            });
  }


  function updateBanner(id) {
    var BannerImage = document.getElementById('img' + id).value;
    var BannerType = document.getElementById('type' + id).value;
    var IDBookCate = document.getElementById('id' + id).value;

    fetch('/api/banners/' + id, {
      method: 'PUT',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        bannerImage: BannerImage,
        bannerType: BannerType,
        idbookorcate: parseInt(IDBookCate)
      })
    })
            .then(response => {
              if (response.ok) {
                alert('Update successful!');
                window.location.reload();
              } else {
                alert('Error updating banner');
              }
            })
            .catch(error => {
              alert('Error updating banner: ' + error.message);
              console.error('Error:', error);
            });
  }


  function deleteBanner(id) {
    if (confirm("Are you sure you want to delete this Banner?")) {
      fetch('/api/banners/' + id, {
        method: 'DELETE'
      })
              .then(response => {
                if (response.ok) {
                  alert('Delete successful!');
                  window.location.reload();
                } else {
                  alert('Error deleting Banner');
                }
              })
              .catch(error => {
                alert('Error deleting Banner: ' + error.message);
                console.error('Error:', error);
              });
    }
  }
</script>
</body>
</html>
