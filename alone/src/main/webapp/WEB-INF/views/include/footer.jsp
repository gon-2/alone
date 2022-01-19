<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

		<!-- Footer -->
		</section>
				<div id="footer">
					<div class="container">
						<div class="row">
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>수강후기</h3>
								<ul class="links">
								<c:forEach items="${mainList}" var="reviewVo">
									<li><a href="#"> [${reviewVo.cate_code_name}] ${reviewVo.review_title }</a></li>
								</c:forEach>	
									<li><a href="/classInfo/reviewList">더보기</a></li>

								</ul>
							</section>
							<section class="col-3 col-6-narrower col-12-mobilep">
								<h3>수료생 취업현황</h3>
								<ul class="links">
									<li><a href="#">Duis neque nisi dapibus</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum accumsan sed</a></li>
									<li><a href="#">Mattis et sed accumsan</a></li>
									<li><a href="#">Duis neque nisi sed</a></li>
									<li><a href="#">Sed et dapibus quis</a></li>
									<li><a href="#">Rutrum amet varius</a></li>
									<li><a href="/classInfo/reviewList">더보기</a></li>
								</ul>
							</section>
							<section class="col-6 col-12-narrower">
								<h3>상담예약 메일보내기</h3>
								<form>
									<div class="row gtr-50">
										<div class="col-6 col-12-mobilep">
											<input type="text" name="name" id="name" placeholder="Name" />
										</div>
										<div class="col-6 col-12-mobilep">
											<input type="email" name="email" id="email" placeholder="Email" />
										</div>
										<div class="col-12">
											<textarea name="message" id="message" placeholder="Message" rows="5"></textarea>
										</div>
										<div class="col-12">
											<ul class="actions">
												<li><input type="submit" class="button alt" value="메일 보내기" /></li>
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