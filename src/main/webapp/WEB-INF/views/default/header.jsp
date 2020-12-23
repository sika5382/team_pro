<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath() %>/">상호투어</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="<%=request.getContextPath() %>/">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">About</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Contents</a>
          </li>
         
         
          <c:choose>
				<c:when test="${sessionScope.userid == null }">
					<li class="nav-item">
            			<a class="nav-link" href="<%=request.getContextPath() %>/login">Login</a>
         			 </li>
         			 <li class="nav-item">
            			<a class="nav-link" href="<%=request.getContextPath() %>/member/registerForm">
            				Register</a>
          			</li>
				</c:when>
				<c:otherwise>
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath() %>/logout">로그아웃</a>
					</li>
					<li class="nav-item">
						<a class="nav-link" href="<%=request.getContextPath() %>/member/myRegister">
							내정보</a>
					</li>
				</c:otherwise>
			</c:choose>
        </ul>
      </div>
    </div>
  </nav>
</body>
</html>