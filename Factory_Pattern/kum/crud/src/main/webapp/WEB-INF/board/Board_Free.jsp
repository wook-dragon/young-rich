<%@page import="kr.or.photic.dto.Freeboard"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.or.photic.utils.ThePager"%>
<%@page import="kr.or.photic.dao.CommunityDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:import url="/WEB-INF/common/Top.jsp" />

<link href="css/jgCss.css?after" rel='stylesheet' type='text/css' />

<%
	CommunityDAO cdao = new CommunityDAO();

	// 1번 자유	2번 공지 	3번 문의
	int type = 1;

	int totalBoardCount = cdao.getTotalBoardCount(1);
	int realStartSeq = cdao.getStartSeq(1);

	int currentPage = 1;
	int pageSize = 30;
	int pagerSize = 5;
	String linkurl = "free.board";

	if (request.getParameter("pageno") != null) {
		currentPage = Integer.parseInt(request.getParameter("pageno"));
	}

	ThePager pager = new ThePager(totalBoardCount, currentPage, pageSize, pagerSize, linkurl);

	int start = realStartSeq - (currentPage - 1) * pageSize + 1;
	int last = start - pageSize;

	ArrayList<Freeboard> boards = cdao.getBoardList(last, start, 1);

	request.setAttribute("type", type);
	request.setAttribute("boards", boards);

	ArrayList<Freeboard> title = cdao.getBoardListByBoardTitle("title", 1);
	request.setAttribute("title", title);
	
	ArrayList<Freeboard> nickname = cdao.getBoardListByBoardWrtier("writer", 1);
	request.setAttribute("nickname", nickname);

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>게시글 조회</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script type="text/javascript">
	$(function() {
		$('#titleBtn').click(function() {
			$('#tbody').empty();
			$('#empty').empty();

			if ($('#searchOpt').val() == '제목') {
				$.ajax({
					url : "<c:url value="/FreeBoardTitle"/>",
					data : {
						title : $("#boardSearch").val()
					},
					dataType : 'text',
					success : function(data) {
						console.log(data);
						$('#tbody').html(data);
					},
					error : function(xhr, status, error) {
						console.log("여기는 자유게시판 제목 검색 에러~~~");
					}
				});
			} else if ($('#searchOpt').val() == '글쓴이') {

				$.ajax({
					url : "<c:url value="/FreeBoardNickname"/>",
					data : {

						nickname : $("#boardSearch").val()
					},
					dataType : 'text',
					success : function(data) {
						console.log(data);
						$('#tbody').html(data);
					},
					error : function(xhr, status, error) {
						console.log("여기는 자유게시판 닉네임 검색 에러~~~");
					}
				});
			}
		});

	});
</script>
</head>

<style>

@import url('https://fonts.googleapis.com/css?family=Noto+Serif+KR:300&display=swap&subset=korean');

body {
   font-family: 'Noto Serif KR', serif;
}
</style>

<body>


	<!-- /about -->
	<div class="banner_bottom" id="body"
		style="padding: 15px; margin: 0 0 10px 0;">
		
		<div class="container" id="content"
			style="background-color: light-gray; height: 700px;">

			<h2 style="margin: 0 50px 30px 0;  font-family: 'Noto Serif KR', serif;">자유 게시판</h2>
			
			<div class="select_box array_num" style="height: 35px">
            
            <div style="float: right">
               <input type="text" id="boardSearch" class="boardSearch" style="height: 35px;">
               <input   type="button" id="titleBtn" value="검색" style="height: 35px;">            
            </div>
            <div style="float: right; margin-right: 10px;">

               <select id="searchOpt" name="searchOpt"  style="height: 35px">
                  <option value="제목">제목</option>
                  <option value="글쓴이">글쓴이</option>
               </select>
            </div>

         </div>

			<div class="col-md-12">

				<table class="jgTable">
					<colgroup>
						<col style="width: 8%">
						<col>
						<col style="width: 14%">
						<col style="width: 10%">
						<col style="width: 6%">
					</colgroup>
					<thead>
						<tr>
							<td colspan="5"></td>
						</tr>

						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>글쓴이</th>
							<th>작성일</th>
							<th>조회수</th>
						</tr>
					</thead>

					<tbody id="tbody">
						<c:choose>
							<c:when test="${boards == '[]'}">
								<td class="tdSeq">-</td>
								<td class="tdTitle">&nbsp;&nbsp;&nbsp;&nbsp;작성된 게시글이 없습니다.
								</td>
								<td class="tdWriter">-</td>
								<td class="tdDate">-</td>
								<td class="tdHits">-</td>
							</c:when>
							<c:otherwise>
								<c:forEach var="boardList" items="${boards}">
									<tr>
										<td class="tdSeq">${boardList.seq }</td>
										<td class="tdTitle"><a
											href="fcontent.board?seq=${boardList.seq}&type=${type}">${boardList.title }</a>
										</td>
										<td class="tdWriter">${boardList.userid }</td>
										<td class="tdDate">${fn:substring(boardList.logtime,0,16) }</td>
										<td class="tdHits">${boardList.hits }</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>

					<tfoot>
						<tr>
							<td colspan="5"></td>
						</tr>
					</tfoot>

				</table>

			</div>
	
			<c:choose>
				<c:when test="${sessionScope.usercode == 1 || sessionScope.usercode == 3 }">
					<div class="fr">
						<input type="button" id="btn_write" class="btn1w_write"
							value="글쓰기" style="width: 150px; float:right;"
							onclick="javascript:location.href='write.board?type=1';" />
					</div>
				</c:when>
			</c:choose>
			
		</div>


		<div style="text-align: center" id="empty">
			<%=pager.toString()%>

			
		</div>

	</div>




	<c:import url="/WEB-INF/common/Bottom.jsp" />

</body>
</html>
