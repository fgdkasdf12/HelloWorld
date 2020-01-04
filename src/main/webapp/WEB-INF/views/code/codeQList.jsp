<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Hello World!</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/css/mainBase.css">
<link rel="stylesheet" href="/css/projectBase.css" type="text/css" />
<style>
#pageTitle {
	margin-bottom: 20px;
}

#pageTitle h1 {
	display: inline;
	margin-right: 10px;
	font-weight: bold;
}

#pageTitle .btn {
	margin-left: 5px;
}

.table {
	background-color: white;
	padding: 0;
	text-align: center;
}

.table tbody * {
	font-weight: normal;
}

.table tbody td:nth-child(2) {
	font-weight: bold;
}

.table tbody td:nth-child(3) {
	text-align: left;
	cursor: pointer;
}

.table tbody .N {
	color: limegreen;
}

.table tbody .Y {
	color: red;
}

.pComment {
	margin-left: 3px;
	font-size: 13px;
	color: orange;
}

a:hover {
	text-decoration: none;
}
.badge

 

badge-pill

 

badge-success
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/standard/header.jsp" />

	<div id=baseBackgroundColor>
		<div class=container>
			<div class=row>
				<div class="col-12" id=aroundContent></div>
			</div>
		</div>

		<!--      몸통 시작!!!   -->
		<div class=container id="projectPage">
			<div class=row>
				<div class="col-12 d-none d-md-block">
					<div id="pageTitle">
						<table>
							<tr>
								<td colspan="3" style="font-size: 60px; font-weight: 100;">Code-How</td>
								<td></td>
								<td style="font-size: 15px; color: gray;">     코드에 대한 질문을 나누는 게시판입니다.</td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<div class=row>
				<div class="d-md-none">
					<div style="font-size: 60px; font-weight: 100;">Code-How</div>
					<div style="font-size: 15px; color: gray;">코드에 대한 질문을 나누는 게시판입니다.</div>
				</div>
			</div>
				<table class="table table-hover">
					<thead class="thead-light">
						<tr>
							<th scope="col-1">글번호</th>
							<th scope="col-1">구분</th>
							<th scope="col-4">게시판제목</th>
							<th scope="col-1">작성자</th>
							<th scope="col-1">포인트</th>
							<th scope="col-3">날짜</th>
							<th scope="col-1">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${list.size()==0 }">
								<tr>
									<td colspan="8">작성된 글이 없습니다.</td>
								</tr>
							</c:when>
							<c:otherwise>
								<c:forEach items="${list }" var="dto">
									<tr>
										<th scope="row">${dto.seq}</th>
										<td class="badge badge-pill badge-success"
											style="margin: 10; padding: 10; width: 40px;">${dto.division}</td>
										<td><a href="/code/codeDetail.do?seq=${dto.seq }">${dto.title}</a>
											<span class="badge badge-pill badge-danger">N</span></td>
										<td>${dto.writer}  
										 <span class="badge badge-pill badge-info">실무자</span></td>
										<td>${dto.point}</td>
										<td>${dto.writeDate}</td>
										<td>${dto.viewCount}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="text-right">
					<a class="btn btn-primary" href="/code/codeQWrite.do" role="button">글쓰기</a>
				</div>
				<nav aria-label="List navi">
					<ul class="pagination justify-content-center">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li id="page-navi" class="page-item" align="center">${pageNavi}</li>
<!-- 						<li id="page-navi" class="page-item"><a class="page-link" href="#">1</a></li> -->
<!-- 						<li class="page-item active"><a class="page-link" href="#">2</a></li> -->
<!-- 						<li class="page-item"><a class="page-link" href="#">3</a></li> -->
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>

			</div>
			<!--       몸통 끝!!!   -->

			<div class=container>
				<div class=row>
					<div class="col-12" id=aroundContent></div>
				</div>
			</div>
		</div>
		
		<jsp:include page="/WEB-INF/views/standard/footer.jsp" />
</body>
</html>