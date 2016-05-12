package com.qqliquer.servlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qqliquer.service.SendJMail;

public class OrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html");
		request.setCharacterEncoding("utf-8");
		Object ob[] = new Object[6];
		ob[0] = request.getParameter("datevar");
		// ob[1] = request.getParameter("timevar");
		ob[1] = request.getParameter("guestsvar");
		// ob[3] = request.getParameter("occasionvar");
		ob[2] = request.getParameter("firstnamevar");
		// ob[5] = request.getParameter("lastnamevar");
		ob[3] = request.getParameter("streetvar");
		// ob[7] = request.getParameter("cityvar");
		// ob[8] = request.getParameter("postalvar");
		ob[4] = request.getParameter("phonevar");
		ob[5] = request.getParameter("emailvar");
		// ob[11] = request.getParameter("mobilevar");
		 String path =request.getRealPath("/WEB-INF/ordertext.html");
		 FileInputStream is = new FileInputStream(new File(path));
		 byte bytes [] = new byte[is.available()];
		 int len = 0;
		 StringBuilder bu = new StringBuilder();
		 while((len=is.read(bytes))!=-1){ 
			 String string2 = new String(bytes,0,len);
			 bu.append(string2);
		 }
		 String content = bu.toString();
		 content=  content.replace("datevar", ob[0].toString());
		 content =  content.replace("guestsvar", ob[1].toString());
		 content = content.replace("firstnamevar", ob[2].toString());
		 content = content.replace("streetvar", ob[3].toString());
		 content = content.replace("phonevar", ob[4].toString());
		 content = content.replace("emailvar", ob[5].toString());
		 System.out.println(content);
		 String mail = ResourceBundle.getBundle("conf").getString("mail");
		SendJMail.sendMail(mail,content);
		SendJMail.sendMail(ob[5].toString(),content);
		request.setAttribute("message","下单成功！请等待商家回复");
		request.getRequestDispatcher("forward.jsp").forward(request, response);
	}

}
