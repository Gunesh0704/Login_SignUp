
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Registration Page</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>
<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">

	<div class="container">
		<h1>Register Here</h1>
		<form method="post" action="RegistrationServlet"
			class="registration-form">
			<input type="text" id="NAME" placeholder="Enter Name" name="NAME"
				required> <label for="dob">Date of Birth: <input
				type="date" id="DOB" name="DOB" required></label> <label>Gender:
				<input type="radio" name="GENDER" value="male"> Male <input
				type="radio" name="GENDER" value="female"> Female <input
				type="radio" name="GENDER" value="other"> Others
			</label> <input type="text" id="ADDRESS" placeholder="Enter Address"
				name="ADDRESS" required> <input type="text" id="CITY"
				placeholder="Enter City" name="CITY" required> <input
				type="text" id="STATE" placeholder="Enter State" name="STATE"
				required> <input type="text" id="LOGIN_ID"
				placeholder="Enter Login ID" name="LOGIN_ID" required> <input
				type="password" id="PASSWORD" placeholder="Enter Password"
				name="PASSWORD" required> <input type="submit"
				value="Register" />
		</form>
		<p>
			Already Registered? <a href="login.jsp">Sign in</a>
		</p>
	</div>
</body>




<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ccf2ff;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.container {
	width: 400px;
	background-color: #b3d1ff;
	padding: 20px;
	border-radius: 8px;
}

h1 {
	text-align: center;
	border:4px solid MediumSeaGreen;
	color: MediumSeaGreen;
	
}

label {
	font-family: Arial, sans-serif;
	display: block;
	margin-top: 10px;
}

input[type="text"], input[type="password"] {
	width: 100%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	background-color: #e6f9ff;
}

input[type="date"] {
	width: 50%;
	padding: 10px;
	margin: 8px 0;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
	background-color: #e6f9ff;
}

input[type="radio"] {
	margin: 8px 0
}

input[type="submit"] {
	width: 100%;
	border:4px solid MediumSeaGreen;
	color: MediumSeaGreen;
	padding: 12px 20px;
	margin: 8px 0;
	cursor: pointer;
}

p {
	text-align: center;
	margin: 8px 0;
}


</style>
<script type="text/javascript">
	var status = document.getElementById("status").value;
	if (status == "success") {
		swal("Congrats... You are successfully Registered...");
	}
</script>
</html>