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

<%@ include file="../include/header.jsp"%>

<link rel="stylesheet" href="../resources/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" /> 

<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu01.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="/noticeboard/listPage">공지</a>  &gt;  <strong>공지사항</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu01"><span>회사 정보</span></strong>
      <ul>
                <li class="menu01 ">
                    <a href="/noticeboard/listPage">공지사항</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="#">알립니다</a>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content">

<!-- 본문 내용 시작 -->

<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
} 
</style>

<!-- Main content -->
<section class="content">
	<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<!-- <div class="box-header">
					<h3 class="box-title">REGISTER BOARD</h3>
				</div> -->
				<!-- /.box-header -->
<form id='registerForm' role="form" method="post">
	<div class="box-body">
		<div class="form-group">
			<label for="exampleInputEmail1" >제목<br><br></label> 
			<input type="text"
				name='N_TITLE' class="form-control" id = "title" placeholder="Enter Title">
		</div>
		<div class="form-group">
			<label for="exampleInputPassword1">내용<br><br></label>
			<textarea class="form-control" name="N_CONTENT" rows="3"
				placeholder="Enter ..."></textarea>
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">작성자<br><br></label> 
			<input type="text"
				name="N_EMP_ID" class="form-control" placeholder="Enter Writer">
		</div>
		
		<div class="form-group">
			<label for="exampleInputEmail1">파일 첨부<br><br></label>
			<div class="fileDrop" style="margin-left: 0px; width: 970px;"></div>
		</div>
	
	<!-- /.box-body -->

	<div class="box-footer">
		<ul class="mailbox-attachments clearfix uploadedList"></ul>
		<button type="submit" class="btn btn-primary">Submit</button>
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
<!-- /.content-wrapper -->

<script type="text/javascript" src="/resources/js/upload.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

<script id="template" type="text/x-handlebars-template">
<li>
  <span class="mailbox-attachment-icon has-img"><img src="{{imgsrc}}" alt="Attachment"></span>
  <div class="mailbox-attachment-info">
	<a href="{{getLink}}" class="mailbox-attachment-name">{{fileName}}</a>
	<a href="{{fullName}}" 
     class="btn btn-default btn-xs pull-right delbtn"><i class="fa fa-fw fa-remove"></i></a>
	</span>
  </div>
</li>                
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
			function(event) { //최종적인 submit이 일어나게 되면 서버에는 사용자가 업로드한 파일의 정보를 같이 전송해줘야 함.
				event.preventDefault();//기본이벤트 해제
				
				if ($('#title').val().length == 0) { // 이름 길이가 0 이면 
					alert("제목은 필수 입력사항입니다");
					$('#title').focus();
					return;
				}

			
				var that = $(this);
				
				var str = "";
				$(".uploadedList .delbtn").each(
						function(index) {
							str += "<input type='hidden' name='files[" + index
									+ "]' value='" + $(this).attr("href")
									+ "'> ";
						}); //현재까지 업로드 된 파일들을 form태그의 내부에 히든타입으로 추가한다. 
				//각 파일은 files[0]과 같은 이름으로 추가되는데 이 배열 표시를 이용해서 컨트롤러에서는 BoardVO의 files 파라미터를 수집하게 된다.
				//모든 파일의 정보를 폼태그의 히든타입으로 생성한 후에는 폼태그의 데이터의 submit()을 호출해서 서버를 호출.
				
						
				that.append(str);

				that.get(0).submit(); // get(0)은 순수한 DOM객체를 얻어내기 위함.
			});
</script>

<br><br>
	
<!-- 본문 내용  끝-->
	
</div>
       
</div>
</div>


<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>