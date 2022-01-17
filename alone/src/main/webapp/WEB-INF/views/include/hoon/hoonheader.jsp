<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <!-- Bootstrap core JavaScript-->
    <script src="/vendor/jquery/jquery.min.js"></script>
    <script src="/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/vendor/jquery-easing/jquery.easing.min.js"></script>
	
    <!-- Custom fonts for this template-->
    <link href="/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/css/sb-admin-2.min.css" rel="stylesheet">
    <script>
    	$(function(){
    		$("#Clickmessages").click(function(e){
    			console.log("클릭됨");
    			e.preventDefault();
    		});
    		$("#check").click(function(e){
    			e.preventDefault();
    			$("#check").prop("click" , false);
    		 	var service_message_receiver = $("#service_message_receiver").val();
    		 	var sendData = {
    		 			"service_message_receiver" : service_message_receiver
    		 	};
    		 	var url = "/recieveMessage";
    		 	
    		 	$.get(url , sendData , function(rData){
    		 		e.preventDefault();
    		 		console.log(rData);
    		 		$.each(rData , function(i){
    		 			$("#message_count").text(this.service_message_count);
    		 			$("#messageContent").text(this.service_message_sender + "님의 메시지입니다.");
    		 			$("#messageDate").html(this.service_message_content + "<br>" + changeDateString(this.service_message_date));
    		 		});
    			});
    		});
    	});
    	
    	function changeDateString(timestamp){
    		var dateF = new Date(timestamp);
    		
    		var year = dateF.getFullYear();
    		var month = make2digits(dateF.getMonth() + 1);
    		var date = make2digits(dateF.getDate());
    		var hour = make2digits(dateF.getHours());
    		var minute = make2digits(dateF.getMinutes());
    		var second = make2digits(dateF.getSeconds());
    		var dateString = year + "-" + month + "-" + date + "-" + hour + ":" + minute + ":" + second;
    		return dateString;
    	}
    	
    	function make2digits(num){
    		if(num < 10){
    			num = "0" + num;
    		}
    		return num;
    	}
    </script>
</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/customer_main/home">
                <div class="sidebar-brand-text mx-3">고객센터</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item active">
                <a class="nav-link" href="/">
                    <i class="fa fa-star" aria-hidden="true"></i>
                    <span>메인 홈페이지</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading">질문과 답변</div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="/customer_main/qna" data-toggle="collapse" data-target="#collapseTwo"
                    aria-expanded="true" aria-controls="collapseTwo">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>Q & A</span>
                </a>
                <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
                    <div class="bg-white py-2 collapse-inner rounded">
                        <h6 class="collapse-header">질문과 답변</h6>
                        <a class="collapse-item" href="/customer_main/faq">자주 묻는 질문</a>                        
                        <a class="collapse-item" href="/class_board/class_regist">수강신청</a>
                        <a class="collapse-item" href="/inquiry/listall">건의사항</a>
                    </div>
                </div>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!--  Nav Item - Charts -->
<!--             <li class="nav-item">
                <a class="nav-link" href="/customer_main/notice">
                    <i class="fa fa-users" aria-hidden="true"></i>
                    <span>공지 사항</span></a>
            </li> -->
            
            <li class="nav-item">
                <a class="nav-link" href="/customer_main/consultmessage">
                    <i class="fas fa-coffee"></i>
                    <span>수강생 상담</span></a>
            </li>
           
     
            <li class="nav-item" style="padding-top:18px;">
     		    <c:choose>
                 	<c:when test="${empty sessionScope.memberVo}">
                 		<a class="nav-link" href="/login_form">로그인</a>
                 		<a href="/Regist/form" class="nav-link">회원가입</a>
                 	</c:when>
                 	<c:otherwise>
                 		<a class="nav-link" href="/logout" align="center">로그아웃</a>
                 	</c:otherwise>
                </c:choose> 
           	</li> 
            
	

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>
            
 	        <!-- 디지털 시계 -->
 		    <div id="date" align="center" style="color:yellow;"></div>
            <div id="time" align="center" style="color:yellow;"></div>

            <!-- Sidebar Message -->
