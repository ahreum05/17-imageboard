<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="imageboard.dao.ImageboardDAO"%>
<%@page import="imageboard.bean.ImageboardDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
    request.setCharacterEncoding("UTF-8");
    // 데이터
    String realFolder = request.getServletContext().getRealPath("storage");
    MultipartRequest multi = new MultipartRequest(request, realFolder, 
    		5*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
    
    int seq = Integer.parseInt(multi.getParameter("seq"));
	int pg = Integer.parseInt(multi.getParameter("pg"));
	String image_org = multi.getFilesystemName("image_org");
	String imageId = multi.getParameter("imageId");
	String imageName = multi.getParameter("imageName");
	int imagePrice = Integer.parseInt(multi.getParameter("imagePrice"));
	int imageQty = Integer.parseInt(multi.getParameter("imageQty"));
	String imageContent = multi.getParameter("imageContent");
	String image1 = multi.getFilesystemName("image1");
	//System.out.println("image1 =" + image1);
	if(image1 == null) {
		image1 = image_org;
	}
	//db 
	ImageboardDTO dto = new ImageboardDTO();
	dto.setSeq(seq);
	dto.setImageId(imageId);
	dto.setImageName(imageName);
	dto.setImagePrice(imagePrice);
	dto.setImageQty(imageQty);
	dto.setImageContent(imageContent);
	dto.setImage1(image1);
	

	ImageboardDAO dao = new ImageboardDAO();
	int result = dao.imageboardModify(dto);
	// 데이터 공유하기
	request.setAttribute("result", result);
	request.setAttribute("pg", pg);
	request.setAttribute("seq", seq);

	
	// 페이지 이동
	String view = "../main/index.jsp?req=imageboardModifyResult";
	RequestDispatcher dispatcher = request.getRequestDispatcher(view);
	dispatcher.forward(request, response);
	
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