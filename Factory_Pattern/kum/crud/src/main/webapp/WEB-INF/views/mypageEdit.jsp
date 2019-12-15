
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<c:import url="/WEB-INF/common/Top.jsp" />

<html>
<head>
<meta charset="utf-8">
<title>CSS</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/5.0.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.5.0/css/all.css">
<!-- Bootstrap -->
<link href="../plugin/bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- font awesome -->
<link
	href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css"
	rel="stylesheet">
<!-- Custom style -->
<link rel="stylesheet" href="../plugin/bootstrap/css/style.css"
	media="screen" title="no title" charset="utf-8">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
        <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="../plugin/bootstrap/js/bootstrap.min.js"></script>
<script src="../config/js/join.js"></script>

<script type="text/javascript">
	function check() {
		var id = document.getElementById("id");

	}

</script>

<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>
</head>
<body>
<c:set var="member" value="${requestScope.member}"></c:set>
	<div class="container" style="margin-top: 30px;min-height:600px">
		
			<div class="col-md-6 col-md-offset-3" style="margin-bottom: 20px">
				<h3> 나의 정보 수정  </h3>
			</div>
		
		<div class="col-sm-6 col-md-offset-3">
			<form role="form" action="mypageEditok.me" method="post" >
				<div class="form-group">
					<label for="InputEmail">이메일 주소</label> <input type="email"
						class="form-control" id="id" name="id" placeholder="" value = "${member.userid}" readonly >
				</div>
				<div class="form-group">
					<label for="inputPassword">비밀번호</label> <input type="password"
						class="form-control" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요" value = "${member.pwd}">
				</div>
				
				<div class="form-group">
					<label for="inputMobile"> 생년월일 </label> <input type="date"
						class="form-control" id="birthdate" name="birthdate" placeholder="" value = "${member.birthdate.replace(' 00:00:00','')}">
				</div>
				
				
				<div class="form-group">
					<label for="inputMobile">닉네임</label> <input type="text"
						class="form-control" id="nickname" name="nickname" placeholder="닉네임을 입력해 주세요" value = "${member.nickname}">
				</div>


				<div class="form-group text-center">
					<button type="submit" id="join-submit" class="btn btn-primary" style="color : white">
						수정완료<i class="fa fa-check spaceLeft"></i>
					</button>
					<button type="button" class="btn btn-warning" style="color : black">
						<a href="mypageOk.me" style="color: black" > 목록가기 </a><i class="fa fa-times spaceLeft"></i>
					</button>
				</div>
			</form>
		</div>

	</div>
	<c:import url="/WEB-INF/common/Bottom.jsp" />
</body>
</html>





