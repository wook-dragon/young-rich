<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE HTML>
<!--
	Road Trip by TEMPLATED
	templated.co @templatedco
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html>
<head>
<title> Momory </title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />

<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons  -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" />
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<!-- CSS Files -->
<link href="assets/css/bootstrap.min.css" rel="stylesheet" />
<link href="assets/css/now-ui-kit.css?v=1.1.0" rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link href="assets/css/demo.css" rel="stylesheet" />
<style>
@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}

:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #007bff;
  background: linear-gradient(to right, #0062E6, #33AEFF);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}

.btn-google {
  color: white;
  background-color: #ea4335;
}

.btn-facebook {
  color: white;
  background-color: #3b5998;
}
.radio-display {
	display:inline-block;
	width: 2em;
	height: 2em;

}

/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}
</style>
<script>
var ua = navigator.userAgent;
var iOS = /iPad|iPhone|iPod/.test(ua);

if(iOS){
    $("input").focus(function(){
        window.scrollBy(0, 2);
        window.scrollBy(0, -2); 
    });
}


</script>
</head>
<body>

	<!-- Header -->
	<header id="header">
		<div class="logo">
			<a href="frontpage.jsp"> Momory <span> PhotoDiary </span></a>
		</div>
		
	</header>


  <!-- The Modal -->
  <div class="modal fade" id="signIn" style="position:fixed;">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style="background-color: rgba(0, 0, 0, 0); ">
      
        <!-- Modal body -->

        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center" style="color:#000000;">Sign In</h5>
            <form class="form-signin" action="login.me" method="post">
              <div class="form-label-group">
                <input type="email" id="userid" name="userid" class="form-control" placeholder="Email address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,16}$" required>
                <label for="inputPassword">Password</label>
              </div>

              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="
    padding-bottom: 35px;
 background: linear-gradient(90deg, rgba(255,0,0,0.6783088235294117) 0%, rgba(58,67,180,1) 50%, rgba(255,0,241,0.7259278711484594) 100%); border-color: #ffffff;">Sign in</button>

