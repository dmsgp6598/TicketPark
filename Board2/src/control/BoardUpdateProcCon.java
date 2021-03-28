package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.BoardDAO;

/**
 * Servlet implementation class BoardUpdateProcCon
 */
@WebServlet("/BoardUpdateProcCon.do")
public class BoardUpdateProcCon extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		reqPro(request, response);
	}
	
	protected void reqPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("euc-kr");
		int num = Integer.parseInt(request.getParameter("num"));
		String password = request.getParameter("password");
		String pass = request.getParameter("pass"); 
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
				
		if(password.equals(pass)) {
			BoardDAO bdao = new BoardDAO();
			bdao.updateBoard(num, subject, content); 
			RequestDispatcher dis = request.getRequestDispatcher("BoardListCon.do");
			dis.forward(request, response);
		} else {
				request.setAttribute("msg", "비밀번호가 맞지 않습니다");	
				RequestDispatcher dis = request.getRequestDispatcher("history.go(-1)");
				dis.forward(request, response);
		}
			}

	

}
