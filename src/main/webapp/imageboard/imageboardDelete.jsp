<%@page import="imageboard.dao.ImageboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int seq = Integer.parseInt(request.getParameter("seq"));
	int pg = Integer.parseInt(request.getParameter("pg"));
	// db
	ImageboardDAO dao = new ImageboardDAO();    
    int result = dao.imageboardDelete(seq);
    // 데이터 공유
    request.setAttribute("result", result);
    request.setAttribute("pg", pg);

    // 페이지 이동
	String view = "../main/index.jsp?req=imageboardDeleteResult";
	RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	dispatcher.forward(request,response);
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>