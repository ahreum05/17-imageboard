<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style type="text/css">
#main {
	width: 650px;
	margin: auto;  /* 브라우저 기준 가운데 배치 */
}
header {
	text-align: center;
	color: black;
	border-bottom: 2px solid black;
	width: 100%; height: 70px;
}
#container {
	width: 100%;
	height: 500px;
}
nav {
	width: 150px;
	height: 100%;
	background: orange;
	float: left;
}
section {
	width: 500px;
	height: 100%;
	background: white;
	float:left;
}
footer {
	clear: both;	/* float 속성 해지 */
	background: white;	
	text-align: center;
	color: black;
	height: 150px;
	border-top: 2px solid black;
}
nav a:link {color: black; text-decoration: none;}
nav a:visited {color: black; text-decoration: none;}
nav a:hover {color: green; text-decoration: underline;}
nav a:active {color: black; text-decoration: none;}
</style>
</head>
<body>
<div id="main">
	<header>
		<h2>이미지 게시판</h2>
	</header>
	
	<div id="container">
		<nav>
			<h3>** <a href="../main/index">메인 화면</a> **</h3>
			<a href="#">회원가입</a><br>
			<a href="#">로그인</a><br>
			<a href="#">로그아웃</a><br>
			<a href="#">회원정보수정</a><br>
			<a href="#">글쓰기</a><br>
			<a href="#">글목록</a><br>
			<a href="../main/index.jsp?req=imageboardWriteForm">이미지 등록</a><br>
			<a href="../imageboard/imageboardList.jsp">이미지 목록</a><br>
		</nav>
		
		<section>
			<c:if test="${param.req == null }">
				<jsp:include page="../main/body.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardWriteForm'}">
				<jsp:include page="../imageboard/imageboardWriteForm.jsp"/>
			</c:if>	
			
			<c:if test="${param.req == 'imageboardWriteResult'}">
				<jsp:include page="../imageboard/imageboardWriteResult.jsp"/>
			</c:if>	
			
			<c:if test="${param.req == 'imageboardListResult'}">
				<jsp:include page="../imageboard/imageboardListResult.jsp"/>
			</c:if>		
			
			<c:if test="${param.req == 'imageboardViewResult'}">
				<jsp:include page="../imageboard/imageboardViewResult.jsp"/>
			</c:if>
			
			<c:if test="${param.req == 'imageboardDeleteResult'}">
				<jsp:include page="../imageboard/imageboardDeleteResult.jsp"/>
			</c:if>
			<c:if test="${param.req == 'imageboardModifyForm'}">
				<jsp:include page="../imageboard/imageboardModifyForm.jsp"/>
			</c:if>
			<c:if test="${param.req == 'imageboardModifyResult'}">
				<jsp:include page="../imageboard/imageboardModifyResult.jsp"/>
			</c:if>
		    
		</section>
	</div>
	
	<footer>
		KGITBANK
	</footer>	
</div>	
</body>
</html>