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
		$(function() {
			$('#employeePosition').val("${employee.employeePosition}").prop("selected", true)
		})
	</script>
	</head>
	<body>
		<div id="main-content-body">
			<div>
				<form action="${path}/update-complete" method="post" id="insert-box">
					<input type="text" class="form-control" name="employeeId" value="${employee.employeeId}" hidden="true">
					<div class="mb-3">
						<label for="employeeNumber" class="form-label">직원번호</label>
						<input type="text" class="form-control" name="employeeNumber" value="${employee.employeeNumber}">
					</div>
					<div class="mb-3">
						<label for="employeeName" class="form-label">이름</label>
						<input type="text" class="form-control" name="employeeName" value="${employee.employeeName}">
					</div>
					<div class="mb-3">
						<label for="employeeTel" class="form-label">전화번호</label>
						<input type="text" class="form-control" name="employeeTel" value="${employee.employeeTel}">
					</div>
					<div class="mb-3">
						<label for="employeePosition" class="form-label">직급</label>
						<select class="form-select" aria-label="Default select example" id="employeePosition" name="employeePosition">
							<option value="사원">사원</option>
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
						<input type="email" class="form-control" name="employeeEmail" value="${employee.employeeEmail}">
					</div>
					<input type="submit" class="btn btn-primary" value="수정">
				</form>
			</div>
			
		</div>
	</body>
</html>