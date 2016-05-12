package com.qqliquer.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qqliquer.service.SendJMail;

public class FeedBackServlet extends HttpServlet {
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("nametxt");
		String emailtxt = request.getParameter("emailtxt");
		String messagetxt= "";
		messagetxt+="用户："+emailtxt+"<br/>"+"的反馈信息如下:<br/>";
		messagetxt+="姓名："+name+"<br/>";
		messagetxt+="反馈内容："+request.getParameter("messagetxt");
		/**
		 * 先给商家发一份
		 */
		String mail = ResourceBundle.getBundle("conf").getString("mail");
		SendJMail.sendMail(mail, messagetxt);
		
		/**
		 * 再给反馈的用户发一份
		 */
		SendJMail.sendMail(emailtxt, "您的反馈信息如下："+request.getParameter("messagetxt")+"<br/>请留意回复!");
		
		request.setAttribute("message","反馈成功！我们会采取您的意见");
		request.getRequestDispatcher("forward.jsp").forward(request, response);
		
	}
}
