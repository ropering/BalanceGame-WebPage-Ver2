<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="css/util.css">
	<link rel="stylesheet" type="text/css" href="css/main.css">
<!--===============================================================================================-->
    <link rel="stylesheet" href="css/style.css">
<script type="text/javascript">
	function checkForm() {
		if (!document.newMember.myid.value) {
			alert("???????????? ???????????????.");
			return false;
		}

		if (!document.newMember.mypw.value) {
			alert("??????????????? ???????????????.");
			return false;
		}

		if (!document.newMember.mypw_confirm.value) {
			alert("???????????? ???????????? ???????????????.");
			return false;
		}
		
		if (document.newMember.mypw.value != document.newMember.mypw_confirm.value) {
			alert("???????????? ???????????? ???????????? ???????????????.");
			return false;
		}

		if (document.newMember.idDuplication.value != "idCheck") {
			alert("????????? ??????????????? ?????????");
			return false;
		}
	}

	function inputIdChk() {
		document.newMember.idDuplication.value = "idUncheck";
		
		//????????? ????????? ?????? (???????????????, ????????? ??????)
		for (var i = 0; i < document.newMember.myid.value.length; i++) {
            ch = document.newMember.myid.value.charAt(i);
            if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z') && (ch >= 'A' && ch <= 'Z')) {
			    var count = 0;
            	count ++;
                document.newMember.myid.focus();
                document.newMember.myid.select();
			    if (count > 0) {
			      	alert("???????????? ?????? ????????????, ????????? ?????????????????????.");
			    }
                return false;
            }
        }
	}

	function checkId() {

		if (!document.newMember.myid.value) {
			alert("???????????? ???????????????.");
			return false;
		}

		window.name = "IDCheckForm";
		window.open("./checkId.jsp?myid=" + document.newMember.myid.value,
				"IDCheck",
				"width=300, height=160, resizable =no, scrollbars=no");
	}
</script>

<title>????????????</title>
</head>
<body>
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100 p-b-160 p-t-50">
				<form name="newMember" action="processJoin.jsp" method="post" onsubmit="return checkForm()" class="login100-form validate-form">
						<span class="login100-form-title p-b-43">
							?????? ??????
						</span>
						
						<div class="wrap-input100 rs1 wrap-input100 rs2 validate-input" data-validate = "Username is required">
							<input class="input100" type="text" name="myid" onkeydown="inputIdChk()">
							<span class="label-input100">Id</span>
						</div>
						
						<div class="container-login100-form-btn">
							<input class="login100-form-btn" type="button" onclick="checkId()" value="????????????">
							<td><input type="hidden" name="idDuplication"	value="idUncheck"></td>
						</div>
						
						<div class="wrap-input100 rs1 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="mypw">
							<span class="label-input100">????????????</span>
						</div>

						<div class="wrap-input100 rs2 validate-input" data-validate="Password is required">
							<input class="input100" type="password" name="mypw_confirm">
							<span class="label-input100">???????????? ?????????</span>
						</div>

						<div class="container-login100-form-btn">
							<input class="login100-form-btn" type="submit" value="????????????">
						</div>

						
					</form>
				</div>
			</div>
		</div>
</body>
</html>