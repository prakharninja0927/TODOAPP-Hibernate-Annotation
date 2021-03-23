package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import view.*;
import dao.*;

/**
 * Servlet implementation class ToDoController
 */
@WebServlet("/ToDoController")
public class ToDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToDoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		response.getWriter().append("Served at: ").append(request.getContextPath());
		String flag = request.getParameter("flag");
		if (flag.equals("show")) {
			Todo get=new Todo();
			List<?> ls = get.getDATA();
			HttpSession hs = request.getSession();
			hs.setAttribute("List", ls);
			response.sendRedirect("index.jsp");
		} 
		else if(flag.equals("deleteAll")){
			Todo dlt=new Todo();
			dlt.deleteAll();
			response.sendRedirect("index.jsp");
		}
		else if(flag.equals("deleteSingle")){
			String email=request.getParameter("id");
			
			Todo dlt=new Todo();
				dlt.delete(email);
				
			Todo get=new Todo();
			List<?> ls = get.getDATA();
			HttpSession hs = request.getSession();
			hs.setAttribute("List", ls);
			response.sendRedirect("index.jsp");
		}
		else if(flag.equals("update")){
			
			String email=request.getParameter("id");
			Todo getr=new Todo();
				List<?> ls=getr.getRecord(email);
			HttpSession hs=request.getSession();
				hs.setAttribute("record",ls);
			
			response.sendRedirect("Update.jsp");
		}
		else if(flag.equals("updateData")){
			
			System.out.println(request.getParameter("id"));
			AddTODO at=new AddTODO();
			   at.setId(Integer.parseInt(request.getParameter("id")));
			   at.setEmail(request.getParameter("email"));
			   at.setName(request.getParameter("name"));
			   at.setGender(request.getParameter("gender"));
			   at.setPercentage(Float.parseFloat(request.getParameter("percentage")));
			   at.setGrade(request.getParameter("grade"));
			
			Todo updt=new Todo();
				updt.update(at);
			
			List<?> ls = updt.getDATA();
			HttpSession hs = request.getSession();
			hs.setAttribute("List", ls);
			response.sendRedirect("index.jsp");		
		}
		else if(flag.equals("search")){
			String name=request.getParameter("name");
			
			Todo search=new Todo();
				List<?> ls=search.getSearch(name);
				PrintWriter out = response.getWriter();
				String str = "";
				int count=0;
				
				for (Iterator iterator = ls.iterator(); iterator.hasNext();) {
					AddTODO r = (AddTODO) iterator.next();
					
					str=str+r.getEmail()+","+r.getName()+","+r.getGender()+","+r.getPercentage()+","+r.getGrade()+","
					+r.getId()+"|";	
					
				}
				out.println(str);
			
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		doGet(request, response);
		String email=request.getParameter("email");
		String name=request.getParameter("name");
		String gender=request.getParameter("gender");
		float percentage=Float.parseFloat(request.getParameter("percentage"));
		String grade=request.getParameter("grade");
		
		System.out.println(grade);
		
		AddTODO at=new AddTODO();
			at.setEmail(request.getParameter("email"));
			at.setName(request.getParameter("name"));
			at.setGender(request.getParameter("gender"));
			at.setPercentage(Float.parseFloat(request.getParameter("percentage")));
			at.setGrade(request.getParameter("grade"));
		
		Todo td=new Todo();
			td.insertData(at);
		Todo get=new Todo();
		List<?> ls = get.getDATA();
		HttpSession hs = request.getSession();
		hs.setAttribute("List", ls);
		response.sendRedirect("index.jsp");
		
		
		
	}

}
