package com.guneshm.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registration
 */
@WebServlet("/RegistrationServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String NAME = request.getParameter("NAME");
		String DOB = request.getParameter("DOB");
		String GENDER = request.getParameter("GENDER");
		String ADDRESS = request.getParameter("ADDRESS");
		String CITY = request.getParameter("CITY");
		String STATE = request.getParameter("STATE");
		String LOGIN_ID = request.getParameter("LOGIN_ID");
		String PASSWORD = request.getParameter("PASSWORD");
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newdb", "root", "");
			PreparedStatement pst = con.prepareStatement(
					"insert into users(NAME,DOB,GENDER,ADDRESS,CITY,STATE,LOGIN_ID,PASSWORD) values(?,?,?,?,?,?,?,?)");

			pst.setString(1, NAME);
			pst.setString(2, DOB);
			pst.setString(3, GENDER);
			pst.setString(4, ADDRESS);
			pst.setString(5, CITY);
			pst.setString(6, STATE);
			pst.setString(7, LOGIN_ID);
			pst.setString(8, PASSWORD);

			int rowCount = pst.executeUpdate();
			if (rowCount > 0) {
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("login.jsp");

			} else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("signup.jsp");
			}
			dispatcher.forward(request, response);

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
