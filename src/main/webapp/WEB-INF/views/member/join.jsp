<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up Form</title>

    <!-- Font Icon -->
    <link rel="stylesheet" href="resources/join/fonts/material-icon/css/material-design-iconic-font.min.css">

    <!-- Main css -->
    <link rel="stylesheet" href="resources/join/css/style.css">
</head>
<body>
<div class="main">
        <div class="container">
            <form action="mjoin" method="POST" class="appointment-form" id="appointment-form">
                <h2>Term Quiz on a Bus</h2>
                <div class="form-group-1">
                    <input type="email" class="joininput" name="email" id="email" placeholder="Email" required onclick="this.value='';" />
                    <input type="text" class="joininput" name="nickname" id="nickname" placeholder="Nick Name (4글자 이상, 10글자 이하)" maxlength="10" minlength="4" required onclick="this.value='';" />
                    <input type="password" class="joininput" name="password" id="password" placeholder="Password (숫자, 영문자 포함, 8글자 이상, 20글자 이하)" required onclick="this.value='';" autoComplete="off" />
                    <input type="password" class="joininput" id="password2" placeholder="Password Check" required onclick="this.value='';" autoComplete="off" />
                    <input type="text" class="joininput" name="name" id="name" placeholder="Name" required onclick="this.value='';"/>
                    <input type="number" class="joininput" oninput="numcheck(this);" name="phoneNumber" id="phone_number" placeholder="Phone Number" maxlength="11" required onclick="this.value='';"/>
                   	<div id="socialnf">
	                    <input type="number" class="joininput" oninput="numcheck(this);" name="scNumF" id="socialnumf" maxlength="6" placeholder="Social Number" required onclick="this.value='';"/>
	                    <p>&nbsp;&mdash;&nbsp;</p> 	                
    	                <input type="number" class="joininput" oninput="numcheck(this);" name="scNumL" id="socialnuml" maxlength="1" required onclick="this.value='';"/>
    	                <input id="socialnumb" value="******" disabled="disabled"/>
                   	</div>
                </div>
                <div class="form-check">
                    <input type="checkbox" name="agree-term" id="agree-term" class="agree-term" />
                    <label for="agree-term" class="label-agree-term"><span><span></span></span>I agree to the  <a href="#" class="term-service">Terms and Conditions</a></label>
                	<p id = "agreecheck"></p>
                </div>
                <div class="form-submit">
                    <button type="submit" name="submit" id="submit" class="submit" onClick="return agreecheck();">Sign Up</button>
                    <button type="reset" id="reset" class="submit" onclick="history.back();">Back</button>
                </div>
            </form>
        </div>

    </div>

    <!-- JS -->
    <script src="resources/join/vendor/jquery/jquery.min.js"></script>
    <script src="resources/join/js/main.js"></script>
    <script src="resources/join/js/join.js"></script>

</body>
</html>