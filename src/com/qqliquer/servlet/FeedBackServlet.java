package com.qqliquer.servlet;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qqliquer.service.SendJMail;

public class FeedBackServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		String name = request.getParameter("nametxt");
		String emailtxt = request.getParameter("emailtxt");
		String messagetxt= "";
		messagetxt+="用户："+emailtxt+"<br/>"+"的反馈信息如下:<br/>";
		messagetxt+="真实姓名："+name+"<br/>";
		messagetxt+="反馈内容："+request.getParameter("messagetxt");
		/**
		 * 先给商家发一份
		 */
		SendJMail.sendMail("1099532501@qq.com", messagetxt);
		
		/**
		 * 再给反馈的用户发一份
		 */
		SendJMail.sendMail(emailtxt, "您的反馈信息如下："+request.getParameter("messagetxt")+"<br/>请留意回复!");
		
		out.print(name);
		out.print(emailtxt);
		out.print(messagetxt);
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}
}
