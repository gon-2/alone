<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
    
<%@ include file="/WEB-INF/views/include/hoon/hoonheader.jsp" %>
<head>
	<title>수강신청 게시판 페이지</title>
<script type="text/javaScript">
	// 유효성 검사
	function checkValue(){
		var class_board_userid_getid = document.getElementById("class_board_userid");
		var class_board_title_getid = document.getElementById("class_board_title");
		var class_board_content_getid = document.getElementById("class_board_content");
		var frmReg = document.frmReg;
		
		var class_board_userid_value = class_board_userid_getid.value;
		var class_board_title_value = class_board_title_getid.value;
		var class_board_content_value = class_board_content.value;
		
		if(class_board_userid_value == "" || class_board_userid_value.length == 0 || class_board_userid_value.length >= 51){
			alert("아이디의 길이는 총 50byte 까지 입니다.");
			return false;
		}else if(class_board_title_value == "" || class_board_title_value.length == 0 || class_board_title_value.length >= 301){
			alert("제목의 길이는 총 300byte 까지 입니다.");
			return false;
		}else if(class_board_content_value == "" || class_board_content_value.length == 0 || class_board_content_value.length >= 3001){
			alert("내용의 길이는 총 3000byte 까지 입니다.");
			return false;
		}else{
			frmReg.action = "/class_board/run";
			frmReg.method = "post";
			frmReg.submit();
		}
	}
	
	// 바이트 계산
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
        }
    }
	
	$(function(){
		// 글자 수 세기
		$("#class_board_content").on('keyup' , function(){
			/* console.log($(this).val().length); */
			$("#test-cnt").html("글자수 : " + "(" + $(this).val().length + " / 3000)");
			
			if($(this).val().length > 3000) {
				 $(this).val($(this).val().substring(0, 3000));
				 $("#test-cnt").html("(3000 / 3000)");
			}
		});
	});
</script>
</head>
<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="jumbotron" align="center">
				<h2>수강신청 게시판 글 올리기</h2>
				<p>
					<a class="btn btn-primary btn-large" href="/class_board/class_regist">목록으로</a>
				</p>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-12">
			<form role="form" name="frmReg">
				<div class="form-group">		 
					<label for="class_board_userid">아이디</label>
					<input type="text" class="form-control" id="class_board_userid" name="class_board_userid" style="width:200px;" value="${sessionScope.memberVo.userid}"/>
				</div>
				<div class="form-group">
					<label for="class_board_title">상담 제목</label>
					<input type="text" class="form-control" id="class_board_title" name="class_board_title" style="width:300px;" placeholder="상담 제목 입력"/>
				</div>
				<div class="form-group">
					<label for="class_board_enroll">상담할 수강 과정 선택</label><br>
					<select id="class_board_enroll" name="class_board_enroll">
						<option value="주간반">주간반</option>
						<option value="야간반">야간반</option>
						<option value="주말반">주말반</option>
					</select>
				</div>
				<div class="form-group">
					<label for="class_board_content">상담 내용</label><br> <div id="test-cnt">글자수 : (0/3000)</div>  
					<textarea style="width:300px; height:100px;" placeholder="상담할 내용을 입력하세요." id="class_board_content" name="class_board_content" onkeyup="fnChkByte(this, 3000)"></textarea>&nbsp;<span id="byteInfo">바이트수 : 0</span>	
				</div>
				
				<button type="submit" class="btn btn-primary" onclick="checkValue();">게시</button>
				<button type="reset" class="btn btn-success">다시 입력</button>
			</form> 
		</div>
	</div>
</div>
<%@ include file="/WEB-INF/views/include/hoon/hoonfooter.jsp" %>