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
		//��ȡ������
		String name=request.getParameter("name");
		String psw=request.getParameter("psw");
		//ͨ��getServletConfig()�����ȡServletContext���󣬸���sc
		ServletContext sc=getServletConfig().getServletContext();
		String url="";
		
		//FileInputStream fi=new FileInputStream(path);
		if(name.equals("caca")&&psw.equals("1995")){
			url="/qq.html";
		}
		else{
			url="/load.html";
		}
		//�õ�RequestDispatcher���󣬸���rd
		RequestDispatcher rd=sc.getRequestDispatcher(url);
		//����forward����������ǰ��servlet��JSPҳ������ת����RequestDispatcherָ����servlet��JSPҳ��
		rd.forward(request,response);
		//����������������ͨ��ServletContext����ķ���setAttribute��������tom����ʵ��ͬһ��webapp�����ݹ���
		sc.setAttribute("caca", name);    
		PrintWriter out =response.getWriter();
		out.write("Servlet doPost\t"+name);
		
	}

	

}
