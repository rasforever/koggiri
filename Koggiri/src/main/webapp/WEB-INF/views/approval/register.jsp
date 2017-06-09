<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script type="text/javascript"
	src="/resources/plugins/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/upload.js"></script>
<script type="text/javascript" src="/resources/js/approval.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">


<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>

<%@ include file="../include/header.jsp"%>
<%@ include file="../sidebar/approval_sidebar.jsp"%>
<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<!-- /.box-header -->
				<form id='registerForm' role="form" method="post">
					<div align="center">

						<br> <br> <br> <br>
						<div class="form-group">
							<div id="approval" align="center">
								<h3>Approval</h3>
								<br> <br> <input type="hidden" name="dept_id"
									value="${einfo.dept_id }"> <input type="hidden"
									name="draft_emp_id" value="${einfo.emp_id }">

								<table width="1100" id="app_table" align="center">
									<tr>
										<th>사번</th>
										<td><input type="text" name="draft_emp_id"
											value="${einfo.emp_id }" disabled></td>
										<th>이름</th>
										<td><input type="text" name="draft_emp_nm"
											value="${einfo.emp_nm }" disabled></td>
									</tr>
									<tr>
										<th>소속</th>
										<td><input type="text" name="dept_nm"
											value="${einfo.dept_nm }" disabled></td>
										<th>직급</th>
										<td><input type="text" name="pos_nm"
											value="${einfo.pos_nm }" disabled></td>
									</tr>
									<tr>
										<th>기안일</th>
										<td><input type="text" name="draft_dt" class="datepicker"></td>
										<th>신청종류</th>
										<td><select id="app_type_cd" name="app_type_cd"
											onchange="typesel(this)">
												<c:forEach items="${applist}" var="apptypeVO">
													<option value="${apptypeVO.app_type_cd }">${apptypeVO.app_type_nm }
													</option>
												</c:forEach>
										</select></td>
									</tr>
									<tr>
										<th>결재자</th>
										<td><input type="text" name="app_emp_id"></td>
									</tr>
									<tr>
										<th>제목</th>
										<td colspan="3"><input type="text" name="app_title"
											width="100%"></td>
									</tr>

								</table>
							</div>
						</div>
						<br>

						<div class="form-group">
							<div align="center" id="app_text">
								<textarea rows="20" cols="70" id="app_context"
									name="app_context">
	 						</textarea>
							</div>
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">File DROP Here</label>
							<div class="fileDrop"></div>
						</div>
					</div>
					<div class="box-footer">
						<div>
							<hr>
						</div>

						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>



						<br> <input type="submit" value="등록" class="btn btn-primary">
						&nbsp;&nbsp; <input type="reset" value="취소"
							class="btn btn-primary">
					</div>
				</form>

			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>
	<!-- /.row -->
</section>
<!-- /.content -->
</div>
<!-- /.content-wrapper -->


<%@ include file="/WEB-INF/views/include/footer.jsp"%>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove">X</i></a>
	</span>
  </div>
</li>                
</script>

