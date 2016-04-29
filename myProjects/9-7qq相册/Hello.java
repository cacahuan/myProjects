package jxnu;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class Hello extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
		
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//获取表单数据
		String name=request.getParameter("name");
		String psw=request.getParameter("psw");
		//通过getServletConfig()对象获取ServletContext对象，赋给sc
		ServletContext sc=getServletConfig().getServletContext();
		String url="";
		
		//FileInputStream fi=new FileInputStream(path);
		if(name.equals("caca")&&psw.equals("1995")){
			url="/qq.html";
		}
		else{
			url="/load.html";
		}
		//得到RequestDispatcher对象，赋给rd
		RequestDispatcher rd=sc.getRequestDispatcher(url);
		//调用forward方法，将当前的servlet或JSP页面请求转发给RequestDispatcher指定的servlet或JSP页面
		rd.forward(request,response);
		//将表单传过来的数据通过ServletContext对象的方法setAttribute（）存入tom对象，实现同一个webapp的数据共享
		sc.setAttribute("caca", name);    
		PrintWriter out =response.getWriter();
		out.write("Servlet doPost\t"+name);
		
	}

	

}
