<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet"
	type="text/css" />
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>

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

<<<<<<< HEAD

	<form role="form" method="post">
		<div class="box-body">
				<input type="text" id="week-picker" name="ta_date" size="30"
				placeholder="업무일자를 선택해주세요"><br>
			<br>
			<div class="form-group">
				<label for="weekresult">금주업무실적</label><br>
				<textarea class="form-control" name="ta_weekresult" cols="50"
					rows="10" placeholder="금주 업무 일지를 등록해주세요"></textarea>
			</div>

			<br>
			<br>

			<div class="form-group">
				<label for="weekresult">차주업무계획</label><br>
				<textarea class="form-control" name="ta_nextresult" cols="50"
					rows="10" placeholder="차주 업무 계획을 등록해주세요"></textarea>
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

			<!-- left column -->
			<div class="col-md-12">
				<!-- general form elements -->
				<div class="box box-primary">
					<div class="box-header">
						<h3 class="box-title">업무 작성</h3>
					</div>
					<!-- /.box-header -->


					<form role="form" method="post">
						<div class="box-body">
							<br> 작성자:<input type="text" name="emp_id"
								class="form-control" value="${emp_nm}" size="7"
								readonly="readonly"><br> <input type="text"
								id="week-picker" name="ta_date" size="30"
								placeholder="업무일자를 선택해주세요"><br> <br>
							<div class="form-group">
								<label for="weekresult">금주업무실적</label><br>
								<textarea class="form-control" name="ta_weekresult" cols="50"
									rows="10" placeholder="금주 업무 일지를 등록해주세요"></textarea>
							</div>

							<br> <br>

							<div class="form-group">
								<label for="weekresult">차주업무계획</label><br>
								<textarea class="form-control" name="ta_nextresult" cols="50"
									rows="10" placeholder="차주 업무 계획을 등록해주세요"></textarea>
							</div>
						</div>

						<!-- /.box-body -->
						<br>

						<div class="box-footer">
							<button type="submit" class="btn btn-primary">등록</button>
							<button type="reset" class="btn btn-primary">취소</button>
						</div>
					</form>

				</div>
				<!-- /.box -->
			</div>
		</div>
	</div>
</div>

<div class="footer_wrap">
	<div id="footer" style="height: 150px">
		<%@ include file="../include/footer.jsp"%>