package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dao.MemberDAO;
import dto.Member;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("*.do")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uri = request.getRequestURI();
        String contextPath = request.getContextPath();
        String command = uri.substring(contextPath.length());
        
        String view = null;
        MemberDAO dao = new MemberDAO();
        try {
            switch (command) {
                case "/index.do":
                	request.setAttribute("index", dao.getList());
                    view = "/index.jsp";
                    break;
                    
//                case "/register.do":
//                	String username = request.getParameter("username");
//            		String age = request.getParameter("age");
//            		
//            		Member member = new Member(username, Integer.parseInt(age));            		
//            		dao.insert(member);
//            		
//            		request.setAttribute("umm", member);
//            		view = "/result.jsp";
//                break;
                
                case "/write.do":
                	String username = request.getParameter("username");
            		String age = request.getParameter("age");
            		
            		Member member = new Member(username, Integer.parseInt(age));            		
            		dao.insert(member);
            		
            		request.setAttribute("umm", member);
            		view = "/result.jsp";
                break;
                	
//               case "/view.do":
//                   int age = Integer.parseInt(request.getParameter("age"));
//                   request.setAttribute("Member", dao.getMember(age));
//                   view = "/view.jsp";
//                   break;
                	
//               case "/edit.do":
//                   if ("GET".equals(request.getMethod())) {
//                       request.setAttribute("Member", 
//                           dao.getMember(Integer.parseInt(request.getParameter("age"))));
//                       view = "/member/edit.jsp";
//                   } else {
//                	   Member dto = new Member(username, Integer.parseInt(age));
//                       dto.setAge(Integer.parseInt(request.getParameter("age")));
//                       dto.setUsername(request.getParameter("username"));
//                       
//                       dao.update(dto);
//                       response.sendRedirect("view.do?id=" + dto.getAge());
//                       return;
//                   }
//                   break;
                	
               case "/delete.do":
                   dao.delete(Integer.parseInt(request.getParameter("age")));
                   response.sendRedirect("index.do");
                   return;
	        default:
	            response.sendRedirect("index.do");
	            return;
	    }
	    
	    if (view != null) {
	        request.getRequestDispatcher(view).forward(request, response);
	    } else {
	        response.sendRedirect("index.do");
	    }
	    
	} catch (Exception e) {
	    e.printStackTrace();
	    response.sendRedirect("error/500.jsp");
	}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
