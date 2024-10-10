<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	// window.onload : 브라우저가 모든 태그를 인식한 후에 동작되는 이벤트 설정
	window.onload = function() {
		// 100ms 이후에 함수를 호출시킴
		setTimeout(function() {
			if(${result > 0}) {
				alert("${imageName} 상품이 등록 완료");
			} else {
				alert("등록 실패하였습니다.");
			}			
		}, 100); 		
	}
</script>
</head>
<body>
	<c:if test="${result > 0}">
		${imageName} 상품이 등록 완료
	</c:if>
	<c:if test="${result == 0}">
		등록 실패하였습니다.
	</c:if>
</body>
</html>