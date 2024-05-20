<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!doctype html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Neuton">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Quicksand">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=FontAwesome">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Quicksand:wght@400;700&display=swap">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css"
          integrity="sha512-tS3S5qG0BlhnQROyJXvNjeEM4UpMXHrQfTGmbQ1gKmelCxlSEBUaxhRBj/EFTzpbP4RVSrpEikbmdJobCvhE3g=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css"
          integrity="sha512-sMXtMNL1zRzolHYKEujM2AqCLUR9F2C4/05cdbxjjLSRvMQIciEPCQZo++nk7go3BtSuK9kfa/s+a4f4i5pLkw=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
          integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
          crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="/resources/static/css/auth/signup.css">
</head>

<body>

<article>
    <div class="containerlayout">
        <div class="containerregister">
            <div class="form-container">
                <h2 class="textregister">Đăng Ký</h2>

                <sf:form action="/register/save" method="post" modelAttribute="user">
                    <div class="form-group">
                        <label for="name">Họ và tên</label>
                        <sf:input type="text" id="name" name="name" path="name" />
                        <sf:errors path="name" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label for="username">Tên đăng nhập</label>
                        <sf:input type="text" id="username" name="username" path="username" />
                        <sf:errors path="username" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label for="phone">Số điện thoại</label>
                        <sf:input type="text" id="phone" name="phone" path="phoneNumber" />
                        <sf:errors path="phoneNumber" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label for="address">Địa chỉ</label>
                        <sf:input type="text" id="address" name="address" path="address" />
                        <sf:errors path="address" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label for="email">Email</label>
                        <sf:input type="email" id="email" name="email" path="email" />
                        <sf:errors path="email" cssClass="error" />
                    </div>
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <sf:input type="password" id="password" name="password" path="password" />
                        <sf:errors path="password"  />
                    </div>
                    <div class="form-group">
                        <button type="submit">ĐĂNG KÝ</button>
                    </div>
                </sf:form>
                <div class="form-group">
                    <p style="font-style: italic">Bạn đã có tài khoản? <a href="/login">Đăng nhập ngay</a></p>
                </div>
            </div>
        </div>
    </div>
</article>

<script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script>
    $(document).ready(function () {
        $('form').submit(function (event) {
            var phoneNumber = $('#phone').val();
            var password = $('#password').val();
            var email = $('#email').val();
            var username = $('#username').val();
            var isValid = true;

            if (phoneNumber.length < 8 || phoneNumber.length>10 || isNaN(phoneNumber)) {
                alert("Số điện thoại phải có từ 8 đến 10 chữ số.");
                isValid = false;
            }

            if (password.length < 8) {
                alert("Mật khẩu phải có ít nhất 8 ký tự.");
                isValid = false;
            }

            if (!email.includes('@')) {
                alert("Email phải bao gồm '@'.");
                isValid = false;
            }

            if (!isValid) {
                event.preventDefault();
            }

            if (isValid && username !== '') {
                $.ajax({
                    url: '/checkUsername',
                    type: 'GET',
                    data: { username: username },
                    async: false,
                    success: function (response) {
                        if (response) {
                            alert("Email đã tồn tại. Vui lòng chọn tên khác.");
                            $('#username').val('');
                            isValid = false;
                        }
                    }
                });
            }
            if (isValid && email !== '') {
                $.ajax({
                    url: '/checkEmail',
                    type: 'GET',
                    data: { email: email },
                    async: false,
                    success: function (response) {
                        if (response) {
                            alert("Email đã tồn tại. Vui lòng chọn email khác.");
                            $('#email').val('');
                            isValid = false;
                        }
                    }
                });
            }
            if (!isValid) {
                event.preventDefault();
            }
        });
    });
</script>


</body>
</html>
