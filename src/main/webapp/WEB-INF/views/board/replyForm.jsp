<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기 페이지</title>
</head>
<body>

<c:import url="../default/header.jsp"/>

<h1 align="center">답글쓰기</h1>
<form method="post" action="${contextPath}/board/addReply">
	<input type="hidden" value="${write_no }" name="write_no">
	<table border="0" align="center">
		<tr>
			<td>
				<hr> <b>작성자</b> <br> 
				<input type="text" size="60" name="id" value="${userId }" readonly>
			</td>
		</tr>
		<tr>
			<td>
				<hr> <b>제목</b> <br> <input type="text" size="60" name="title">
			</td>
		</tr>
		<tr>
			<td>
				<hr> <b>내용</b> <br>
				<textarea name="content" rows="10" cols="63" maxlength="300"></textarea>
			</td>
		</tr>
		<tr>
			<td>
				<input type=submit value="답글쓰기" /> 
				<input type=button value="취소" onClick = 
								"location.href='${contextPath}/board/boardAllList'">
			</td>
		</tr>
	</table>
</form>

<c:import url="../default/footer.jsp"/>

</body>
</html>