<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
<title>수강신청 특정 게시판 페이지</title>
<script>
	$(function(){
		// 댓글 입력하기 버튼 클릭하면 모달 버튼 show
		$("#inComment").click(function(e){
			e.preventDefault();
			$("#modal-247369").trigger("click");
		});
		// 댓글 저장 버튼 입력시 이벤트
 		$("#btncommentSave").click(function(e){
			e.preventDefault();
			var class_board_comment_userid = $("#class_board_comment_userid").val();
			var class_board_comment_content = $("#class_board_comment_content").val();
 			var class_board_comment_no = $("#class_board_comment_no").val();
 			// 요청 경로
			var url = "/comment/insertcomment";				
			var sendData = {
 					"class_board_comment_no" : class_board_comment_no,
					"class_board_comment_userid" : class_board_comment_userid,
					"class_board_comment_content" : class_board_comment_content
			};	
			
			
 			// 댓글 유효성 검사
 			if(class_board_comment_userid == "" || class_board_comment_userid.length == 0 || class_board_comment_userid.length >= 51){
 				alert("아이디를 입력 하세요. 길이는 50바이트 까지 입니다.");
 				return false;
 			}else if(class_board_comment_content == "" || class_board_comment_content.length == 0 || class_board_comment_content.length >= 301){
 				alert("댓글을 입력하세요. 길이는 300바이트 까지 입니다.");
 				return false;
 			}else if(class_board_comment_no.length == 0){
 				alert("번호를 입력하세요.");
 				return false;
 			}
 			
			$.post(url , sendData , function(rData){
				if(rData == "success"){
					alert("댓글이 입력되었습니다");	
				}
			});
			
			$("#btnCancel").trigger("click");
 			
		});
		
 		// 댓글 보기버튼 클릭 시 이벤트
 		$("#showComment").click(function(e){
 			e.preventDefault();
  			$("#modal-991051").trigger("click");
		});
 		
 		// 댓글 보기버튼 클릭시 이벤트
 		$("#showbtn").click(function(e){
 			e.preventDefault();
 			var class_board_number = $("#class_board_number").val();
 			
 			var url = "/comment/listComment";
 			
 			var sendData = {
 				"class_board_number" : class_board_number	
 			};
 			
 			// 유효성 검사
 			if(class_board_number == ""){
 				alert("댓글을 보기위해 해당 글의 번호를 입력하세요.");
 				return false;
 			}
 				
 			$.get(url , sendData, function(rData){
 				console.log(rData);
 				if(rData == ""){
 					alert("해당하는 댓글이 없습니다.")
 					return false;
 				}
 				$.each(rData , function(){
 	 				$("#first_userid").html("<h4>상담자 : " + this.class_board_comment_userid + "</h4>");
 	 				$("#first_content").html("<h4>내용 : " + this.class_board_comment_content + "</h4>");
 	 				$("#first_date").html("<h4>게시일 : " + changeDateString(this.class_board_comment_date) + "</h4>"); 
 				});	
 				$("#showAni").fadeIn(1000);
 			});
 			$("#closebtn").trigger("click");
 		});
 		// 댓글 삭제 버튼 클릭시 이벤트
 		$("#deleteComment").click(function(e){
 			e.preventDefault();
 			$("#modal-162465").trigger("click");
 		});
 		
 		$("#deletecomments").click(function(e){
			var url = "/comment/deleteComment";
 			var class_board_number = $("#class_board_number").val();
 			
 			var sendData = {
 					"class_board_number" : class_board_number
 			};
 			
 			// 유효성 검사
 			if(class_board_number == ""){
 				alert("댓글을 삭제하기 위해 글 번호를 입력하세요.");
 				return false;
 			}
 			
 			$.post(url , sendData , function(rData){
 				console.log(rData);
 				if(rData == "success"){
 					$("#first_userid").val("");
 					$("#first_content").val("");
 					$("#first_date").val("");
 					$("#showAni").fadeOut(1000);
 					$("#cancel").trigger("click");
 					alert("삭제되었습니다!");
 				}
 			});
 		});
  			
 		// 게시글 수정 버튼 클릭 시 이벤트
 		$("#modcontent").click(function(e){
 			e.preventDefault();
 			console.log("수정버튼 클릭됨");
 			
 			$("#modal-258563").trigger("click"); 			
 		});
 		// 수정 저장 버튼 클릭 시 이벤트
 		$("#btnModInfoSave").click(function(e){
 			e.preventDefault();
 			var class_board_content = $("#class_board_content").val();
 			var class_board_title = $("#class_board_title").val();
 			var class_board_userid = $("#class_board_userid").val();
 			var url = "/class_board/modcontent";
 			
 			// 유효성 검사
 			if(class_board_content == "" || class_board_content.length == 0 || class_board_content.length >= 3001){
 				alert("글 내용을 다시 입력하세요 , 길이는 3000바이트 까지 입니다.");
 				return false;
 			}else if(class_board_title == "" || class_board_title.length == 0 || class_board_title.length >= 301){
 				alert("글 제목을 다시 입력하세요 , 길이는 300바이트 까지 입니다.");
 				return false;
 			}else if(class_board_userid == "" || class_board_userid.length == 0 || class_board_userid.length >= 51){
 				alert("글 작성자를 다시 입력하세요 , 길이는 50바이트 까지 입니다.");
 				return false;
 			}
 		
 			var sendData = {
 				"class_board_content" : class_board_content,
 				"class_board_title" : class_board_title,
 				"class_board_userid" : class_board_userid
 			};
 			
 			// 수정 후 리스트 페이지로 이동
 			$.post(url , sendData , function(rData){
 				console.log(rData);
 				location.href = "/class_board/class_regist";
 			});
 		});
 		
 		// 글자 수 세기
 		$("#class_board_content").on("keyup" , function(){
 			var class_board_content = $(this).val().length;
 			$("#test-cnt").html("(" + class_board_content + " / 3000)");
 			
 			if(class_board_content > 3000){
				 $(this).val($(this).val().substring(0, 3000));
				 $("#test-cnt").html("(3000 / 3000)");
 			}
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
	
	// 바이트 수 계산하기
    function fnChkByte(obj, maxByte){
        var str = obj.value;
        var str_len = str.length;
 
        var rbyte = 0;
        var rlen = 0;
        var one_char = "";
        var str2 = "";
 
        for(var i=0; i<str_len; i++){
            one_char = str.charAt(i);
            if(escape(one_char).length > 4){
                rbyte += 2;    //한글2Byte
            }else{
                rbyte++;    //영문 등 나머지 1Byte
            }
 
            if(rbyte <= maxByte){
                rlen = i+1;    //return할 문자열 갯수
            }
        }
 
        if(rbyte > maxByte){
            alert("한글 " +"1699자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
            str2 = str.substr(0,rlen);    //문자열 자르기
            obj.value = str2;
            fnChkByte(obj, maxByte);
        }else{
          	document.getElementById('byteInfo').innerText = "바이트 수 : " + rbyte;
            document.getElementById('byteInfos').innerText = "바이트 수 : " + rbyte;
        }
    }
	
</script>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-162465" href="#modal-container-162465" role="button" class="btn" data-toggle="modal" style="display: none">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-162465" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">댓글을 삭제할 번호를 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<input type="number" name="class_board_number" id="class_board_number" value="${registboardvo.class_board_number}">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="deletecomments">댓글 삭제</button> 
							<button type="button" class="btn btn-secondary" id="cancel" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-247369" href="#modal-container-247369" role="button" class="btn" data-toggle="modal" style="display: none;">Launch demo modal</a>	
			<div class="modal fade" id="modal-container-247369" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">관리자님 , 댓글을 입력하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="class_board_comment_userid">아이디 입력</label>
							<input type="text" name="class_board_comment_userid" id="class_board_comment_userid" placeholder="아이디를 입력하세요." value="${sessionScope.memberVo.userid}"><br>
							<label for="class_board_comment_content">댓글 입력</label><br>
							<textarea name="class_board_comment_content" id="class_board_comment_content" placeholder="댓글을 입력하세요." onkeyup="fnChkByte(this, 300)"></textarea><span id="byteInfo">바이트수 : 0</span>	<br>
							<label for="class_board_comment_no">글 번호 입력</label>
							<input type="number" name="class_board_comment_no" id="class_board_comment_no" placeholder="현재 글번호를 입력하세요." >
							<input type="hidden" name="class_board_comment_date" id="class_board_comment_date">
						</div>
						<div class="modal-footer"> 
							<button type="button" class="btn btn-primary" id="btncommentSave">댓글 저장</button> 
							<button type="button" class="btn btn-secondary" id="btnCancel" data-dismiss="modal">취소</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-258563" href="#modal-container-258563" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-258563" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">상담제목과 상담 내용을 수정하세요.</h5> 
							<button type="button" class="close" data-dismiss="modal">
								<span aria-hidden="true">×</span>
							</button>
						</div>
						<div class="modal-body">
							<label for="class_board_userid">아이디</label>
							<input type="text" id="class_board_userid" name="class_board_userid" value="${registboardvo.class_board_userid}" readonly="readonly"><br>
							<label for="class_board_title">상담글 제목 입력</label>
							<input type="text" name="class_board_title" id="class_board_title" placeholder="글 제목을 입력하세요." value="${registboardvo.class_board_title}"><br>
							<label for="class_board_content">상담글 내용 입력</label><div id="test-cnt">(0 / 3000)</div><br>
							<textarea name="class_board_content" id="class_board_content" placeholder="글 내용을 입력하세요." onkeyup="fnChkByte(this, 3000)"></textarea>
							<span id="byteInfos">바이트수 : 0</span>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="btnModInfoSave">수정 저장</button> 
							<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
						</div>
					</div>
				</div>
			</div>		
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>${registboardvo.class_board_userid}님의   글번호 ${registboardvo.class_board_number}번 수강 신청 상담글입니다.</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/class_board/class_regist">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" action="/class_board/deleteBoard" method="post">
				<div class="form-group">
					<label for="class_board_title">상담 제목</label>
					<input type="text" class="form-control" id="class_board_title" name="class_board_title" style="width:300px;" readonly="readonly" value="${registboardvo.class_board_title}"/>
				</div>
				<div class="form-group">
					<label for="class_board_enroll">수강 과정</label><br>
					<input type="text" class="form-control" id="class_board_enroll" name="class_board_enroll" style="width:300px;" readonly="readonly" value="${registboardvo.class_board_enroll}"/>
				</div>
				<div class="form-group">
					<label for="class_board_content">상담 내용</label><br>
					<textarea style="width:300px; height:100px;"  id="class_board_content" name="class_board_content" readonly="readonly">${registboardvo.class_board_content}</textarea>
				</div>
				
        <c:choose>
            <c:when test="${empty sessionScope.memberVo}">
       	    </c:when>
       	    <c:when test="${sessionScope.memberVo.userid == 'service_center_admin'}">
  	    		<button type="button" class="btn btn-warning" id="inComment">상담자 댓글달기</button>
       	    </c:when>     
		</c:choose>
		<c:if test="${sessionScope.memberVo.userid == registboardvo.class_board_userid}">
				<button type="button" class="btn btn-primary" id="modcontent">수정</button>
				<button type="submit" class="btn btn-danger" id="deleteBoard">삭제</button>
		</c:if>
		<c:if test="${empty sessionScope.memberVo}">
		</c:if>
				<!-- <button type="button" class="btn btn-warning" id="inComment" style="display: none;">상담자 댓글달기</button> -->
				<button type="button" class="btn btn-secondary" id="showComment">댓글보기</button>
			</form> 
		</div>
	</div>
</div><br><br>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			 <a id="modal-991051" href="#modal-container-991051" role="button" class="btn" data-toggle="modal" style="display:none;">Launch demo modal</a>
			
			<div class="modal fade" id="modal-container-991051" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
				<div class="modal-dialog" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="myModalLabel">댓글보기</h5> 
						</div>
						<div class="modal-body">
							<label for="class_board_number"></label>
							<input type="number" name="class_board_number" id="class_board_number" placeholder="게시판 글번호 입력">
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="showbtn">show</button> 
							<button type="button" class="btn btn-secondary" id="closebtn" data-dismiss="modal">Close</button>
						</div>
					</div>
					
				</div>
				
			</div>
			
		</div>
	</div>
</div>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<form>
				<div id="showAni" style="display: none;">
					<p id="first_userid" class="first_userid"></p>
					<p id="first_content" class="first_content"></p>
					<p id="first_date" class="first_date"></p>
					<c:choose>
						<c:when test="${sessionScope.memberVo.userid == registboardvo.class_board_userid || sessionScope.memberVo.userid == 'service_center_admin'}">
							<button type="button" id="deleteComment" class="btn btn-warning">댓글 삭제</button>
						</c:when>
						<c:otherwise>
						</c:otherwise>
					</c:choose>
				</div>
			</form>
		</div>
	</div>
</div> 
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>

