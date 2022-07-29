<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modal.Question"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<!--
To change this license header, choose License Headers in Project Properties.
To change this template file, choose Tools | Templates
and open the template in the editor.
-->
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="library/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <script src="library/bootstrap.min.js" type="text/javascript"></script>
        <link href="resource/css/login.css" rel="stylesheet" type="text/css"/>
        <link href="resource/css/login1.css" rel="stylesheet" type="text/css"/>
        <script src="library/jquery.min.js" type="text/javascript"></script>
        <link href="resource/css/forgetpassword.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>

        <div class="Logo" id="logo">
            <img src="resource/img/logo-removebg-preview.png" alt="" style="width: 340px; height: 175px;">
        </div>
        <div id="content">
            <div class="login-box" id="login">
                <form action="Login" method="POST" class="row g-3 needs-validation" novalidate>
                    <h2 style="color: White">Welcome!</h2>
                    <input type="hidden" name="typeOfAccount" value="1">
                    <div class="user-box">
                        <input type="text" name="username" id="validationCustom01" required="">
                        <label class="form-label" for="validationCustom01">Username</label>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>

                    <div class="user-box">
                        <input type="password" name="password" id="validationCustom01" required="">
                        <label class="form-label" for="validationCustom01">Password</label>
                        <p class="text-danger" >${message}</p>
                        <div class="invalid-feedback">
                            Cannot be blank!
                        </div>
                    </div>

                    <div class="remember-box">
                        <input type="checkbox" name="remember">
                        <label>Remember me!</label>
                    </div>

                    <div style="text-align: center">
                        <button>
                            <span></span>
                            <span></span>
                            <span></span>
                            <span></span>
                            Sign In
                        </button>
                    </div>
                </form>

                <div class="forget-password" style="text-align: center">
                    <a style="color: white; border: none; background: transparent" id="btn_forget" type="button">Forget Password?</a>
                </div>

                <div style="text-align: center">
                    <p style="color: white;">-------------------------------------------</p>
                </div>
               
                <div class="forget-password" style="text-align: center">
                    <a style="color: white; border: none; background: transparent" id="btn3" type="button">Forget Password?</a>
                </div>

                <button id="btn" style="color: white; margin-left: 40px; background: #3AAA23; margin-bottom: 5px; border-radius: 5px; border: none; width: 240px; height: 40px">Create Your Account</button>
                <div style="margin-left: 40px" onlogin="checkLoginState();" class="fb-login-button button_login_API" data-width="170" data-size="large" data-button-type="login_with" data-layout="default" data-auto-logout-link="false" data-use-continue-as="false"></div>


            </div>
        </div>
    </div>
    <!--Register -->
    <script>
//            $(document).ready(function () {
//                $('#btn_forget').click(function () {
//                    var html = "";
//                    html += ;
//                            document.getElementById("content").innerHTML = html;
//                });
//            });
        $(document).ready(function () {
            $('#forgetuser').change(function () {
                var forgetuser = $('#forgetuser').val();
                $.ajax({
                    type: 'POST',
                    data: {forgetuser: forgetuser},
                    url: 'Checkexist',
                    success: function (result1) {
                        $('#result1').html(result1);
                    }
                });
            });
        });
    </script>

    <script src="resource/js/newjavascript.js" type="text/javascript"></script>
    <script>
        function statusChangeCallback(response) {  // Called with the results from FB.getLoginStatus().
            console.log('ham dc goi statusChangeCallback');
            console.log(response);                   // The current login status of the person.
            if (response.status === 'connected') {   // Logged into your webpage and Facebook.
                FB.api(
                        '/me',
                        'GET',
                        {"fields": "id,name,picture,gender,birthday"},
                        function (response) {
//                                console.log(response);
//                                console.log("id: " + response.id);
//                                console.log("name: " + response.name);
//                                toDataUrl(response.picture.data.url, function (myBase64) {
//                                    var asdahjsd = myBase64;
//                                    console.log("base 64: " + asdahjsd); // myBase64 is the base64 string
//                                });
//                                console.log("gender: " + response.gender);
//                                console.log("birthday: " + response.birthday);
                            fb_loginWithFacbook(response.id, response.name, response.picture.data.url);
                        }
                );
//                    window.location.href = 'Sign_in_Controller.jsp?access_token=' + response.authResponse.accessToken; // ??a ch? g?i token qua method GET
            } else {                                 // Not logged into your webpage or we are unable to tell.

            }
        }

        function checkLoginState() {               // Called when a person is finished with the Login Button.
            console.log("ham dc goi checkLoginState");
            FB.getLoginStatus(function (response) {   // See the onlogin handler
                statusChangeCallback(response);
            });
        }


        window.fbAsyncInit = function () {
            console.log("ham dc goi fbAsyncInit");
            FB.init({
                appId: '502943704922897',
                cookie: true, // Enable cookies to allow the server to access the session.
                xfbml: true, // Parse social plugins on this webpage.
                version: 'v14.0'           // Use this Graph API version for this call.
            });
            console.log("trc khi goi FB.getLoginStatus");
            FB.getLoginStatus(function (response) {   // Called after the JS SDK has been initialized.
                console.log("trc khi goi statusChangeCallback");
                statusChangeCallback(response);        // Returns the login status.
            });
        };

        (function (d, s, id) {
            var js, fjs = d.getElementsByTagName(s)[0];
            if (d.getElementById(id)) {
                return;
            }
            js = d.createElement(s);
            js.id = id;
            js.src = "https://connect.facebook.net/en_US/sdk.js";
            fjs.parentNode.insertBefore(js, fjs);
        }(document, 'script', 'facebook-jssdk'));

//convert url to base 64
        function toDataUrl(url, callback) {
            var xhr = new XMLHttpRequest();
            xhr.onload = function () {
                var reader = new FileReader();
                reader.onloadend = function () {
                    callback(reader.result);
                };
                reader.readAsDataURL(xhr.response);
            };
            xhr.open('GET', url);
            xhr.responseType = 'blob';
            xhr.send();
        }
        ;

        function fb_loginWithFacbook(fb_id, fb_displayname, fb_avatar) {
            toDataUrl(fb_avatar, function (myBase64) {
                var avatarBase64 = myBase64.substring(23);
                $.ajax({
                    url: 'Login',
                    method: 'POST',
                    data: {
                        "typeOfAccount": "2",
                        "fb_id": fb_id,
                        "fb_displayname": fb_displayname,
                        "fb_avatar": avatarBase64
                    },
                    success: function () {
//                            window.location.href = '/viewNewsfeed';
                        console.log('sucess');
                        window.location.replace('http://localhost:8080/nhom-4-se1604ks-swp391-social-network-for-gamer/viewNewsfeed');
                    }
                });
            });
        }
        ;

    </script>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_US/sdk.js"></script>
</body>
</html>
