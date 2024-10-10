<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	// 1. 데이터 처리
	// 저장 폴더 위치얻기
	String realFolder = request.getServletContext().getRealPath("storage");
	MultipartRequest multi = new MultipartRequest(request, realFolder,
										5*1024*1024, "UTF-8", 
										new DefaultFileRenamePolicy());
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getFilesystemName("image1");
	
	// 2. db
	ImageboardDTO dto = new ImageboardDTO();
    dto.setImageId(imageId);
    dto.setImageName(imageName);
    dto.setImagePrice(imagePrice);
    dto.setImageQty(imageQty);
    dto.setImageContent(imageContent);
    dto.setImage1(image1);
    //System.out.println(dto.toString());
    
    ImageboardDAO dao = new ImageboardDAO();
    int result = dao.imageboardWrite(dto);

	/* 3. view 페이지 이동 : forward 방식 */
	// 1) 데이터 공유
    request.setAttribute("result", result);
    request.setAttribute("imageName", imageName);
	// 2) 페이지 이동
	String view = "../main/index.jsp?req=imageboardWriteResult";
	RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	dispatcher.forward(request, response);
%>  
<%--  
<jsp:forward page="../main/index.jsp?req=imageboardWriteResult"/>
 --%>
