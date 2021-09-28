<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<main class="main">
	<div class="container">
		<main class="loginMain">
			<!--로그인섹션-->
			<section class="login">
				<!--로그인박스-->
				<article class="login__form__container">
					<!--로그인 폼-->
					<div class="login__form">
						<h1><img src="/images/logo.jpg" alt=""></h1>

						<!--로그인 인풋-->
						<form class="login__input">
							<button type="button" onclick="location.href='/main/showBooth'">대여 하기</button>
							<button type="button" onclick="location.href='/main/showBooth'">부스 위치 확인</button>
						</form>
					</div>
				</article>
			</section>
		</main>
	</div>
</main>
<script src="/js/story.js"></script>
</body>
</html>
