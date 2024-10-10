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
			if(${result > 0}){
				alert('이미 수정이 완료되었습니다.');
			}else{
				alert('이미지 수정이 실패하였습니다.');
			}	
			location.href='../imageboard/imageboardView.jsp?pg=${pg}&seq=${seq}';			
		}, 100);
		
	};
</script>
</head>
<body>

</body>
</html>