<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="../resources/js/jquery.js"></script>
<script type="text/javascript" src="../resources/js/jquery-ui.min.js"></script>
<link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" media="screen"
	href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.14/themes/base/jquery-ui.css">

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


<!-- Main content -->
<section class="content">
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
			<br> 작성자:<input type="text" name="emp_id" class="form-control"
				value="${emp_nm}" size="7" readonly="readonly"><br> <input
				type="text" id="week-picker" name="ta_date" size="30"
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
	<!--/.col (left) -->

	<!-- /.row -->
</section>
<!-- /.content -->




<!-- Main content -->


