<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
<script type="text/javascript">
$(function(){
	$(".f_course").click(function(e) {
		e.preventDefault();
		var fno = $(this).attr("href");
// 		console.log(fno);
		var f_url = "/employ/findPosition?fno=" + fno;
	    var f_name = "pop";
	    var option = "width=1300,height=800,history=no,resizable=no,status=no,scrollbars=yes,menubar=no";
		window.open(f_url, f_name, option);
	});

});

(function() {
	emailjs.init("user_ushn98S0NY4Wd6onKlTkr");
})();

$(document).ready(function() { emailjs.init("user_ushn98S0NY4Wd6onKlTkr");		
	
    $('input[name=submit]').click(function(){     
    	var name = $('input[name=name]').val();
    	var phone = $('input[name=phone]').val();
    	var email = $('input[name=email]').val();
    	var message = $('textarea[name=message]').val();
      
      var templateParams = {	
            "name": name,
            "phone" :phone, 
            "email" : email,
            "message" : message
     	};
                
   	if(name == "" || phone == "" || email == "" || message == ""){
   		alert("이름, 전화번호, 메일, 내용 중  기입되지 않은 항목이 있습니다.");
   		return false;
   	}
            	
     emailjs.send('gmail', 'template_spqvfig', templateParams)
     	    .then(function(response) {
     	       console.log('SUCCESS!', response.status, response.text);
     	       alert("메일 전송을 성공하였습니다.");
     	       location.href = '/';
     	    }, function(error) {
     	       console.log('FAILED...', error);
     	       alert("메일 전송을 실패하였습니다.");
     	    });
     	       
		$("")

    });
    
  });
</script>
		<!-- Footer -->
		</section>
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>수강후기</h3>
								<ul class="links">
								<c:forEach items="${mainList}" var="reviewVo">
									<li><a href="/classInfo/reviewContent?review_number=${reviewVo.review_number}"> [${reviewVo.cate_code_name}] ${reviewVo.review_title }</a></li>
								</c:forEach>	
									<li><a href="/classInfo/reviewList">더보기</a></li>
								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>수료생 취업현황</h3>
								<ul class="links">
									<c:forEach items="${findList}" var="findVo">
										<li><a class="f_course" href="${findVo.fno}"> [${findVo.fname}] ${findVo.company}</a></li>
									</c:forEach>
									<li><a href="/employ/findPositionList">더보기</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>상담예약 메일보내기</h3>
								<form >
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" required="required"/>
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" required="required"/>
										</div>
										<div class="col-12-mobilep">
											<input type="text" name="phone" id="phone" placeholder="Phone" required="required"/>
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5" required="required"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="button" name="submit"class="button alt" value="메일 보내기" /></li>
											</ul>
										</div>
									</div>
								</form>
							</section>
						</div>
					</div>


					<!-- Copyright -->
						<div class="copyright">
							<ul class="menu">
								<li>&copy; Untitled. All rights reserved</li><li>Design: 만재없는 만재팀</li>
							</ul>
						</div>

				</div>
		

		<!-- Scripts -->												
		<script src="/assets/js/jquery.min.js"></script>
		<script src="/assets/js/jquery.dropotron.min.js"></script>
		<script src="/assets/js/browser.min.js"></script>
		<script src="/assets/js/breakpoints.min.js"></script>
		<script src="/assets/js/util.js"></script>
		<script src="/assets/js/main.js"></script>
	</body>
</html>