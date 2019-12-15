<%@page import="kr.or.photic.dto.LikeDTO"%>
<%@page import="kr.or.photic.dao.LikeDAO"%>
<%@page import="kr.or.photic.dto.WatchList"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.photic.dao.WatchListDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
		function hideURLbar(){ window.scrollTo(0,1); } </script>
<!-- //for-mobile-apps -->
<link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
<!-- pop-up -->
<link href="css/popuo-box.css" rel="stylesheet" type="text/css" media="all" />

<c:import url="/WEB-INF/common/Top.jsp" />

<%
WatchListDAO dao = new WatchListDAO();

//LikeDAO likedao = new LikeDAO();
//ArrayList<Boolean> likesearch = likedao.checkLikeService(userid);
ArrayList<WatchList> sharelist = dao.sharelist();


request.setAttribute("sharelist",sharelist);
//request.setAttribute("likesearch", likesearch);
System.out.println("sharelist :"+sharelist);
	
%>

<script>


window.onload=function(){
	$.ajax({ 
		url:"searchLike.list",
		dataType:"json",
		success: function(data){
			console.log(data);
			$.each(data, function(index, item) {
				console.log(item.seq);
				console.log(index);
				
				if(document.getElementById(item.seq).getAttribute('id')==item.seq){
					console.log("들어오냐");
					document.getElementById(item.seq).setAttribute("name", "on");
					document.getElementById(item.seq).children.item(0).setAttribute("src", "images/heart.png");
					console.log();
					/* setAttribute("src", "images/heart.png");
					$('.btn').children().g */
				}
			});
			
		},error : function(xhr, status, error) {
				console.log("나와라~~~~");
		}
		});
	$('#btnNickName').click(function(){
		$('#movieResult').empty();
		$.ajax({ 
			url:"NickNameSearch",
			data:{
				nickname: $("#nickName").val()
			},
			dataType:"text",
			success: function(data){
				$('#movieResult').html(data);
				
			},error : function(xhr, status, error) {
					console.log("나오닝");
			}
			});
		});
	 $('.btn').on("click",function() {
			// 클릭하면 ajax로 데이터를 넘긴다. 
			
			if ($(this).attr('name') == 'off') {
				var temp = $(this).attr('id');
				
				$.ajax({
					url :'like.list',
					data : {
						seq : temp
					},
					type : 'get',
					dataType : 'json',
					success : function(responsedata) {
						 $("#movieResult").append(
								 
						 );
					}
				});
				$(this).children().attr("src", "images/heart.png")//
				$(this).attr('name', 'on');
			} else if ($(this).attr('name') == 'on') {
				var temp = $(this).attr('id');
				$.ajax({
					url : 'deleteLike.list',
					data : {
						seq : temp
					},
					type : 'get',
					dataType : 'json',
					success : function(responsedata) {
					}
				});
				$(this).children().attr("src", "images/emptyheart.png");//���⿡ ������Ʈ
				$(this).attr('name', 'off');
			}

		});

	}
</script>

<!--/requested-movies-->
 
<div class="container" id="movie_search" style="min-height: 500px;">    
	   <br>
   <div style="margin-right: 50px">
   <div style="float: right; margin-right: 10px;">
   <input type="image" id="btnNickName" src="images/loupe.png"class="form-control" style="width: 40px;height:30px;border: solid 1px;border-color: rgba(0,0,0,0.4) " value="닉네임찾기">
   </div>
   <div style="float: right">
      <input type="text" class=form-controller id="nickName" placeholder="Search NickName" style="width: 200px; border-color: white; float: left; margin-right: 4px">
   </div>   
   </div>
   <br>
		<div class="col-sm-12" id="movieResult" style="min-height: 700px">
		<c:set var="count" value="1"/>	
			<c:forEach var="sharelist" items="${requestScope.sharelist}">	
				
				<c:set var="count" value="${ count+1 }"></c:set>
				
				
				<div class="col-md-4 team_grid_info" style="padding-bottom: 10px; padding-top: 10px">
					<img name="${sharelist.seq }" src="uploads/${sharelist.mypicsrc}" title="Movies Pro" 
						class="img-responsive" alt=" " onerror="this.src='http://jjcp.or.kr/korean/bbs/skin/latest/img_news/noimage.gif'" style="width:270px; height:390px;">
						<div class="w3l-action-icon">
							<i class="fa fa-play-circle-o" aria-hidden="true"></i>
						</div>
					</a>
					<div class="mid-1 agileits_w3layouts_mid_1_home" style="width:270px;">
						<div class="w3l-movie-text">
							<h6>
								<b>${sharelist.content}</b>
								
							</h6>
						</div>
						<div class="w3l-movie-text">
							<h6>
								<b>닉네임 : ${sharelist.nickname}</b>
							</h6>
						</div>
						<div class="mid-2 agile_mid_2_home">
							<p>${sharelist.servdate}</p>
							<div class="block-stars" >
								<div class="heart">
									
										<button class="btn" id="${sharelist.seq}" name="off" type="submit" style="padding-right: 0px;padding-left: 0px;padding-top: 0px;padding-bottom: 0px;background: #ededf1;">
										<img id="image" alt="" src="images/emptyheart.png" style="box-shadow:0px 0px 0px 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;padding-top: 0px;"></button>  
										

									
										<%-- <button class="btn" id="${sharelist.seq}" name="off" type="submit" style="padding-right: 0px;padding-left: 0px;padding-top: 0px;padding-bottom: 0px;background: #ededf1;">
										<img alt="" src="images/heart.png" style="box-shadow:0px 0px 0px 0px;padding-right: 0px;padding-bottom: 0px;padding-left: 0px;padding-top: 0px;"></button>   --%>
									
							</div>
							</div>
							<div class="clearfix"></div>
						</div>
					</div>
				</div>
				<c:if test="${count%3==0} }"><br></c:if>
			</c:forEach>
	</div>
</div>


<c:import url="/WEB-INF/common/Bottom.jsp" />
</body>
</html>







