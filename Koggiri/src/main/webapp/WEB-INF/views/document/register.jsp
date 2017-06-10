<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="/resources/plugins/ckeditor/ckeditor.js"></script>

<!-- Bootstrap 3.3.4 -->
    <link href="/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <!-- Font Awesome Icons -->
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <!-- Ionicons -->
    <link href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <!-- Theme style -->
    <link href="/resources/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <!-- AdminLTE Skins. Choose a skin from the css/skins 
         folder instead of downloading all of them to reduce the load. -->
    <link href="/resources/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />

<%@ include file="../include/header.jsp"%>


<link rel="stylesheet" href="/resources/Content/themes/real/ui_sub.css" />
<link href="/resources/Content/themes/base/jquery-ui.min.css" rel="stylesheet" type="text/css" />


<style>
.fileDrop {
	width: 80%;
	height: 100px;
	border: 1px dotted gray;
	background-color: lightslategrey;
	margin: auto;
}
</style>


<div class="container_wrap" style="background-color: #ffffff;">
<div id="container">

<div id="sub_menu_title">
<h1><img src="/resources/img/s_menu10.png"/></h1>
<div class="sub_top">   
    <span><a href="/main">홈</a>  <span> &gt; </span> <a href="#">전자 문서</a>  &gt;  <strong>문서함</strong></span>
</div>
</div>


<div id="lnb">
   <div class="lnb01">
      <strong class="menu02"><span>전자문서</span></strong>
      <ul>
                <li class="menu01">
                    <a href="#">업무보고</a>
                    <ul> </ul>
                </li>
                <li class="menu02 ">
                    <a href="/chart/listAll">전자결재</a>
                    <ul>
                      <li class="sub01 "><a href="#">보낸결재</a></li>
                      <li class="sub02 "><a href="#">받은결재</a></li>
                      <li class="sub03 "><a href="#">결제입력</a></li>
                    </ul>
                </li>
                 <li class="menu03 ">
                    <a href="/chart/listAll">문서함</a>
  					<ul></ul>
                </li>
           </ul>
   </div>
</div>

<div id="sub_content" align="center">
<div class="row">
		<!-- left column -->
		<div class="col-md-12">
			<!-- general form elements -->
			<div class="box box-primary">
				<div class="box-header">
					<h3 class="box-title" align="left" style="font-size: 16px"><strong>문서게시판 등록하기</strong></h3><br><br><br>
				</div>
				<!-- /.box-header -->

				<form id='registerForm' role="form" method="post">
					<input type="hidden" name="f_emp_id" value="${mem_id}">
					<div class="box-body">
						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputEmail1">제목</label><br><br>
							 <input type="text"
								name='f_title' value="" id="title" class="form-control"
								placeholder="제목을 입력하세요">
						</div>
						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputPassword1">내용</label><br><br>
							<textarea class="form-control" name="f_content" rows="3"
								placeholder="내용을 입력하세요"></textarea>
							<script type="text/javascript">
								CKEDITOR
										.replace(
												'f_content',
												{
													'filebrowserUploadUrl' : '/ckeditor/upload.jsp?'
															+ 'realUrl=http://www.localhost.com/서버업로드될디렉토리명'
															+ '&realDir=서버업로드될디렉토리명'
												});
							</script>

						</div>
						<div class="form-group" align="left" style="font-size: 14px">
							<label for="exampleInputEmail1">작성자</label><br><br> 
							<input type="text"
								value="${emp_nm }" name="f_emp_nm" class="form-control"
								placeholder="Enter Writer" readonly="readonly">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1">파일첨부하기</label><br><br>
							<div class="fileDrop"></div>
						</div>
					</div>

					<!-- /.box-body -->

					<div class="box-footer">
						<div>
							<hr>
						</div>

						<ul class="mailbox-attachments clearfix uploadedList">
						</ul>

						<button type="submit" class="btn btn-primary">등록하기</button>

					</div>
				</form>


			</div>
			<!-- /.box -->
		</div>
		<!--/.col (left) -->

	</div>

	</div>


</div>
</div>


<!-- 본문 끝 -->

<div class="footer_wrap" >
<div id="footer" style="height: 150px">
<%@ include file="../include/footer.jsp"%>





<script type="text/javascript" src="/resources/js/upload.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/3.0.1/handlebars.js"></script>

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

	$("#registerForm").submit(function(event) { //최종적인 submit이 일어나게 되면 서버에는 사용자가 업로드한 파일의 정보를 같이 전송해줘야 함.
				event.preventDefault();//기본이벤트 해제

				if ($('#title').val().length == 0) { // 이름 길이가 0 이면 
					alert("제목은 필수 입력사항입니다");
					$('#title').focus();
					return;
				}

				var that = $(this);

				var str = "";
				$(".uploadedList .delbtn").each(function(index){
					 str += "<input type='hidden' name='files["+index+"]' value='"+$(this).attr("href") +"'> ";
				});//현재까지 업로드 된 파일들을 form태그의 내부에 히든타입으로 추가한다. 
				//각 파일은 files[0]과 같은 이름으로 추가되는데 이 배열 표시를 이용해서 컨트롤러에서는 BoardVO의 files 파라미터를 수집하게 된다.
				//모든 파일의 정보를 폼태그의 히든타입으로 생성한 후에는 폼태그의 데이터의 submit()을 호출해서 서버를 호출.
				
				if(str==""){//파일이 첨부되지않으면 경고창 띄우기
					alert("첨부된 파일이 존재하지 않습니다.");
					return;
				}else{
					alert("파일을 첨부합니다.");
				}
				that.append(str);

				that.get(0).submit(); // get(0)은 순수한 DOM객체를 얻어내기 위함.

			});
</script>


