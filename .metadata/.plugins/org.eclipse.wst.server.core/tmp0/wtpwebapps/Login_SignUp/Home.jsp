
<%
if (session.getAttribute("NAME") == null) {
	response.sendRedirect("login.jsp");
}
%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Homepage</title>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>


</head>
<body>

<input type ="hidden" id="status" value="<%= request.getAttribute("status")%>">

	<nav class="navbar">
		<h2>
			Welcome
			<%=session.getAttribute("NAME")%></h2>
		<p>
			<a href="logout" class="logout-button">Log Out</a>
		</p>
	</nav>
	<div class="container">

		<table class="user-table">
			<tr>
				<th>Name :</th>
				<td><%=session.getAttribute("NAME")%></td>
			</tr>
			<tr>
				<th>Login ID :</th>
				<td><%=session.getAttribute("LOGIN_ID")%></td>
			</tr>
			<tr>
				<th>Date of Birth :</th>
				<td><%=session.getAttribute("DOB")%></td>
			</tr>
			<tr>
				<th>Gender :</th>
				<td><%=session.getAttribute("GENDER")%></td>
			</tr>
			<tr>
				<th>Address :</th>
				<td><%=session.getAttribute("ADDRESS")%></td>
			</tr>
			<tr>
				<th>City :</th>
				<td><%=session.getAttribute("CITY")%></td>
			</tr>
			<tr>
				<th>State :</th>
				<td><%=session.getAttribute("STATE")%></td>
			</tr>
		</table>
		<br> <br>


	</div>
	<div class="container2">
		<h2>Registered Users</h2>
	</div>
	<div class="container2">

		<table border="1">
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>DOB</th>
				<th>Gender</th>
				<th>Address</th>
				<th>City</th>
				<th>State</th>
				<th>Login ID</th>
			</tr>

			<%
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newdb", "root", "");
				Statement st = con.createStatement();
				
				String name = (String)session.getAttribute("NAME");

				String qry = "select * from users where NAME != '"+name+"' ";
				ResultSet rs = st.executeQuery(qry);
				while (rs.next()) {
			%>


			<tr>
				<td><%=rs.getString("ID")%></td>
				<td><%=rs.getString("NAME")%></td>
				<td><%=rs.getString("DOB")%></td>
				<td><%=rs.getString("GENDER")%></td>
				<td><%=rs.getString("ADDRESS")%></td>
				<td><%=rs.getString("CITY")%></td>
				<td><%=rs.getString("STATE")%></td>
				<td><%=rs.getString("LOGIN_ID")%></td>
			</tr>


			<%
			}

			} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			}
			%>

		</table>

	</div>




</body>

<script type="text/javascript">
var status = document.getElementById("status").value;
if(status == "success") {
	swal.fire("Congratulations","you are successfully logged in..","success")
}


</script>


<style>
body {
	font-family: Arial, sans-serif;
	background-color: #ccf2ff;
	margin: 0;
	padding: 0;
}

h2 {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
}

.container {
	display: flex;
	margin: 0px 25%;
	font-family: Arial, sans-serif;
	background-color: #b3d1ff;
	padding: 20px;
	width: auto;
	justify-content: center;
	align-items: center;
}

.container2 {
	justify-content: center;
	align-items: center;
	display: flex;
	margin: 0px 25%;
	font-family: Arial, sans-serif;
	background-color: #b3d1ff;
	padding: 20px;
	width: auto;
}

/* Navbar styles */
.navbar {
	display: flex;
	justify-content: space-between;
	background-color: #0086b3;
	padding: 10px 20px;
	color: #fff;
}

/* Logout button styles */
.logout-button {
	padding: 8px 16px;
	background-color: #ff0000;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.logout-button:hover {
	background-color: #ff3333;
}

.user-table th {
	text-align: left;
}

.user-table td {
	text-align: center;
}
</style>
</html>