<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정</title>

</head>
<body>
    <form action="../imageboard/imageboardModify.jsp" name="form1"
			enctype="multipart/form-data" method="post">>
	   <input type="hidden" name="seq" value="${dto.seq}">
        <input type="hidden" name="pg" value="${pg}">
        <table border="1" width="480">
            <tr>
                <td align="center" width="100">상품코드</td>
                <td><input type="text" name="imageId" value="${dto.imageId}" size="50"></td>
            </tr>
            <tr>
                <td align="center">상품명</td>
                <td><input type="text" name="imageName" value="${dto.imageName}" size="50"></td>
            </tr>
            <tr>
                <td align="center">단가</td>
                <td><input type="text" name="imagePrice" value="${dto.imagePrice}" size="50"></td>
            </tr>
            <tr>
                <td align="center">개수</td>
                <td><input type="text" name="imageQty" value="${dto.imageQty}" size="50"></td>
            </tr>
            <tr>
                <td align="center">내용</td>
                <td><textarea rows="10" cols="53" name="imageContent">${dto.imageContent}</textarea></td>
            </tr>
            <tr>
                <td align="center">이미지</td>
                <td>
                    <input type="file" name="image1" size="50" onchange="updateFileName(this)">
                    <br>
                    <span id="fileName">기존에 등록된 파일 : ${dto.image1}</span>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <input type="submit" value="이미지수정">
                    <input type="reset" value="다시작성">
                </td>
            </tr>
        </table>
    </form>
	<input type="button" value="목록" 
		onclick="location.href='../imageboard/imageboardList.jsp?pg=${pg}'">
	<input type="button" value="삭제" onclick="isDelete()">
	<input type="button" value="수정" onclick="location.href='../imageboard/imageboardModifyResult.jsp?pg=${pg}&seq=${seq}'">
   </form>
</body>
</html>