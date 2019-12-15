<%@page import="kr.or.photic.dto.FreeboardReply"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.photic.dto.Freeboard"%>
<%@page import="kr.or.photic.dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:import url="/WEB-INF/common/Top.jsp" />
<link href="css/jgCss.css?after" rel='stylesheet' type='text/css' />

<%

	if (session.getAttribute("id") == null ) {
		response.sendRedirect("frontpage.jsp");
		return;
	}

	int seq = 0;
	int type = 0;
	
	try {
		seq = Integer.valueOf(request.getParameter("seq"));
		type = Integer.valueOf(request.getParameter("type"));
	} catch ( Exception e) {}
	
	if (seq == 0) {
		response.sendRedirect("free.board");
		return;
	}
	
	CommunityDAO cdao = new CommunityDAO();
	ArrayList<Freeboard> freeboard = cdao.getBoardListByBoardNum(seq, type);
	// 글 출력 가능
	// System.out.println("freeboard : "+ freeboard);
	
	ArrayList<FreeboardReply> fbreply = cdao.getBoardReply(seq);
	// 댓글 출력 가능
	
	cdao.increaseViewCount(seq, type);
	
	if (freeboard == null) {
		response.sendRedirect("free.board");
		return;
	}
	
	request.setAttribute("freeboard", freeboard);
	request.setAttribute("fbreply", fbreply);
	request.setAttribute("seq", seq);
	request.setAttribute("type", type);


%>



<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>

