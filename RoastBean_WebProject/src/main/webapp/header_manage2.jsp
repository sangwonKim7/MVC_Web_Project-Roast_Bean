<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<link href="https://use.fontawesome.com/releases/v5.0.1/css/all.css" rel="stylesheet">
<style>
    .badge2:after{
        content:attr(value);
        font-size:16px;
        color: #fff;
        background: red;
        border-radius:50%;
        padding: 0 5px;
        position:relative;
        left:-8px;
        top:-10px;
        opacity:0.9;
    }
</style>
<!-- ======= Top Bar ======= -->
<section id="topbar" class="d-flex align-items-center fixed-top ">
	<div
		class="container-fluid container-xl d-flex align-items-center justify-content-center justify-content-lg-start">
		<i class="bi bi-phone d-flex align-items-center"><span>02-3687-7577</span></i>
		<i class="bi bi-clock ms-4 d-none d-lg-flex align-items-center"><span>Mon-Sat:
				10:00 AM - 18:00 PM</span></i>
	</div>
</section>
<!-- ======= Header ======= -->
<header id="header" class="fixed-top d-flex align-items-center ">
	<div class="container-fluid container-xl d-flex align-items-center justify-content-between">
		<div class="col-lg-4">
			<h1>
				<a href="index.jsp"><img src="assets/img/logo.png" alt="" class="img-fluid" width="320" height="72"></a>
			</h1>
		</div>
		<nav id="navbar" class="navbar order-last order-lg-0">
		
				<ul>
					
					<li class="dropdown"><a href="ManageMain.do"><span>MANAGE MAIN</span></a>
					<ul>
						<li><a href="manage_chart.do">CHART</a></li>
					</ul> 
					
					<li><a class="nav-link scrollto" href="UserListSelect.do">USER LIST</a></li>
				
				<li class="dropdown"><a href="ManageProductList.do"><span>PRODUCT LIST</span></a>
				   <ul>
				      <li><a href="manage_product_insert.jsp">PRODUCT INSERT</a></li>
				   </ul>
				   <li><a class="nav-link2 scrollto" href="ManageOrdersList.do">ORDERS LIST</a></li>
				   <li class="dropdown"><a href="#customer_service"><span>CUSTOMER SERVICE</span></a>
					<ul>
						<li><a href="notice_list.do">NOTICE</a></li>	
						<li><a href="cs_faq.jsp">FAQ</a></li>
						<li><a href="qna_list_by_admin.do">QnA</a></li>
					</ul> 
				   
					<li>&emsp;&emsp;</li>
				</ul>
		
				<ul>
						<li><a class="nav-link scrollto" href="mypage_info.do"><font color="#F2BCBB" style="font-size: 0.9em">${NICK}님</font></a></li>
					
					<c:choose>
						<c:when test="${API eq null}">
							<li><a class="nav-link scrollto" href="logout.do"><font style="font-size: 0.9em">Logout</font></a></li>
						</c:when>
						<c:otherwise>
							<li><a class="nav-link scrollto" href="logout.do" onclick="signOut()"><font style="font-size: 0.9em">Logout</font></a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			<%-- </c:if>	  --%>
			<i class="bi bi-list mobile-nav-toggle"></i>
		</nav>
	</div>
	
	<!-- Google Login API -->
	<script>
	    function signOut() {
	        google.accounts.id.disableAutoSelect();
	        // do anything on logout
	        location.reload();
    		//document.location = "index.jsp";
	    }
	</script>
	<script src="https://accounts.google.com/gsi/client" async defer></script>
    
</header>