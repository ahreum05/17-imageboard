<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="java.util.List"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int pg = 1;
	if(request.getParameter("pg") != null) {
		pg = Integer.parseInt(request.getParameter("pg"));
	}
	// 1페이지당 5개 목록보여주기
	int endNum = pg * 5;
	int startNum = endNum - 4;
	
	ImageboardDAO dao = new ImageboardDAO();
	List<ImageboardDTO> list = dao.imageboardList(startNum, endNum);
	
	/* 페이징 처리 */
	// 총글수 : 12 	총페이지 수 : 3
	// 총글수 : 23 	총페이지 수 : 5
	// 총글수 : 25 	총페이지 수 : 5
	// 총페이지수 계산식 : (총글수+4)/5
	int totalA = dao.getTotalA();    // 총 게시물 수
	int totalP = (totalA + 4) / 5;   // 총 페이지 수

	// 3블럭
	// 총페이수 : 8
	//			 [1][2][3][다음]
	//		[이전][4][5][6][다음]
	//		[이전][7][8]
	int startPage = (pg-1)/3*3 + 1;		
	int endPage = startPage + 2;
	if(endPage > totalP) endPage = totalP;
	
	// 데이터 공유
	request.setAttribute("list",list);
	request.setAttribute("pg", pg);
	request.setAttribute("totalP", totalP);
	request.setAttribute("startPage", startPage);
	request.setAttribute("endPage", endPage);
	   
	// 페이지 이동
	String view = "../main/index.jsp?req=imageboardListResult";
	RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	dispatcher.forward(request, response);
%>   