<!--             <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="/img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div> -->

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
            		<c:choose>
                    	 <c:when test="${empty sessionScope.memberVo}">

                     	 </c:when>
                     	<c:when test="${sessionScope.memberVo.userid == 'service_center_admin'}"><h1 align="center">관리자님 환영합니다!</h1></c:when>
                     	<c:otherwise>
                     		<h1>${sessionScope.memberVo.userid}님 환영합니다!</h1>
                     	</c:otherwise>
                    </c:choose> 
                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>


                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                        <li class="nav-item dropdown no-arrow d-sm-none">
                            <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-search fa-fw"></i>
                            </a>
                            
                            <!-- Dropdown - Messages -->
                            <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                aria-labelledby="searchDropdown">
                                <form class="form-inline mr-auto w-100 navbar-search">
                                    <div class="input-group">
                                        <input type="text" class="form-control bg-light border-0 small"
                                            placeholder="Search for..." aria-label="Search"
                                            aria-describedby="basic-addon2">
                                        <div class="input-group-append">
                                            <button class="btn btn-primary" type="button">
                                                <i class="fas fa-search fa-sm"></i>
                                            </button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </li>

                        <!-- Nav Item - Alerts -->
                        <li class="nav-item dropdown no-arrow mx-1">
<!--                             <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="fas fa-bell fa-fw"></i>
                                Counter - Alerts
                                <span class="badge badge-danger badge-counter">3+</span>
                            </a> -->
                            <!-- Dropdown - Alerts -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="alertsDropdown">
                                <h6 class="dropdown-header">
                                    Alerts Center
                                </h6>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-primary">
                                            <i class="fas fa-file-alt text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 12, 2019</div>
                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-success">
                                            <i class="fas fa-donate text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 7, 2019</div>
                                        $290.29 has been deposited into your account!
                                    </div>
                                </a>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="mr-3">
                                        <div class="icon-circle bg-warning">
                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                        </div>
                                    </div>
                                    <div>
                                        <div class="small text-gray-500">December 2, 2019</div>
                                        Spending Alert: We've noticed unusually high spending for your account.
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                            </div>
                        </li>

                        <!-- Nav Item - 상담 메시지 -->
                         <li class="nav-item dropdown no-arrow mx-1">
                            <a class="nav-link dropdown-toggle" href="#" id="Clickmessages" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                           <c:choose>
                           		<c:when test="${empty sessionScope.memberVo}"></c:when>
                                <c:otherwise>
                                	<i class="fas fa-envelope fa-fw"></i>메시지
                                </c:otherwise>
                           </c:choose>
                            </a>
                            <!--  Dropdown - Messages -->
                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="messagesDropdown">
                                <h6 class="dropdown-header">상담 메시지</h6>
                                <input type="text" id="service_message_receiver" name="service_message_receiver" placeholder="사용자 아이디를 입력">
                                <button type="button" id="check">확인</button>
                                <a class="dropdown-item d-flex align-items-center" href="#">
                                    <div class="font-weight-bold" id="messagelist">
                                        <div class="text-truncate" id="messageContent"></div>
                                        <div class="small text-gray-500" id="messageDate"></div>
                                    </div>
                                </a>
                                <a class="dropdown-item text-center small text-gray-500" id="messageList" href="/messageList">메시지 더 보기</a>
                            </div>
                        </li>

                        <div class="topbar-divider d-none d-sm-block"></div>

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">

                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"></span>
                                <img class="img-profile rounded-circle"
                                    src="/img/undraw_profile.svg">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="#">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    	내 정보
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="/logout" data-toggle="modal" data-target="#logoutModal">로그아웃
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                </a>
                            </div>
                        </li>
                         <li class="nav-item" style="padding-top:18px;">
	                  		<c:choose>
	                           <c:when test="${empty sessionScope.memberVo}">
	                           		<a href="/login_form" class="btn btn-success">로그인</a>
	                           		<a href="/Regist/form" class="btn btn-warning">회원가입</a>
	                           	</c:when>
	                           	<c:otherwise>${sessionScope.memberVo.userid}(${sessionScope.memberVo.username})</c:otherwise>
                           </c:choose> 
                       	</li>
                    </ul>

                </nav>
