<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paging {color:blue; text-decoration: none;}
.currentPaging {color:red; text-decoration: underline;}
</style>
</head>
<body>
	<table border="1" width="500">
		<tr>
			<th width="50">번호</th>
			<th width="60">이미지</th>
			<th width="150">상품명</th>
			<th width="80">단가</th>
			<th width="60">개수</th>
			<th width="100">합계</th>
		</tr>
	<c:forEach var="dto" items="${list}">
		<tr align="center">
			<td>${dto.getSeq()}</td>
			<td><a href="imageboardView.jsp?seq=${dto.getSeq()}&pg=${pg}">
				<img src="../storage/${dto.getImage1()}" 
					 width="50" height="50"/></a></td>
			<td>${dto.getImageName() }</td>
			<td>${dto.getImagePrice() }</td>
			<td>${dto.getImageQty()}</td>
			<td>${dto.getImagePrice() * dto.getImageQty() }</td>
		</tr>		
	</c:forEach>
	
		<tr>		
			<td colspan="6" align="center">
			<c:if test="${startPage > 3}">			
				[<a href="../imageboard/imageboardList.jsp?pg=${startPage-1}"
					class="paging">이전</a>]
			</c:if>				
				
			<c:forEach var="i" begin="${startPage}" end="${endPage}">
				<c:if test="${pg == i}">
				[<a href="../imageboard/imageboardList.jsp?pg=${i}"
					class="currentPaging">${i}</a>]
				</c:if>
				<c:if test="${pg != i}">
				[<a href="../imageboard/imageboardList.jsp?pg=${i}"
					class="paging">${i}</a>]
				</c:if>
			</c:forEach>		
				
			   <c:if test="${endPage < totalP}">				
				[<a href="../imageboard/imageboardList.jsp?pg=${endPage+1}"
					class="paging">다음</a>]
			   </c:if>
			</td>
		</tr>
	</table>
</body>
</html>