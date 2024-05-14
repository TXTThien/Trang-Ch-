<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin BillInfo Management</title>
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/style.css'/>">
    <link rel="stylesheet" href="<c:url value='/resources/static/css/admin/responsive.css'/>">
</head>
<body>
<h1>BillInfo Management</h1>
<!--
http://localhost:8080/api/admin-billinfos/admin/billinfo


<form id="addBillInfoForm" onsubmit="addNewBillInfo(); return false;">
    <input type="text" id="newBillID" placeholder="Enter Bill ID" required>
    <input type="text" id="newBookID" placeholder="Enter Book ID" required>
    <input type="number" id="newNumber" placeholder="Enter Number" required>
    <button type="submit">Add BillInfo</button>
</form>
-->
<table class="table-curd" border="1">
    <thead>
    <tr>
        <th>BillInfo ID</th>
        <th>Bill ID</th>
        <th>Book ID</th>
        <th>Number</th>
        <th>Actions</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="billInfo" items="${billInfos}">
        <tr>
            <td>${billInfo.billInfoID}</td>
            <td>${billInfo.billID.billID}</td>
            <td><input type="text" id="bookID${billInfo.billInfoID}" value="${billInfo.bookid.bookID}"></td>
            <td><input type="number" id="number${billInfo.billInfoID}" value="${billInfo.number}"></td>
            <td>
                <button onclick="updateBillInfo(${billInfo.billInfoID})">Update</button>
                <button onclick="deleteBillInfo(${billInfo.billInfoID})">Delete</button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>

<script>
    function addNewBillInfo() {
        var billID = document.getElementById('newBillID').value;
        var bookID = document.getElementById('newBookID').value;
        var number = document.getElementById('newNumber').value;

        if (!billID) {
            alert('Please enter a valid Bill ID');
            return;
        }

        var billInfoData = {
            billID: { billID: billID },
            bookid: { bookID: bookID },
            number: number
        };

        fetch('/api/admin-billinfos', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify(billInfoData)
        })
            .then(response => {
                if (response.ok) {
                    return response.json();
                } else {
                    throw new Error('Failed to create billInfo');
                }
            })
            .then(data => {
                alert('BillInfo added successfully!');
                window.location.reload();
            })
            .catch(error => {
                alert('Error adding billInfo: ' + error.message);
                console.error('Error:', error);
            });
    }


    function updateBillInfo(id) {
        var newBookID = document.getElementById('bookID' + id).value;
        var newNumber = document.getElementById('number' + id).value;

        fetch('/api/admin-billinfos/' + id, {
            method: 'PUT',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                bookid: { bookID: newBookID },
                number: newNumber
            })
        })
            .then(response => {
                if (response.ok) {
                    alert('Update successful!');
                    window.location.reload();
                } else {
                    alert('Error updating billInfo');
                }
            })
            .catch(error => {
                alert('Error updating billInfo: ' + error.message);
                console.error('Error:', error);
            });
    }

    function deleteBillInfo(id) {
        if (confirm("Are you sure you want to delete this billInfo?")) {
            fetch('/api/admin-billinfos/' + id, {
                method: 'DELETE'
            })
                .then(response => {
                    if (response.ok) {
                        alert('Delete successful!');
                        window.location.reload();
                    } else {
                        alert('Error deleting billInfo');
                    }
                })
                .catch(error => {
                    alert('Error deleting billInfo: ' + error.message);
                    console.error('Error:', error);
                });
        }
    }
</script>
</body>
</html>
