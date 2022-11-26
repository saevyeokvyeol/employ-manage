<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link type="text/css" rel="stylesheet" href="${path}/resources/css/css.css">
	<script src="https://code.jquery.com/jquery-3.6.1.js" integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
	<script type="text/javascript">
	</script>
	</head>
	<body>
		<div id="main-content-body">
			<div>
				<form action="${path}/insert-complete" method="post" id="insert-box">
					<div class="mb-3">
						<label for="employeeNumber" class="form-label">직원번호</label>
						<input type="text" class="form-control" name="employeeNumber">
					</div>
					<div class="mb-3">
						<label for="employeeName" class="form-label">이름</label>
						<input type="text" class="form-control" name="employeeName">
					</div>
					<div class="mb-3">
						<label for="employeeTel" class="form-label">전화번호</label>
						<input type="text" class="form-control" name="employeeTel">
					</div>
					<div class="mb-3">
						<label for="employeePosition" class="form-label">직급</label>
						<select class="form-select" aria-label="Default select example" id="employeePosition" name="employeePosition">
							<option selected value="사원">사원</option>
							<option value="주임">주임</option>
							<option value="대리">대리</option>
							<option value="과장">과장</option>
							<option value="차장">차장</option>
							<option value="부장">부장</option>
							<option value="이사">이사</option>
							<option value="상무">상무</option>
							<option value="전무">전무</option>
							<option value="부사장">부사장</option>
							<option value="사장">사장</option>
						</select>
					</div>
					<div class="mb-3">
						<label for="employeeEmail" class="form-label">이메일</label>
						<input type="email" class="form-control" name="employeeEmail">
					</div>
					<input type="submit" id="insert" class="btn btn-primary" value="등록">
				</form>
			</div>
			
		</div>
	</body>
</html>