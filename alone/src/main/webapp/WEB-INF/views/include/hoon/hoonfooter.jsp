<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/digitClock.js"></script>
</head>
<body>
	   <!--  Footer -->
	   <div>
       <footer class="sticky-footer bg-white">
           <div class="container my-auto">
               <div class="copyright text-center my-auto">
                 <!-- 수강신청 게시판 Search -->
			     <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="/customer_main/classFindTitle">
			         <div class="input-group" style="float:left;">
			             <input type="text" name="class_board_title" class="form-control bg-light border-0 small" placeholder="수강신청 게시글 제목을 검색하세요."
			                 aria-label="Search" aria-describedby="basic-addon2" style="width: 350px;">
			             <div class="input-group-append">
			             	<button type="submit" class="btn btn-sm btn-info" style="width:50px;">검색</button>
			             </div>
			         </div>
			     </form>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                 <!-- 건의사항 게시판 Search -->
			     <form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" action="/customer_main/inquiryFindTitle">
			         <div class="input-group" style="float:left;">
			             <input type="text" name="inquiry_title" class="form-control bg-light border-0 small" placeholder="건의사항 게시글 제목을 검색하세요."
			                 aria-label="Search" aria-describedby="basic-addon2" style="width: 350px;">
			             <div class="input-group-append">
			             	<button type="submit" class="btn btn-sm btn-info" style="width:50px;">검색</button>
			             </div>
			         </div>
			     </form>
               </div>
           </div>
       </footer>
       <!-- End of Footer -->
        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">로그아웃 하시겠습니까?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="/">로그아웃</a>
                </div>
            </div>
        </div>
    </div>
    
    
    




    <!-- Custom scripts for all pages-->
    <script src="/js/sb-admin-2.min.js"></script>
<!-- 
    Page level plugins
    <script src="/vendor/chart.js/Chart.min.js"></script>

    Page level custom scripts
    <script src="/js/demo/chart-area-demo.js"></script>
    <script src="/js/demo/chart-pie-demo.js"></script>
	
 -->
 </body>
</html>