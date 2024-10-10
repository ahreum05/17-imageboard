<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<script type="text/javascript" src="../script/imageboardScript.js"></script>
</head>
<body>
	<h3>이미지 등록</h3>
	<form action="../imageboard/imageboardWrite.jsp" name="form1"
			enctype="multipart/form-data" method="post">
		<table border="1" width="500">
			<tr>
				<td align="center" width="120">상품코드</td>
				<td><input type="text" name="imageId" value="img_"
						size="50"></td>
			</tr>
			<tr>
	         	<td align="center">상품명</td>
	         	<td>
	         		<input type="text" name="imageName" size="50">
	         	</td>
	      	</tr>
	      	<tr>
	         	<td align="center">단가</td>
	         	<td>
	         		<input type="text" name="imagePrice" size="50">
	         	</td>
	      	</tr>
	      	<tr>
	         	<td align="center">개수</td>
	         	<td>
	         		<input type="text" name="imageQty" size="50">
	         	</td>
	      	</tr>
	      	<tr>
	         	<td align="center">내용</td>
	         	<td>
	         		<textarea rows="10" cols="53" name="imageContent"></textarea>
	         	</td>
	      	</tr>
	      	<tr>
	         	<td colspan="2">
	            	<input type="file" name="image1" size="50">
	         	</td>
	      	</tr>
	      	<tr>
         		<td align="center" colspan="2">
         			<input type="button" value="이미지등록"
         				onclick="inputCheck()">
            		<input type="reset" value="다시작성">
            	</td>
      		</tr>
	      	
			
		</table>
	</form>
</body>
</html>


