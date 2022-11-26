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
			$('.delete-employee-btn').click(function() {
				flag = confirm($(this).val() + "번 사원을 삭제하시겠습니까?")
				if (flag) {
					location.href = "${path}/delete/" + $(this).parent().parent().prop('id')
				}	
			})
		})
	</script>
	</head>
	<body>
		<div id="main-content-body">
			<table class="table">
				<tr>
					<th>직원번호</th>
					<th>직급</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>이메일</th>
					<th></th>
				</tr>
				<c:forEach items="${employees}" var="employee">
					<tr id="${employee.employeeId}">
						<td>${employee.employeeNumber}</td>
						<td>${employee.employeePosition}</td>
						<td><a href="${path}/update/${employee.employeeId}" class="update-employee-btn">${employee.employeeName}</a></td>
						<td>${employee.employeeTel}</td>
						<td>${employee.employeeEmail}</td>
						<td><button type="button" class="btn btn-danger delete-employee-btn" value="${employee.employeeNumber}">X</button></td>
					</tr>
				</c:forEach>
			</table>
			<a href="${path}/insert" class="btn btn-primary">새 직원 등록</a>
			
			<div>
				<form action="${path}/search" method="get" id="search-box">
					<select class="form-select" aria-label="Default select example" name="keyfield">
						<option value="employeeNumber">직원번호</option>
						<option value="employeePosition">직급</option>
						<option value="employeeName">이름</option>
						<option value="employeeTel">전화번호</option>
						<option value="employeeEmail">이메일</option>
					</select>
					<input type="search" class="form-control" name="keyword">
					<input type="submit" class="btn btn-primary" value="검색">
				</form>
			</div>
			
			<nav aria-label="Page navigation example" id="pagenation">
				<ul class="pagination justify-content-center">
					<c:set var="doneLoop" value="false" />
					<c:if test="${(startPage - blockCount) > 0 and userList.size() != 0}">
						<li class="page-item">
							<a class="page-link" href="${URL}?page=${startPage-1}">이전</a>
						</li>
					</c:if>
					<c:forEach var='i' begin='${startPage}' end='${(startPage - 1) + blockCount <= totalPage ? (startPage - 1) + blockCount : totalPage}'>
						<c:if test="${not doneLoop}">
							<li class="page-item"><a class="page-link ${i == page ? 'active' : 'page'}" href="${URL}?page=${i}">${i}</a></li>
						</c:if>
					</c:forEach>
					<c:if test="${(startPage+blockCount) <= totalPage}">
						<li class="page-item">
							<a class="page-link" href="${URL}?${location.search}page=${startPage + blockCount}">다음</a>
						</li>
					</c:if>
				</ul>
			</nav>
		</div>
	</body>
</html>