<button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" style="
    padding-bottom: 35px;
 background: linear-gradient(90deg, rgba(98,98,98,0.6783088235294117) 0%, rgba(0,0,0,1) 50%, rgba(133,133,133,0.7259278711484594) 100%); border-color: #ffffff;" data-dismiss="modal">cancel</button>
            </form>
          </div>
        </div>
      </div>
      </div>
      </div>
      </div>
      
      
      <!-- The Modal -->
  <div class="modal fade" id="signUp">
    <div class="modal-dialog modal-lg">
      <div class="modal-content" style="background-color: rgba(0, 0, 0, 0); ">
      
        <!-- Modal body -->

        <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card card-signin my-5">
          <div class="card-body">
            <h5 class="card-title text-center" style="color:#000000;">Sign up</h5>
            <form class="form-signin" action="memberadd.me" accept-charset="UTF-8">
              <div class="form-label-group">
                <input type="email" id="userid" name="userid" class="form-control" placeholder="Email address" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required autofocus>
                <label for="inputEmail">Email address</label>
              </div>
              <div class="form-label-group">
                <input type="text" id="nickname" name="nickname" class="form-control" placeholder="Nick Name"  required>
                <label for="inputNickName">Nick Name</label>
              </div>

              <div class="form-label-group">
                <input type="password" id="pwd" name="pwd" class="form-control" placeholder="Password" pattern="^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_-+=[]{}~?:;`|/]).{6,16}$" required>
                <label for="inputPassword">Password</label>
              </div>
              
              <div class="form-label-group">
                <input type="date" id="birth" name="birth" class="form-control" placeholder="Birthday" required>
                <label for="inputBirth">Birth</label>
              </div>
				
				<div class="custom-control custom-radio">
						<input type="radio" name="gender" id="gender-1" value="Male" class="custom-control-input">
						<label class="custom-control-label" for="gender-1" style="color:#000000;">Male</label>
					</div>
					<br>
					<div class="custom-control custom-radio">
						<input type="radio" name="gender" id="gender-2" value="Female" class="custom-control-input">
						<label class="custom-control-label" for="gender-2" style="color:#000000;">Female</label>
					</div>
			  <hr class="my-4">
              <button class="btn btn-lg btn-primary btn-block text-uppercase" type="submit" style="
    padding-bottom: 35px; background: linear-gradient(90deg, rgba(255,0,0,0.6783088235294117) 0%, rgba(58,67,180,1) 50%, rgba(255,0,241,0.7259278711484594) 100%); border-color: #ffffff;">Sign up</button>
				<button class="btn btn-lg btn-primary btn-block text-uppercase" type="button" style="
    padding-bottom: 35px;
 background: linear-gradient(90deg, rgba(98,98,98,0.6783088235294117) 0%, rgba(0,0,0,1) 50%, rgba(133,133,133,0.7259278711484594) 100%); border-color: #ffffff;" data-dismiss="modal">cancel</button>
            </form>
          </div>
        </div>
      </div>
 
      </div>
    </div>
  </div>	
	<!-- Banner -->
	<!--
			Note: To show a background image, set the "data-bg" attribute below
			to the full filename of your image. This is used in each section to set
			the background image.
		-->
	<section id="banner" class="bg-img" data-bg="walt.jpg">		
		<div class="inner">
			<article class="box">
				<header>

					<h1>Momory PhotoTicket Page</h1>
					
				</header>
				<div class="content">
					<p> 당신의 영화를 담아보세요! </p>
				</div>
				<footer>
					<a href="generic.html" class="button alt" data-toggle="modal" data-target="#signIn">이메일로 로그인</a> 
					<c:if test="mous"></c:if>
					<a href="generic.html" class="button alt" style="background-color: red" data-toggle="modal" data-target="#signUp">회원가입</a>
				</footer>
			</article>

		</div>
		<a href="#one" class="more">Learn More</a>


	</section>

	<!-- One -->
	<section id="one" class="wrapper post bg-img" data-bg="homes.png">
		<div class="inner">
			<article class="box">
				<header> 
					<h1>Made By ZZONZZONI</h1>
					<p>Favorite Movie Diary</p>
				</header>
				<div class="content" style="color: white">
					<p> With 박성호 , 김광민 , 김정균 , 김한녘 , 임도연 </p>
				</div>
				
			</article>
		</div>
		
	</section>

	<footer id="footer" style=" padding-top: 5px;padding-bottom: 5px; background: rgb(31,7,33);
background: linear-gradient(90deg, rgba(31,7,33,0.9332107843137255) 0%, rgba(50,49,52,0.773546918767507) 50%, rgba(12,12,44,0.8463760504201681) 96%);">
      <div class="inner">
         <h2>Contact US</h2>
         <h4 style="text-align: center;" > Seoul , South korea </h4>
         <div class="copyright"> Untitled. Design: zzn </a>
      
         </div>

      </div>
   </footer>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<!--   Core JS Files   -->
	<script src="assets/js/core/jquery.3.2.1.min.js" type="text/javascript"></script>
	<script src="assets/js/core/popper.min.js" type="text/javascript"></script>
	<script src="assets/js/core/bootstrap.min.js" type="text/javascript"></script>
	<!--  Plugin for Switches, full documentation here: http://www.jque.re/plugins/version3/bootstrap.switch/ -->
	<script src="assets/js/plugins/bootstrap-switch.js"></script>
	<!--  Plugin for the Sliders, full documentation here: http://refreshless.com/nouislider/ -->
	<script src="assets/js/plugins/nouislider.min.js"
		type="text/javascript"></script>
	<!--  Plugin for the DatePicker, full documentation here: https://github.com/uxsolutions/bootstrap-datepicker -->
	<script src="assets/js/plugins/bootstrap-datepicker.js"
		type="text/javascript"></script>
	<!-- Share Library etc -->
	<script src="assets/js/plugins/jquery.sharrre.js"
		type="text/javascript"></script>
	<!-- Control Center for Now Ui Kit: parallax effects, scripts for the example pages etc -->
	<script src="assets/js/now-ui-kit.js?v=1.1.0" type="text/javascript"></script>

</body>
</html>