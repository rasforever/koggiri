<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>

<!-- Bootstrap 3.3.4 -->
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<!-- Font Awesome Icons -->
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<!-- Ionicons -->
<link
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
	rel="stylesheet" type="text/css" />
<!-- Theme style -->
<link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet"
	type="text/css" />
<!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
<link href="/resources/dist/css/skins/_all-skins.min.css"
	rel="stylesheet" type="text/css" />

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript">
	$(function() {
		var startDate;
		var endDate;

		$('#week-picker')
				.datepicker(
						{
							showOtherMonths : true,
							selectOtherMonths : true,
							selectWeek : true,
							onSelect : function(dateText, inst) {
								var date = $(this).datepicker('getDate');
								startDate = new Date(date.getFullYear(), date
										.getMonth(), date.getDate()
										- date.getDay() + 1);
								endDate = new Date(date.getFullYear(), date
										.getMonth(), date.getDate()
										- date.getDay() + 5);
								var dateFormat = 'yy/mm/dd'
								startDate = $.datepicker.formatDate(dateFormat,
										startDate, inst.settings);
								endDate = $.datepicker.formatDate(dateFormat,
										endDate, inst.settings);

								$('#week-picker')
										.val(startDate + '~' + endDate);

								setTimeout("applyWeeklyHighlight()", 100);
							},
							beforeShow : function() {
								setTimeout("applyWeeklyHighlight()", 100);
							}
						});
	});

	function applyWeeklyHighlight() {

		$('.ui-datepicker-calendar tr').each(function() {

			if ($(this).parent().get(0).tagName == 'TBODY') {
				$(this).mouseover(function() {
					$(this).find('a').css({
						'background' : '#ffffcc',
						'border' : '1px solid #dddddd'
					});
					$(this).find('a').removeClass('ui-state-default');
					$(this).css('background', '#ffffcc');
				});

				$(this).mouseout(function() {
					$(this).css('background', '#ffffff');
					$(this).find('a').css('background', '');
					$(this).find('a').addClass('ui-state-default');
				});
			}

		});
	}
</script>



<div class="container_wrap" style="background-color: #ffffff;">
	<div id="container">

		<div id="sub_menu_title">
			<h1>
				<img src="/resources/img/s_menu03.png" />
			</h1>
			<div class="sub_top">
				<span><a href="/">홈</a> <span> &gt; </span> <strong>업무
						보고</strong></span>
			</div>
		</div>


		<div id="lnb">
			<div class="lnb01">
				<strong class="menu02"><span>전자결재</span></strong>
				<ul>
					<li class="menu01"><a href="/task/list">업무보고</a>
						<ul>
						</ul></li>
					<li class="menu02 "><a href="/approval/lists">전자결재</a>
						<ul>
							<li class="sub01 "><a href="/approval/lists">보낸 결재</a></li>
							<li class="sub02 "><a href="/approval/listr">받은 결재</a></li>
							<li class="sub03 "><a href="/approval/register">결재 입력</a></li>
						</ul></li>
					<li class="menu03 "><a href="/document/list">문서함</a>
						<ul></ul></li>
				</ul>
			</div>
		</div>

		<div id="sub_content" align="center">


			<!-- Main content -->
			<div class="row">
				<!-- left column -->


				<div class="col-md-12">
					<!-- general form elements -->
					<div class='box'>
						<div class="box-header with-border">
							<h3 class="box-title">업무 목록</h3>
						</div>


						<div class='box-body'>

							<input type="text" name='keyword' class="keywordInput"
								id="week-picker" placeholder="업무일자를 선택해주세요"
								value='${cri.keyword }'>
							<button id='searchBtn' class="pagination" onclick="myfunction();">검색</button>
							<button id='newBtn' class="pagination"
								Onclick="location.href='register' ">글 작성</button>

						</div>
					</div>


					<div class="box">
						<div class="box-header with-border"></div>
						<div class="box-body">
							<table class="table table-bordered" border="1">
								<tr>
									<th style="width: 10px">글번호</th>
									<th>작성자</th>
									<th>업무일자</th>
									<th>작성일자</th>
									<th style="width: 40px">조회수</th>
								</tr>



								<c:forEach items="${list}" var="taskVO">
									<c:if test="${taskVO.emp_id==mem_id  or mem_id == 'master'}">


										<tr>
											<td>${taskVO.ta_seq}</td>
											<td>${taskVO.emp_nm}</td>
											<td><a
												href='/task/readPage${pageMaker.makeSearch(pageMaker.cri.page) }&ta_seq=${taskVO.ta_seq}'>
													${taskVO.ta_date} </a></td>
											<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm"
													value="${taskVO.ta_regdate}" /></td>
											<td><span class="badge bg-red">${taskVO.ta_hitcount }</span></td>
										</tr>
									</c:if>
								</c:forEach>

							</table>
						</div>
						<!-- /.box-body -->


						<div class="box-footer">

							<div class="text-center">
								<ul class="pagination">

									<c:if test="${pageMaker.prev}">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.startPage - 1) }">&laquo;</a></li>
									</c:if>

									<c:forEach begin="${pageMaker.startPage }"
										end="${pageMaker.endPage }" var="idx">
										<li
											<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
											<a href="list${pageMaker.makeSearch(idx)}">${idx}</a>
										</li>
									</c:forEach>

									<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
										<li><a
											href="list${pageMaker.makeSearch(pageMaker.endPage +1) }">&raquo;</a></li>
									</c:if>

								</ul>
							</div>

						</div>
						<!-- /.box-footer-->
					</div>
				</div>
				<!--/.col (left) -->

			</div>
			<!-- /.row -->
			<!-- /.content -->
		</div>
	</div>
</div>
<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>



		<script>
			function myfunction() {

				self.location = "list" + '${pageMaker.makeQuery(1)}'
						+ "&keyword=" + $('.keywordInput').val();

			}
		</script>