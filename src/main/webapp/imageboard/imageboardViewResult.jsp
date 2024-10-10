<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function isDelete() {
		if(confirm("정말 삭제할까요?")) {
			location.href='../imageboard/imageboardDelete.jsp?seq=${seq}&pg=${pg}'
		}
	}
</script>
</head>
<body>
	<table border="1">
		<tr>
			<td rowspan="4" width="150">
				<img src="../storage/${dto.image1}" 
						width="150" height="150"></td>
			<td width="200">상품명 : ${dto.imageName }</td>
		</tr>
		<tr>
		 	<td>단가 : ${dto.imagePrice }</td>
		</tr>
		<tr>
		 	<td>개수 : ${dto.imageQty }</td>
		</tr>
		<tr>
		 	<td>합계 : ${dto.imagePrice * dto.imageQty}</td>
		</tr>
		<tr>
			<td colspan="2" height="200" valign="top">
				<pre>${dto.imageContent }</pre></td>
		</tr>		
	</table>
	<input type="button" value="목록" 
		onclick="location.href='../imageboard/imageboardList.jsp?pg=${pg}'">
	<input type="button" value="삭제" onclick="isDelete()">
	<input type="button" value="수정" 
	     onclick="location.href='../imageboard/imageboardModifyFormReady.jsp?pg=${pg}&seq=${seq}'">
</body>
</html>