<script type="text/javascript">
	CKEDITOR.replace('app_context', {
		'filebrowserUploadUrl' : '/resources/plugins/ckeditor/upload.jsp?'
			+ 'realUrl=http://www.localhost.com/서버업로드될디렉토리명'
			+ '&realDir=서버업로드될디렉토리명'
	});
	var t = "<p><strong><span style='font-size:26px'>비용 신청서</span></strong></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table border='1' cellpadding='0' cellspacing='0' style='width:634px'><tbody><tr><td><p>비용신청자&nbsp;</p></td><td>&nbsp;김성준</td></tr><tr><p>신청액&nbsp;</p></td><td>신청일</td><td>&nbsp;2016.12.14 ~ 2016.12.15</td></tr><tr><td><p>&nbsp;비용신청자 내역</p></td><td><p>&nbsp;양학타운에서 쉬고자 합니다.</p><p>새벽 늦게 자니깐 많이 힘듭니다.</p></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>상기 내용과 같이 휴가신청서를 상신하오니 재가 바랍니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp; 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;일</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김성준&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>";

	CKEDITOR.instances.app_context.setData(t);
	function typesel(obj) {
		var text = "";
		if ($(obj).val() == "10") {
			text = "<p><strong><span style='font-size:26px'>비용 신청서</span></strong></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table border='1' cellpadding='0' cellspacing='0' style='width:634px'><tbody><tr><td><p>비용신청자&nbsp;</p></td><td>&nbsp;김성준</td></tr><tr><p>신청액&nbsp;</p></td><td>신청일</td><td>&nbsp;2016.12.14 ~ 2016.12.15</td></tr><tr><td><p>&nbsp;비용신청자 내역</p></td><td><p>&nbsp;양학타운에서 쉬고자 합니다.</p><p>새벽 늦게 자니깐 많이 힘듭니다.</p></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>상기 내용과 같이 휴가신청서를 상신하오니 재가 바랍니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp; 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;일</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김성준&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>";
		} else if ($(obj).val() == "20") {
			text = "<p><span style='font-size:26px'><strong>제안 신청서</strong></span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table border='1' cellpadding='0' cellspacing='0' style='width:634px'><tbody><tr><td><p>기안자&nbsp;</p></td><td>&nbsp;김성준</td></tr><tr><td><p>기안제목&nbsp;</p></td><td>&nbsp;김성준</td></tr><tr><td><p>&nbsp;기안내용</p></td><td><p>&nbsp;양학타운에서 쉬고자 합니다.</p><p>새벽 늦게 자니깐 많이 힘듭니다.</p></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>상기 내용과 같이 제안신청서를 상신하오니 재가 바랍니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp; 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;일</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김성준</p>";
		} else if ($(obj).val() == "30") {
			text = "<p><span style='font-size:26px'><strong>휴가 신청서</strong></span></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table border='1' cellpadding='0' cellspacing='0' style='width:634px'><tbody><tr><td><p>성명&nbsp;</p></td><td>&nbsp;김성준</td></tr><tr><td><p>&nbsp;휴가기간</p></td><td>&nbsp;2016.12.14 ~ 2016.12.15</td></tr><tr><td><p>&nbsp;휴가내용</p></td><td><p>&nbsp;양학타운에서 쉬고자 합니다.</p><p>새벽 늦게 자니깐 많이 힘듭니다.</p></td></tr></tbody></table><p>&nbsp;</p><p>&nbsp;</p><p>상기 내용과 같이 휴가신청서를 상신하오니 재가 바랍니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp; 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;일</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김성준&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>";
		} else if ($(obj).val() == "40") {
			text = "<p><strong><span style='font-size:26px'>출장 신청서</span></strong></p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><table border='1' cellpadding='0' cellspacing='0' style='width:634px'><tbody><tr><td><p>출장자&nbsp;</p></td><td>유승현</td></tr><tr><td><p>&nbsp;출장기간</p></td><td>&nbsp;</td></tr><tr><td><p>&nbsp;출장장소</p></td><td><p>&nbsp;</p></td></tr><tr><td>&nbsp;출장목적</td><td><p>11111111111111111111111111111111111111111111111111111111111111</p><p>&nbsp;</p></td></tr><tr><td>&nbsp;출장 일정 &amp; 회의록</td><td><p>&nbsp;11111111111111111111111111111111111111111111111111111111111111</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;</p></td></tr></tbody></table><p>&nbsp;</p><p>상기 내용과 같이 출장신청서를 상신하오니 재가 바랍니다.</p><p>&nbsp;</p><p>&nbsp;</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2016 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;12&nbsp; 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;13&nbsp;&nbsp;일</p><p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 신청자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;김성준&nbsp;&nbsp;</p>";
		}
		CKEDITOR.instances.app_context.setData(text);
	}
</script>

<script>
	var template = Handlebars.compile($("#template").html());

	$(".fileDrop").on("dragenter dragover", function(event) {
		event.preventDefault();
	});

	$(".fileDrop").on("drop", function(event) {
		event.preventDefault();

		var files = event.originalEvent.dataTransfer.files;

		var file = files[0];

		var formData = new FormData();

		formData.append("file", file);

		$.ajax({
			url : '/uploadAjax',
			data : formData,
			dataType : 'text',
			processData : false,
			contentType : false,
			type : 'POST',
			success : function(data) {

				var fileInfo = getFileInfo(data);

				var html = template(fileInfo);

				$(".uploadedList").append(html);
			}
		});
	});

	$("#registerForm").submit(
		function(event) {
			event.preventDefault();

			var that = $(this);

			var str = "";
			$(".uploadedList .delbtn").each(
				function(index) {
					str += "<input type='hidden' name='files[" + index
						+ "]' value='" + $(this).attr("href")
						+ "'> ";
				});

			that.append(str);

			that.get(0).submit();
		});
	$(".uploadedList").on("click", ".delbtn", function(event) {

		event.preventDefault();

		var that = $(this);

		$.ajax({
			url : "/deleteFile",
			type : "post",
			data : {
				fileName : $(this).attr("href")
			},
			dataType : "text",
			success : function(result) {
				if (result == 'deleted') {
					that.closest("li").remove();
				}
			}
		});
	});
</script>



