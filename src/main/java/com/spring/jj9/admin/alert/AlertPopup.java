package com.spring.jj9.admin.alert;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class AlertPopup {
	
	public static void init(HttpServletResponse response){
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
	}
	
	
	public static void alertAndMovePage(HttpServletResponse response, String alertText, String nextPage) throws IOException {
		init(response);
		PrintWriter out= response.getWriter();
		out.println("<script>alert('" + alertText + "');"
				+ " location.href='" + nextPage + "';</script> ");
		out.flush();
	}
	public static void alertAndBackPage(HttpServletResponse response, String alertText) throws IOException {
		init(response);
		PrintWriter out= response.getWriter();
		out.println("<script>alert('" + alertText + "');"				
				+ "window.location.href = document.referrer;</script> ");
		out.flush();
	}
	public static void confirmAndMovePage(HttpServletResponse response, String alertText, String nextPage) throws IOException {
		// 확인누르면 nextPage로 이동. 취소누르면 이전페이지로 이동
		init(response);
		PrintWriter out= response.getWriter();
		out.println("<script>const answer = window.confirm('" + alertText + "');"				
				+ "if (answer){"							
				+ "    location.href='" + nextPage + "';"
				+ "}else{"
				+ "    window.location.href = document.referrer;"
				+ "}</script>");			
		out.flush();
	}
}
