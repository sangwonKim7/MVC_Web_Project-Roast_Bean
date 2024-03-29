<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Roast Bean : My QnA List</title>
  <meta content="" name="description">
  <meta content="" name="keywords">
  <style type="text/css">
  .form-control3 {
	  padding: 0.375rem 0.75rem;
	  font-size: 1rem;
	  font-weight: 400;
  	  line-height: 1em;
  	  text-align-center;
	  color: #212529;
	  background-color: #CFD4D9;
	  background-clip: padding-box;
	  border: 1px solid #ced4da;
	  -webkit-appearance: none;
	  -moz-appearance: none;
	  appearance: none;
	  border-radius: 0.375rem;
	  transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
	  height: 32px; 
	}
  </style>

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Poppins:300,300i,400,400i,600,600i,700,700i|Satisfy|Comic+Neue:300,300i,400,400i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>
<body>
  <!-- ======= Header ======= -->
	<%@include file = "header_innerpage.jsp" %>
  <!-- End Header -->
  <main id="main">
    <!-- ======= Breadcrumbs Section ======= -->
    <section class="breadcrumbs">
      <div class="container">
        <div class="d-flex justify-content-between align-items-center">
			<a class="nav-link scrollto" href="mypage_info.do">My Information</a>
			<a class="nav-link scrollto" href="mypage_order_list.do">My Order List</a>
			<a class="nav-link scrollto" href="myboardlist.do?page=1">My Write</a>
			<a class="nav-link scrollto" href="mypage_qna_list.do"><font color="8784D6" style="font-size: 1.2em; font-weight: bold;">My QnA</font></a>
			&emsp;&emsp;&emsp;
			<ol>
				<li><a href="index.jsp">Home</a></li>
				<li>My page</li>
			</ol>
        </div>
      </div>
    </section><!-- End Breadcrumbs Section -->
    
	<section class="inner-page">
		<div class="container">
				<h3>&nbsp;&nbsp;&nbsp;&nbsp;QnA List</h3>
				<hr style="border: solid 2px red;">
				<br>
				<table class="table table-hover" style="vertical-align: middle;">
					<thead>
						<tr align="center">
							<th style="width: 15%;">문의유형</th>
							<th style="width: 45%;">제목 / 내용</th>
							<th style="width: 10%;">문의번호</th>
							<th style="width: 20%;">작성일 / 수정일</th>
							<th style="width: 10%;">처리상태</th>
						</tr>
					</thead>
					<c:forEach items="${myQnaList}" var="dto">
						<c:if test="${dto.qna_write_title != null }">
							<form action="qna_update_by_user.do" method="post">
								<tr style="background-color: #A3A7AB; height: 2"><td colspan="6"></td></tr>
								<tr align="center">
									<td>${dto.qna_write_category}</td>
									<c:choose>
										<c:when test="${dto.qna_write_comment_content == null }">
											<td align="left" valign="top">
												<input type="text" name="qna_write_title" value="${dto.qna_write_title}" size="50%"><br>
												<textarea rows="4" cols="70%" name="qna_write_content" style="background-color: #F2F1EF">${dto.qna_write_content}</textarea> 
											</td>
										</c:when><c:otherwise>
											<td align="left">
											제목 : ${dto.qna_write_title}<br>
											내용 : ${dto.qna_write_content}
											</td>
										</c:otherwise>
									</c:choose>
									
									<td>${dto.qna_write_seq}<input type="hidden" name="qna_write_seq" value="${dto.qna_write_seq}"></td>
									<td align="left">
										작성일 : ${dto.qna_write_initdate}<br>
										<c:if test="${dto.qna_write_updatedate != null}">
										수정일 : ${dto.qna_write_updatedate}
										</c:if>
									</td>
									<c:choose>
										<c:when test="${dto.qna_write_comment_content == null }">
										<td valign="middle">답변예정<br><br><input type="submit" value="수정하기" class="btn" style="background-color: #F2BCBB"></td>
										</c:when><c:otherwise>
										<td></td>
										</c:otherwise>
									</c:choose>
								</tr>
								
								<c:if test="${dto.qna_write_comment_content != null}">
								<tr align="center" style="background-color: #F2F1EF;">
									<td align="right" valign="top">ㄴ</td>
									<td align="left">${dto.qna_write_comment_content}</td>
									<td></td>
									<td align="left">
										작성일 : ${dto.qna_write_comment_initdate}<br>
										<c:if test="${dto.qna_write_comment_updatedate != null}">
										수정일 : ${dto.qna_write_comment_updatedate}
										</c:if>
									</td>
									<c:choose>
									<c:when test="${dto.qna_write_comment_content == null }">
									<td>답변예정</td>
									</c:when><c:otherwise>
									<td>답변완료</td>
									</c:otherwise>
									</c:choose>
								</tr>
								</c:if>
							</form>
							
						</c:if>
					</c:forEach>
				</table>
					<div align="right">
						<button class="btn mr-3" type="button" style="background-color: #D0D4D8" onclick="location.href='cs_qna.jsp'">질문하러 가기</button>
					</div>
				<%-- ******** 페이징부분 아직 적용안됐음 ******** --%>
			 	<%-- <div class="container" align="center">
				<table>
					<tr>
						<td align="center" colspan="6">
						<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								[ 처음 ]
							</c:when>
							<c:otherwise>
								<a href="productDetail.do?page=1&product_id=${productDetail.product_id}">[ 처음 ]</a>
							</c:otherwise>
							</c:choose>
							<!-- 이전 -->
							<c:choose>
							<c:when test="${(page.curPage - 1) < 1 }">
								[ 이전 ]
							</c:when>
							<c:otherwise>
								<a href="productDetail.do?page=${page.curPage - 1 }&product_id=${productDetail.product_id}">[ 이전 ]</a>
							</c:otherwise>
							</c:choose>
							
							<!-- 개별 페이지 -->
							<c:forEach var="fEach" begin="${page.startPage }" end="${page.endPage }" step="1">
								<c:choose>
								<c:when test="${page.curPage == fEach}">
									&nbsp; [ ${fEach } ] &nbsp;
								</c:when>
								<c:otherwise>
									<a href="productDetail.do?page=${fEach }&product_id=${productDetail.product_id}">[ ${fEach } ]</a>&nbsp;
								</c:otherwise>
								</c:choose>
							</c:forEach>
							
							<!-- 다음 -->
							<c:choose>
							<c:when test="${(page.curPage + 1) > page.totalPage }">
								[ 다음 ]
							</c:when>
							<c:otherwise>
								<a href="productDetail.do?page=${page.curPage + 1 }&product_id=${productDetail.product_id}">[ 다음 ]</a>
							</c:otherwise>
							</c:choose>
							<!-- 끝 -->
							<c:choose>
							<c:when test="${page.curPage == page.totalPage }">
								[ 마지막 ]
							</c:when>
							<c:otherwise>
								<a href="productDetail.do?page=${page.totalPage }&product_id=${productDetail.product_id}">[ 마지막 ]</a>
							</c:otherwise>
						</c:choose>
						</td>
					</tr>
				</table>
				</div> --%>
				<%-- ******** 페이징부분 아직 적용안됐음 ******** --%>
			</div>
	</section>
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
	<%@include file = "footer.jsp" %>
  <!-- End Footer -->

  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>