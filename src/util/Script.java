package util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Script {
	
	public static void moving(HttpServletResponse response, String msg) {
		
		response.setCharacterEncoding("UTF-8");
		
		try {
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('" + msg + "')");
			script.println("location.href='Main.le'");
			script.println("</script>");
			script.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static void moving(HttpServletResponse response, String msg, String url) {
		try {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('" + msg + "')");
			script.println("location.href = '" + url + "'");
			script.println("</script>");
			script.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
