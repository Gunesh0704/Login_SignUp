package com.guneshm.registration;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class login
 */
@WebServlet("/login")
public class login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String LOGIN_ID = request.getParameter("LOGIN_ID");
		String PASSWORD = request.getParameter("PASSWORD");
		HttpSession session = request.getSession();
		RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/newdb", "root", "");

			PreparedStatement pst = con.prepareStatement("select * from users where LOGIN_ID = ? and PASSWORD = ?");

			pst.setString(1, LOGIN_ID);
			pst.setString(2, PASSWORD);

			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				session.setAttribute("NAME", rs.getString("NAME"));
				session.setAttribute("DOB", rs.getString("DOB"));
				session.setAttribute("GENDER", rs.getString("GENDER"));
				session.setAttribute("ADDRESS", rs.getString("ADDRESS"));
				session.setAttribute("CITY", rs.getString("CITY"));
				session.setAttribute("STATE", rs.getString("STATE"));
				session.setAttribute("LOGIN_ID", rs.getString("LOGIN_ID"));
				
				request.setAttribute("status", "success");
				dispatcher = request.getRequestDispatcher("Home.jsp");
			} 
			else {
				request.setAttribute("status", "failed");
				dispatcher = request.getRequestDispatcher("login.jsp");
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
