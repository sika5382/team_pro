<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.trb { background-color:#FF9933; }
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function userCheck(userId, contentId){
		if(userId == contentId){
			document.getElementById("i_title").disabled=false;
			document.getElementById("i_content").disabled=false;
			document.getElementById("i_imageFileName").disabled=false;
		}
	}
	function readURL(input) {
	     if (input.files && input.files[0]) {
	         var reader = new FileReader();
	         reader.readAsDataURL(input.files[0]);
	         reader.onload = function (e) {
	             $('#preview').attr('src', e.target.result);
	         }
	     }
	 }
	function replyData(write_no){
		console.log("write_no : "+write_no);
		$.ajax({
			url:"replyData/"+write_no,
			type:"GET",
			success:function(rep){
				let html = ""
				rep.forEach(function(data){
					var w_date = new Date(data.write_date);
					var write_date = w_date.getFullYear()+"년";
					write_date+=w_date.getMonth()+1+"월"
					write_date+=w_date.getDate()+"일"
					write_date+=w_date.getHours()+"시"
					write_date+=w_date.getMinutes()+"분"
					write_date+=w_date.getSeconds()+"초"
					html += "<b>아이디 : </b>"+data.id+" 님";
					html += " | <b>작성일 : </b>"+write_date+"<br>";
					html += "<b>제 목 : </b>"+data.title+"<br>"
					html += "<b>내용 : </b>"+data.content+"<hr>"
				});
				$("#reply").html(html);
			},error:function(){ alert("문제가 발생했습니다.") }
		})
	}
</script>
</head>
<body onload="userCheck('${userId}','${contentView.id}'),replyData('${contentView.write_no }')">

<c:import url="../default/header.jsp"/>

	<form method="post" action="${contextPath}/board/modify" enctype="multipart/form-data">
		<table border=1 align="center">
			<tr>
				<td width=150 align="center" class="trb">글번호</td>
				<td>
					<input type="text" name="write_no" value="${contentView.write_no }" disabled>
					<input type="hidden" name="write_no" value="${contentView.write_no}">
				</td>
			</tr>
			<tr>
				<td align="center" class="trb">작성자 아이디</td>
				<td> <input type=text value="${contentView.id }" name="id" disabled> </td>
			</tr>
			<tr>
				<td align="center"  class="trb">제목</td>
				<td><input type=text value="${contentView.title }" name="title"	id="i_title" disabled /></td>
			</tr>
			<tr>
				<td align="center"  class="trb">내용</td>
				<td><textarea rows="20" cols="60" name="content" 
						id="i_content" disabled >${contentView.content }</textarea>
					<div id="reply"></div>
				</td>
			</tr>
			<tr>
				<td height="50" align="center" class="trb">이미지</td>
				<td>
					<input type="hidden" name="originalFileName" value="${contentView.image_file_name }">
					<input type="file" name="image_file_name " id="i_imageFileName" disabled onchange="readURL(this);" >
					<c:choose>
						<c:when test="${not empty contentView.image_file_name && contentView.image_file_name != 'null' }">
							<img width="50px;" id="preview" src=
		"${contextPath}/board/download?write_no=${contentView.write_no}&image_file_name=${contentView.image_file_name}" >
						</c:when>
						<c:otherwise>
							<img width="50px;" id="preview" ><br> 
						</c:otherwise>
					</c:choose>			
				</td>
			</tr>	
			<tr>
				<td align="center"  class="trb">등록일자</td>
				<td><input type=text value="${contentView.savedate}" disabled></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><!-- 로그인 유저와 글 작성 아이디가 같다면 수정 삭제 보여줌  -->
					<c:if test="${userId == contentView.id }">
						<input type="submit" value="수정하기">  
						<input type=button value="삭제하기" onclick=
							"location.href='${contextPath}/board/boardDelete?write_no=${contentView.write_no}'">
					</c:if>
					<input type=button value="답글쓰기" onclick=
						"location.href='boardReplyView?write_no=${contentView.write_no}'">
					<input type=button value="리스트로 돌아가기" onClick="location.href='${contextPath}/board/boardAllList'"> 
				</td>
			</tr>
		</table>
	</form>
	
<c:import url="../default/footer.jsp"/>

</body>
</html>