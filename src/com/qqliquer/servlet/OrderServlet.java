package com.qqliquer.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrderServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");

		Object ob[] = new Object[12];
		ob[0] = request.getParameter("datevar");
		ob[1] = request.getParameter("timevar");
		ob[2] = request.getParameter("guestsvar");
		ob[3] = request.getParameter("occasionvar");
		ob[4] = request.getParameter("firstnamevar");
		ob[5] = request.getParameter("lastnamevar");
		ob[6] = request.getParameter("streetvar");
		ob[7] = request.getParameter("cityvar");
		ob[8] = request.getParameter("postalvar");
		ob[9] = request.getParameter("phonevar");
		ob[10] = request.getParameter("emailvar");
		ob[11] = request.getParameter("mobilevar");
		for (int i = 0; i < ob.length; i++) {
			out.print(ob[i] + "\n");
		}

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
