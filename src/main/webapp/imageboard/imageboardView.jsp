<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	// db
	ImageboardDAO dao = new ImageboardDAO();
	ImageboardDTO dto = dao.imageboardView(seq);
	
	// 데이터 공유
	request.setAttribute("dto", dto);
	request.setAttribute("pg", pg);
	request.setAttribute("seq",seq);
	// 페이지 이동
	String view="../main/index.jsp?req=imageboardViewResult";
	RequestDispatcher dispatcher=request.getRequestDispatcher(view);
	dispatcher.forward(request, response);
%>    
