
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Login Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>

<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">
	<div class="container">
		<h1>Login Here</h1>
		<form class="login-form" method="post" action=login>
			<input type="text" name="LOGIN_ID" placeholder="Login ID" required>
			<input type="password" name="PASSWORD" placeholder="Password" required> 
			<input type="submit" value="Login">
		</form>
		<p>
			Not registered yet? <a href="signup.jsp">Sign up</a>
		</p>
	</div>
</body>

<script type="text/javascript">
var status = document.getElementById("status").value;
if(status == "failed") {
	swal.fire("Sorry", "Invalid Credentials.", "error");
} else if (status == "success"){
	swal.fire("Congratulations", "You are Successfully Registered.", "success");
}


</script>

<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ccf2ff;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	text-align: center;
	height: 100vh;
}

h1 {
	text-align: center;
	border:4px solid MediumSeaGreen;
	color: MediumSeaGreen;
	
}


.container {
	background-color: #b3d1ff;
	padding: 20px;
	border-radius: 8px;
	max-width: 400px;
}

.login-form input[type="text"], .login-form input[type="password"] {
	width: 100%;
	padding: 10px;
	background-color: #e6f9ff;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.login-form input[type="submit"] {
	width: 100%;
	border:4px solid MediumSeaGreen;
	color: MediumSeaGreen;
	padding: 12px 20px;
	margin: 8px 0;
	cursor: pointer;
}

.login-form p {
	text-align: center;
	margin: 8px 0;
}
</style>
</html>