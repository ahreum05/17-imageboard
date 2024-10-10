<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	window.onload = function() {
		setTimeout(function(){
			if(${result == 0}){
				alert('삭제 실패');
			}else{
				alert('삭제 성공');
			}	
			location.href='../imageboard/imageboardList.jsp?pg=${pg}'			
		}, 100);
		
	};
</script>
</head>
<body>

</body>
</html>