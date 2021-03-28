package control;

import java.io.IOException;
import java.util.Vector;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardBean;
import model.BoardDAO;
import sun.security.krb5.internal.PAEncTSEnc;

/**
 * Servlet implementation class BoardListCon
 */
@WebServlet("/BoardListCon.do")
public class BoardListCon extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int pagesize = 10;
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null) {
			pageNum = "1";
		}
		int count = 0;
		int number = 0;
		
		int currentPage = Integer.parseInt(pageNum);
		BoardDAO bdao = new BoardDAO();
		count = bdao.getAllCount();
		
		int startRow = (currentPage-1) * pagesize+1;
		int endRow = currentPage * pagesize ;
		
		Vector<BoardBean> v = bdao.getAllBoard(startRow, endRow);
		number = count - (currentPage - 1) * pagesize;
		
		
		String msg = (String) request.getAttribute("msg");
		
		request.setAttribute("v", v);
		request.setAttribute("number", number);
		request.setAttribute("pageSize", pagesize);
		request.setAttribute("count", count);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("msg", msg);
		
		RequestDispatcher dis = request.getRequestDispatcher("BoardList.jsp");
		dis.forward(request, response);
		
		
	}
}