<!-- /about -->
<div class="banner_bottom" id="body" style="padding: 15px; margin: 0 0 10px 0">
	<div class="container" id="content"
         style="background-color: light-gray; min-height: 700px">


		<c:choose>
			<c:when test="${type == 1}">
				<h2 style="margin: 0 50px 30px 0; font-family: 'Noto Serif KR', serif;">자유 게시판</h2>
			</c:when>
			<c:when test="${type == 2}">
				<h2 style="margin: 0 50px 30px 0; font-family: 'Noto Serif KR', serif;">공지 사항</h2>
			</c:when>
			<c:when test="${type == 3}">
				<h2 style="margin: 0 50px 30px 0; font-family: 'Noto Serif KR', serif;">QnA 게시판</h2>
			</c:when>
		
		</c:choose>

		<div class="col-md-12">

			<c:forEach var="boardContent" items="${freeboard }">
				<table class="jgTableView">
					<colgroup>
						<col style="width: 8%;">
						<col>
						<col style="width: 20%">
					</colgroup>
					<thead>
						<tr>
							<td class="tdSeq">${boardContent.seq }</td>
							<td class ="tdTitle" colspan="2" style="text-align: center">
								${boardContent.title }</td>
						</tr>
					</thead>

					<tr>
						<td></td>
						<td></td>
						<td class="tdWriter">${boardContent.userid }</td>
					</tr>

					<tr>
					<tr>
					<tr height="500px">
						<td class="tdContent" colspan="3" style="height: 80%;">${boardContent.content }
						</td>
					</tr>

					<tr>
						<td colspan="2"></td>
						<td class="tdTime">${fn:substring(boardContent.logtime,0,16) }</td>
					</tr>

					<tfoot>
						<tr>
							<td colspan="5"></td>
						</tr>
					</tfoot>

				</table>
			</c:forEach>

			<hr>

			<c:forEach var="fb" items="${freeboard }">
			
			<!-- 
			이거 ${requestScope.type} <br>
			타입 : ${type }<br>
			이ㅓㄱ ${sessionScope.nickname } <br>
			
			refer : ${fb.refer }<br>
			depth : ${fb.depth }<br>
			step : ${fb.step }<br>
			session usercode : ${sessionScope.usercode }<br>
			session nickname : ${sessionScope.nickname } 이걸로 하고	<br>
			session id : ${sessionScope.id }<br>
			writer : ${fb.userid } ||||	이거 막아야 하는데? 어쩌지?? ㅋㅋㅋ<br>
			
			writer nickname : }이걸로 값을 비교하는걸로	<br>
				일단 Freeboard DTO 에서 nickname 을 따로 받는거를 추가하고 CommunityDAO 에서 닉네임이랑 아이디 까지 동시에 다 받아야 함.
			 -->
			 
			<c:choose>
				
				<c:when test="${type == 1 && sessionScope.nickname == fb.userid}" >
					<div class="jgBoardBtn"><a href="free.board">목록보기</a></div>
					<div class="jgBoardBtn"><a href="deleteAct.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">삭제</a></div>
					<div class="jgBoardBtn"><a href="writeEdit.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">수정</a></div>
				</c:when>
				
				<c:when test="${type == 1 && sessionScope.usercode == 3 }">
					<div class="jgBoardBtn"><a href="free.board">목록보기</a></div>
					<div class="jgBoardBtn"><a href="deleteAct.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">삭제</a></div>
					<div class="jgBoardBtn"><a href="writeEdit.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">수정</a></div>
				</c:when>
				
				<c:when test="${type == 1 }">
					<div class="jgBoardBtn"><a href="free.board">목록보기</a></div>
				</c:when>	
				
			
				
				<c:when test="${type == 2 && sessionScope.usercode == 3 }">
					<div class="jgBoardBtn"><a href="deleteAct.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">삭제</a></div>
					<div class="jgBoardBtn"><a href="writeEdit.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">수정</a></div>
				</c:when>
				
				<c:when test="${type ==2 }">
					<div class="jgBoardBtn"><a href="notice.board">목록보기</a></div>
				</c:when>
				
				
				
				
				<c:when test="${type == 3 && sessionScope.nickname == fb.userid }">
					<div class="jgBoardBtn"><a href="qna.board">목록보기</a></div>
					<div class="jgBoardBtn"><a href="deleteAct.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">삭제</a></div>
					<div class="jgBoardBtn"><a href="writeEdit.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">수정</a></div>
					<div class="jgBoardBtn"><a href="rewrite.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>&refer=${fb.refer}&depth=${fb.depth}&step=${fb.step}&rw=1">답글</a></div>
				</c:when>
				
				<c:when test="${type == 3 &&  sessionScope.usercode == 3}">
					<div class="jgBoardBtn"><a href="qna.board">목록보기</a></div>
					<div class="jgBoardBtn"><a href="deleteAct.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">삭제</a></div>
					<div class="jgBoardBtn"><a href="writeEdit.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>">수정</a></div>
					<div class="jgBoardBtn"><a href="rewrite.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>&refer=${fb.refer}&depth=${fb.depth}&step=${fb.step}&rw=1">답글</a></div>
				</c:when>
				
				<c:when test="${type == 3 }">
					<div class="jgBoardBtn"><a href="qna.board">목록보기</a></div>
				</c:when>
								
			</c:choose>
			</c:forEach>
			
		</div>
	
	
		<c:choose>
			<c:when test="${type == 1 }">
			
				<div class="col-sm-12">
					<div class="jgInsertReply">
					
						<form action="insertReply.board?seq=<%=request.getAttribute("seq")%>&type=<%=request.getParameter("type")%>" method="post">					
						
						<table class="jgTableView-reply-input">
							<colgroup>
								<col style="width :20%">
								<col>
								<col style="width : 8%">
							</colgroup>
							<thead>
								<tr>
									<td colspan = "3"></td>
								</tr>
							</thead>
							
							<tbody>
								<tr>
									<td class= "jgIRnickname" style="text-align: center">
										<input type="hidden" name="seq" value="<%=request.getParameter("seq") %>">
										${sessionScope.nickname }
										
									</td>
									<td class = "jgIRcontent">
										<input type="text" name="replycontent" id="replycontent" class="replycontent" style="height: 50px; width: 100%;">
									</td>
									<td class = "jgIRsubmit">
										<input type="submit" id ="replySubmit" class="replySubmit" value="댓글 입력">
									</td>
								</tr>
							</tbody>
							
							<tfoot>
								<tr>
									<td colspan="3"></td>
								</tr>
							</tfoot>
						</table>
						</form>
						
					</div>
				
					<div class="boardReply">
						<table class="jgViewReply">
							<colgroup>
								<col style="width : 10%">
								<col>
								<col style="width : 20%">
								<col style="width : 5%">
							</colgroup>
							
							<thead>
								<tr>
									<td colspan="4"></td>
								</tr>
								<tr>
									<th>작성자</th>
									<th>내용</th>
									<th>작성날자</th>
									<th>삭제</th>
								</tr>
							</thead>
			
							<tbody>
								<c:choose>
									<c:when test ="${fbreply == '[]'}" >
										<td class = "brWriter" >-</td>
										<td class = "brContent">
											&nbsp;&nbsp;&nbsp;&nbsp; 작성된 댓글이 없습니다.
										</td>
										<td class = "brTime">-</td>
										<td class = "brDelete">-</td>
									</c:when>
									<c:otherwise>
																	
										<c:forEach var="fbr" items="${fbreply }">
										<tr>
											<td class = "brWriter">${fbr.userid }</td>
											<td class = "brContent">${fbr.reply_content }</td>
											<td class = "brTime">${fn:substring(fbr.writedate,0,16) }</td>
											<td class = "brDelete">
												<c:choose>
													<c:when test="${sessionScope.nickname == fbr.userid }" >
														<a href="deleteReplyAct.board?no=${fbr.no }">삭제</a>
													</c:when>
													<c:otherwise>
													-
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
										
									</c:forEach>						
									</c:otherwise>
								</c:choose>			
							</tbody>
							
							<tfoot>
								<tr>
									<td colspan = "4"></td>
								</tr>
							</tfoot>	
									
						</table>
			
					</div>
				
				</div>
			</c:when>
			
			<c:otherwise>
			
			</c:otherwise>
		</c:choose>		
		
		

	</div>
</div>

<c:import url="/WEB-INF/common/Bottom.jsp" />

</body>
</html>