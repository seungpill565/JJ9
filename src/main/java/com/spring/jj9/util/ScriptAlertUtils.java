package com.spring.jj9.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

public class ScriptAlertUtils {
	
	  public static void init(HttpServletResponse response) {		   	   
	        response.setContentType("text/html; charset=utf-8");
	        response.setCharacterEncoding("utf-8");
	    }
	 
	    public static void alert(HttpServletResponse response, String alertText) throws IOException {
	    	// 사용법 : ScriptAlertUtils.alert("아이디가 중복");
	        init(response);
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + alertText + "');</script> ");
	        out.flush();
	    }
      
      public static void alertAndBackPage(HttpServletResponse response, String alertText) throws IOException {
	    	// 사용법 : ScriptAlertUtils.alertAndBackPage("아이디가 중복");
	        init(response);
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + alertText + "'); location.href = document.referrer;</script>");
	        out.flush();
	    }
	 
	    public static void alertAndMovePage(HttpServletResponse response, String alertText, String nextPage) throws IOException {
	    	// 사용법 : ScriptAlertUtils.alertAndMovePage("아이디가 중복","/login.do");
	        init(response);
	        PrintWriter out = response.getWriter();
	        out.println("<script>alert('" + alertText + "'); location.href='" + nextPage + "';</script> ");
	        out.flush();
	    }
	    
	    public static void reload (HttpServletResponse response) throws IOException {
	    	init(response);
	    	PrintWriter out = response.getWriter();
	        out.println("<script> location.reload();</script>");
	        out.flush();
	    }
}
